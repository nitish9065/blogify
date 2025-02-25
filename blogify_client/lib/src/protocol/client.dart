/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:blogify_client/src/protocol/dtos/create_blog_dto.dart' as _i3;
import 'package:blogify_client/src/protocol/dtos/paginated_blog_dto.dart'
    as _i4;
import 'package:blogify_client/src/protocol/post_status.dart' as _i5;
import 'package:blogify_client/src/protocol/dtos/blog_sto.dart' as _i6;
import 'package:blogify_client/src/protocol/dtos/blog_count_by_status_dto.dart'
    as _i7;
import 'package:blogify_client/src/protocol/dtos/paginated_category_dto.dart'
    as _i8;
import 'package:blogify_client/src/protocol/dtos/category_dto.dart' as _i9;
import 'package:blogify_client/src/protocol/dtos/paginated_comment.dart'
    as _i10;
import 'package:blogify_client/src/protocol/dtos/comment_count_value_dto.dart'
    as _i11;
import 'package:blogify_client/src/protocol/dtos/paginated_tag_dto.dart'
    as _i12;
import 'package:blogify_client/src/protocol/dtos/tag_dto.dart' as _i13;
import 'package:blogify_client/src/protocol/dtos/user_dto.dart' as _i14;
import 'package:blogify_client/src/protocol/dtos/user_stats.dart' as _i15;
import 'package:blogify_client/src/protocol/dtos/user_following_stat.dart'
    as _i16;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i17;
import 'protocol.dart' as _i18;

/// {@category Endpoint}
class EndpointBlog extends _i1.EndpointRef {
  EndpointBlog(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'blog';

  _i2.Future<void> uploadBlog(_i3.CreateBlogDto blogDto) =>
      caller.callServerEndpoint<void>(
        'blog',
        'uploadBlog',
        {'blogDto': blogDto},
      );

  _i2.Future<_i4.PaginatedBlogDto> paginateBlogs({
    required int page,
    required int limit,
    required int categoryId,
    required int userId,
    _i5.PostStatus? status,
  }) =>
      caller.callServerEndpoint<_i4.PaginatedBlogDto>(
        'blog',
        'paginateBlogs',
        {
          'page': page,
          'limit': limit,
          'categoryId': categoryId,
          'userId': userId,
          'status': status,
        },
      );

  _i2.Future<List<_i6.BlogDto>> getLatestBlogs() =>
      caller.callServerEndpoint<List<_i6.BlogDto>>(
        'blog',
        'getLatestBlogs',
        {},
      );

  _i2.Stream<_i7.BlogCountByStatusDto> streamBlogCount(_i5.PostStatus status) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i7.BlogCountByStatusDto>,
          _i7.BlogCountByStatusDto>(
        'blog',
        'streamBlogCount',
        {'status': status},
        {},
      );

  _i2.Future<void> deleteBlog(int blogId) => caller.callServerEndpoint<void>(
        'blog',
        'deleteBlog',
        {'blogId': blogId},
      );
}

/// {@category Endpoint}
class EndpointCategory extends _i1.EndpointRef {
  EndpointCategory(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'category';

  _i2.Future<_i8.PaginatedCategoryDto> getCategory(
    int limit,
    int page,
  ) =>
      caller.callServerEndpoint<_i8.PaginatedCategoryDto>(
        'category',
        'getCategory',
        {
          'limit': limit,
          'page': page,
        },
      );

  _i2.Future<List<_i9.CategoryDto>> searchCategories(String name) =>
      caller.callServerEndpoint<List<_i9.CategoryDto>>(
        'category',
        'searchCategories',
        {'name': name},
      );

  _i2.Future<_i9.CategoryDto> createCategory(String name) =>
      caller.callServerEndpoint<_i9.CategoryDto>(
        'category',
        'createCategory',
        {'name': name},
      );

  _i2.Future<void> deleteTag(int id) => caller.callServerEndpoint<void>(
        'category',
        'deleteTag',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointComment extends _i1.EndpointRef {
  EndpointComment(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'comment';

  _i2.Future<_i10.PaginatedComments> paginateComment(
    int postId,
    int page,
    int limit,
    int? parentCommentId,
  ) =>
      caller.callServerEndpoint<_i10.PaginatedComments>(
        'comment',
        'paginateComment',
        {
          'postId': postId,
          'page': page,
          'limit': limit,
          'parentCommentId': parentCommentId,
        },
      );

  _i2.Future<void> postComment(
    int postId,
    int userId,
    String comment,
    int? parentCommentId,
  ) =>
      caller.callServerEndpoint<void>(
        'comment',
        'postComment',
        {
          'postId': postId,
          'userId': userId,
          'comment': comment,
          'parentCommentId': parentCommentId,
        },
      );

  _i2.Future<void> updateComment(
    String content,
    int commentId,
  ) =>
      caller.callServerEndpoint<void>(
        'comment',
        'updateComment',
        {
          'content': content,
          'commentId': commentId,
        },
      );

  _i2.Future<void> deleteComment(int commentId) =>
      caller.callServerEndpoint<void>(
        'comment',
        'deleteComment',
        {'commentId': commentId},
      );

  _i2.Stream<_i11.CommentCountStream> streamCommentCountOfPost(int postId) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i11.CommentCountStream>,
          _i11.CommentCountStream>(
        'comment',
        'streamCommentCountOfPost',
        {'postId': postId},
        {},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointTag extends _i1.EndpointRef {
  EndpointTag(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'tag';

  _i2.Future<_i12.PaginatedTagDto> paginateTags(
    int limit,
    int page,
  ) =>
      caller.callServerEndpoint<_i12.PaginatedTagDto>(
        'tag',
        'paginateTags',
        {
          'limit': limit,
          'page': page,
        },
      );

  _i2.Future<List<_i13.TagDto>> searchTags(String name) =>
      caller.callServerEndpoint<List<_i13.TagDto>>(
        'tag',
        'searchTags',
        {'name': name},
      );

  _i2.Future<_i13.TagDto> createTag(String name) =>
      caller.callServerEndpoint<_i13.TagDto>(
        'tag',
        'createTag',
        {'name': name},
      );

  _i2.Future<void> deleteTag(int id) => caller.callServerEndpoint<void>(
        'tag',
        'deleteTag',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<bool> isEmailAvailable(String email) =>
      caller.callServerEndpoint<bool>(
        'user',
        'isEmailAvailable',
        {'email': email},
      );

  _i2.Future<_i14.UserDto?> currentUser() =>
      caller.callServerEndpoint<_i14.UserDto?>(
        'user',
        'currentUser',
        {},
      );

  _i2.Stream<_i15.UserStats> getStats(int userId) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i15.UserStats>,
          _i15.UserStats>(
        'user',
        'getStats',
        {'userId': userId},
        {},
      );

  _i2.Future<_i15.UserStats> getUserStats(int userId) =>
      caller.callServerEndpoint<_i15.UserStats>(
        'user',
        'getUserStats',
        {'userId': userId},
      );

  _i2.Future<void> followUnfollowUser(
    int subscriberId,
    int subscribedToId,
  ) =>
      caller.callServerEndpoint<void>(
        'user',
        'followUnfollowUser',
        {
          'subscriberId': subscriberId,
          'subscribedToId': subscribedToId,
        },
      );

  _i2.Stream<_i16.UserFollowingStat> isUserFollowing(
    int subscriberId,
    int subscribedToId,
  ) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i16.UserFollowingStat>,
          _i16.UserFollowingStat>(
        'user',
        'isUserFollowing',
        {
          'subscriberId': subscriberId,
          'subscribedToId': subscribedToId,
        },
        {},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i17.Caller(client);
  }

  late final _i17.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i18.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    blog = EndpointBlog(this);
    category = EndpointCategory(this);
    comment = EndpointComment(this);
    example = EndpointExample(this);
    tag = EndpointTag(this);
    user = EndpointUser(this);
    modules = Modules(this);
  }

  late final EndpointBlog blog;

  late final EndpointCategory category;

  late final EndpointComment comment;

  late final EndpointExample example;

  late final EndpointTag tag;

  late final EndpointUser user;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'blog': blog,
        'category': category,
        'comment': comment,
        'example': example,
        'tag': tag,
        'user': user,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
