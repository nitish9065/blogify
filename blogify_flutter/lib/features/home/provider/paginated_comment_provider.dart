import 'dart:developer';

import 'package:blogify_client/blogify_client.dart';
import 'package:blogify_flutter/core/provider/client_provider.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paginated_comment_provider.g.dart';

@riverpod
class PaginatedComment extends _$PaginatedComment {
  final PagingController<int, CommentDto> pagingController =
      PagingController(firstPageKey: 1);

  @override
  PagingStatus build(int postId, int? parentCommentId) {
    pagingController.addStatusListener(
      (status) {
        state = status;
      },
    );
    pagingController.addPageRequestListener(
      (pageKey) {
        _fetchComment(
          pageKey: pageKey,
          parentCommentId: parentCommentId,
        );
      },
    );
    return PagingStatus.loadingFirstPage;
  }

  Future<void> _fetchComment(
      {required int pageKey, int limit = 10, int? parentCommentId}) async {
    try {
      // await Future.delayed(const Duration(seconds: 3));
      final data = await ref
          .read(clientProvider)
          .comment
          .paginateComment(postId, pageKey, limit, parentCommentId);

      if (data.hasMore) {
        pagingController.appendPage(data.comments, pageKey + 1);
      } else {
        pagingController.appendLastPage(data.comments);
      }
    } catch (e) {
      log(
        'Error occured while paginating comment...',
        error: e.toString(),
      );
    }
  }
}

final fetchInitialCommentsProvider = FutureProvider.autoDispose
    .family<PaginatedComments, PaginatedCommentArgs>(
        (ref, PaginatedCommentArgs args) async {
  try {
    final data = await ref.read(clientProvider).comment.paginateComment(
        args.postId, args.page, args.limit, args.parentCommentId);
    return data;
  } on ServerException catch (e) {
    log(
      'Error ${e.message}',
      error: e.error,
      stackTrace: StackTrace.fromString(e.stackTrace ?? ''),
    );
    throw e.message;
  } catch (e) {
    log('Error occured while fetching initial comments ${e.toString()}');
    throw 'Unknown error occured while fetching comments';
  }
});

class PaginatedCommentArgs {
  final int page;
  final int limit;
  final int postId;
  final int? parentCommentId;

  PaginatedCommentArgs(
      this.page, this.limit, this.postId, this.parentCommentId);
}
