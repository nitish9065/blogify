import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class CommentEndpoint extends Endpoint {
  Future<PaginatedComments> paginateComment(Session session, int postId,
      int page, int limit, int? parentCommentId) async {
    try {
      final commentCount = await Comment.db.count(
        session,
        where: (p0) =>
            p0.postId.equals(postId) &
            p0.repliedOnCommentId.equals(parentCommentId),
      );

      var comments = <CommentDto>[];

      var result = await session.db.unsafeQuery(
        r'''
SELECT 
    c.id AS comment_id,
    c.content AS comment_content,
    c."postId" AS post_id,
    c."updatedAt" AS updated_at,
    au.id AS app_user_id,
    ui."userName" AS user_name,
    ui."imageUrl" AS user_image_url,
    CASE 
        WHEN @parentCommentId::integer IS NULL THEN 
            (SELECT COUNT(*) FROM comments r WHERE r."repliedOnCommentId" = c.id)
        ELSE 
            NULL
    END AS reply_count
FROM comments c
LEFT JOIN app_users au ON c."ownerId" = au.id
LEFT JOIN serverpod_user_info ui ON au.id = ui.id
WHERE c."postId" = @postId 
    AND (
        (@parentCommentId::integer IS NULL AND c."repliedOnCommentId" IS NULL) 
        OR 
        (@parentCommentId::integer IS NOT NULL AND c."repliedOnCommentId" = @parentCommentId::integer)
    )
ORDER BY c."updatedAt" DESC
LIMIT @limit OFFSET @offset
  ''',
        parameters: QueryParameters.named(
          {
            'postId': postId,
            'limit': limit,
            'offset': (page * limit) - limit,
            'parentCommentId': parentCommentId,
          },
        ),
      );

      comments
        ..clear()
        ..addAll(
          result.map(
            (row) {
              final map = row.toColumnMap();
              return CommentDto(
                id: map['comment_id'],
                content: map['comment_content'],
                owner: UserDto(
                  id: map['app_user_id'],
                  name: map['user_name'],
                  profileUrl: map['user_image_url'],
                ),
                postId: map['post_id'],
                repliesCount: map['reply_count'] ?? 0,
                updatedAt: map['updated_at'],
              );
            },
          ),
        );

      return PaginatedComments(
        comments: comments,
        totalCount: commentCount,
        limit: limit,
        totalPage: (commentCount / limit).ceil(),
        currentPage: page,
        hasMore: (page * limit) < commentCount,
      );
    } catch (e, stackTrace) {
      session.log(
        'Error occured while paginating comments',
        exception: e,
        stackTrace: stackTrace,
      );
      throw ServerException(
        message: 'Failed to fetch comments for post Id $postId',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<void> postComment(Session session, int postId, int userId,
      String comment, int? parentCommentId) async {
    try {
      final authInfo = await session.authenticated;
      if (authInfo == null) {
        session.log('Not authenticated...');
        throw ServerException(
            message: 'Not authenticated', error: 'User is not authenticated');
      }
      await Comment.db.insertRow(
        session,
        Comment(
          content: comment,
          ownerId: userId,
          postId: postId,
          repliedOnCommentId: parentCommentId,
        ),
      );
      await _updateCommentCountStream(session, postId);
      return;
    } on ServerException catch (_) {
      rethrow;
    } catch (e, stackTrace) {
      throw ServerException(
        message: 'Failed to post comments for post Id $postId',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<void> updateComment(
      Session session, String content, int commentId) async {
    try {
      var comment = await _authorizeOperation(session, commentId, false);
      comment = comment.copyWith(content: content);
      await Comment.db.updateRow(session, comment);
    } on ServerException {
      rethrow;
    } catch (e, stackTrace) {
      session.log(
        'Error occured while deleting comment $commentId',
        exception: e,
        stackTrace: stackTrace,
      );
      throw ServerException(
        message: 'Error occured while deleting comment $commentId',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<void> deleteComment(Session session, int commentId) async {
    try {
      final comment = await _authorizeOperation(session, commentId, false);
      await Comment.db.deleteRow(session, comment);
      await _updateCommentCountStream(session, comment.postId);
    } on ServerException {
      rethrow;
    } catch (e, stackTrace) {
      session.log(
        'Error occured while deleting comment $commentId',
        exception: e,
        stackTrace: stackTrace,
      );
      throw ServerException(
        message: 'Error occured while deleting comment $commentId',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<Comment> _authorizeOperation(
      Session session, int commentId, bool forUpdate) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) {
      session.log('Not authenticated...');
      throw ServerException(
          message: 'Not authenticated', error: 'User is not authenticated');
    }
    final userInfoId = authInfo.userId;

    final comment = await Comment.db.findById(
      session,
      commentId,
    );
    if (comment == null) {
      session.log('Comment not found with id $commentId');
      throw ServerException(
          message: 'Comment not found',
          error: 'Comment with id $commentId not found in db');
    }

    final postAvailable = await Blog.db.findById(session, comment.postId);

    if (postAvailable == null) {
      session.log('Post not found for provided commentId');
      throw ServerException(
          message: 'Post not found for given commentId',
          error: 'Post not found in DB for given commentId $commentId');
    }
    // user for current authenticated
    final currentUser = await AppUser.db.findFirstRow(
      session,
      where: (p0) => p0.userInfoId.equals(userInfoId),
    );

    if (currentUser == null) {
      session.log(
        'User not found with currently authenticated id in session',
      );
      throw ServerException(
          message: "Can't find user with authenticated id",
          error: 'User not found with currently authenticated id in session');
    }
    if (currentUser.id != comment.ownerId &&
        (forUpdate ? true : currentUser.id != postAvailable.authorId)) {
      throw ServerException(
        message: 'UnAuthorized to delete comment',
        error:
            'User with ${currentUser.id} tried to delete comment with id $commentId',
      );
    }
    return comment;
  }

  Stream<CommentCountStream> streamCommentCountOfPost(
      Session session, int postId) async* {
    try {
      var countChannel = session.messages
          .createStream<CommentCountStream>('posts/$postId/comment/counts');
      final count = await Comment.db.count(
        session,
        where: (p0) =>
            p0.postId.equals(postId) & p0.repliedOnCommentId.equals(null),
      );
      yield CommentCountStream(count: count);
      await for (var commentCount in countChannel) {
        yield commentCount;
      }
    } catch (e, stackTrace) {
      session.log(
        'Failed to stream comment counts for postId $postId',
        exception: e,
        stackTrace: stackTrace,
      );
      throw ServerException(
        message: 'Failed to stream comment counts for post Id $postId',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<void> _updateCommentCountStream(Session session, int postId) async {
    try {
      final count = await Comment.db.count(
        session,
        where: (p0) =>
            p0.postId.equals(postId) & p0.repliedOnCommentId.equals(null),
      );
      session.messages.postMessage(
        'posts/$postId/comment/counts',
        CommentCountStream(count: count),
      );
    } catch (e) {
      session.log('Failed to update commentCount stream for postId $postId');
    }
  }
}
