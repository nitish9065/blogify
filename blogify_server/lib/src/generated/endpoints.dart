/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/blog_endpoint.dart' as _i2;
import '../endpoints/category_endpoint.dart' as _i3;
import '../endpoints/comment_endpoint.dart' as _i4;
import '../endpoints/example_endpoint.dart' as _i5;
import '../endpoints/tag_endpoint.dart' as _i6;
import '../endpoints/user_endpoint.dart' as _i7;
import 'package:blogify_server/src/generated/dtos/create_blog_dto.dart' as _i8;
import 'package:blogify_server/src/generated/post_status.dart' as _i9;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i10;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'blog': _i2.BlogEndpoint()
        ..initialize(
          server,
          'blog',
          null,
        ),
      'category': _i3.CategoryEndpoint()
        ..initialize(
          server,
          'category',
          null,
        ),
      'comment': _i4.CommentEndpoint()
        ..initialize(
          server,
          'comment',
          null,
        ),
      'example': _i5.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'tag': _i6.TagEndpoint()
        ..initialize(
          server,
          'tag',
          null,
        ),
      'user': _i7.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
    };
    connectors['blog'] = _i1.EndpointConnector(
      name: 'blog',
      endpoint: endpoints['blog']!,
      methodConnectors: {
        'uploadBlog': _i1.MethodConnector(
          name: 'uploadBlog',
          params: {
            'blogDto': _i1.ParameterDescription(
              name: 'blogDto',
              type: _i1.getType<_i8.CreateBlogDto>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['blog'] as _i2.BlogEndpoint).uploadBlog(
            session,
            params['blogDto'],
          ),
        ),
        'paginateBlogs': _i1.MethodConnector(
          name: 'paginateBlogs',
          params: {
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i9.PostStatus?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['blog'] as _i2.BlogEndpoint).paginateBlogs(
            session,
            page: params['page'],
            limit: params['limit'],
            categoryId: params['categoryId'],
            userId: params['userId'],
            status: params['status'],
          ),
        ),
        'getLatestBlogs': _i1.MethodConnector(
          name: 'getLatestBlogs',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['blog'] as _i2.BlogEndpoint).getLatestBlogs(session),
        ),
        'deleteBlog': _i1.MethodConnector(
          name: 'deleteBlog',
          params: {
            'blogId': _i1.ParameterDescription(
              name: 'blogId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['blog'] as _i2.BlogEndpoint).deleteBlog(
            session,
            params['blogId'],
          ),
        ),
        'streamBlogCount': _i1.MethodStreamConnector(
          name: 'streamBlogCount',
          params: {
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i9.PostStatus>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['blog'] as _i2.BlogEndpoint).streamBlogCount(
            session,
            params['status'],
          ),
        ),
      },
    );
    connectors['category'] = _i1.EndpointConnector(
      name: 'category',
      endpoint: endpoints['category']!,
      methodConnectors: {
        'getCategory': _i1.MethodConnector(
          name: 'getCategory',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i3.CategoryEndpoint).getCategory(
            session,
            params['limit'],
            params['page'],
          ),
        ),
        'searchCategories': _i1.MethodConnector(
          name: 'searchCategories',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i3.CategoryEndpoint).searchCategories(
            session,
            params['name'],
          ),
        ),
        'createCategory': _i1.MethodConnector(
          name: 'createCategory',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i3.CategoryEndpoint).createCategory(
            session,
            params['name'],
          ),
        ),
        'deleteTag': _i1.MethodConnector(
          name: 'deleteTag',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i3.CategoryEndpoint).deleteTag(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['comment'] = _i1.EndpointConnector(
      name: 'comment',
      endpoint: endpoints['comment']!,
      methodConnectors: {
        'paginateComment': _i1.MethodConnector(
          name: 'paginateComment',
          params: {
            'postId': _i1.ParameterDescription(
              name: 'postId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'parentCommentId': _i1.ParameterDescription(
              name: 'parentCommentId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['comment'] as _i4.CommentEndpoint).paginateComment(
            session,
            params['postId'],
            params['page'],
            params['limit'],
            params['parentCommentId'],
          ),
        ),
        'postComment': _i1.MethodConnector(
          name: 'postComment',
          params: {
            'postId': _i1.ParameterDescription(
              name: 'postId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'comment': _i1.ParameterDescription(
              name: 'comment',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'parentCommentId': _i1.ParameterDescription(
              name: 'parentCommentId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['comment'] as _i4.CommentEndpoint).postComment(
            session,
            params['postId'],
            params['userId'],
            params['comment'],
            params['parentCommentId'],
          ),
        ),
        'updateComment': _i1.MethodConnector(
          name: 'updateComment',
          params: {
            'content': _i1.ParameterDescription(
              name: 'content',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'commentId': _i1.ParameterDescription(
              name: 'commentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['comment'] as _i4.CommentEndpoint).updateComment(
            session,
            params['content'],
            params['commentId'],
          ),
        ),
        'deleteComment': _i1.MethodConnector(
          name: 'deleteComment',
          params: {
            'commentId': _i1.ParameterDescription(
              name: 'commentId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['comment'] as _i4.CommentEndpoint).deleteComment(
            session,
            params['commentId'],
          ),
        ),
        'streamCommentCountOfPost': _i1.MethodStreamConnector(
          name: 'streamCommentCountOfPost',
          params: {
            'postId': _i1.ParameterDescription(
              name: 'postId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['comment'] as _i4.CommentEndpoint)
                  .streamCommentCountOfPost(
            session,
            params['postId'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i5.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['tag'] = _i1.EndpointConnector(
      name: 'tag',
      endpoint: endpoints['tag']!,
      methodConnectors: {
        'paginateTags': _i1.MethodConnector(
          name: 'paginateTags',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tag'] as _i6.TagEndpoint).paginateTags(
            session,
            params['limit'],
            params['page'],
          ),
        ),
        'searchTags': _i1.MethodConnector(
          name: 'searchTags',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tag'] as _i6.TagEndpoint).searchTags(
            session,
            params['name'],
          ),
        ),
        'createTag': _i1.MethodConnector(
          name: 'createTag',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tag'] as _i6.TagEndpoint).createTag(
            session,
            params['name'],
          ),
        ),
        'deleteTag': _i1.MethodConnector(
          name: 'deleteTag',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tag'] as _i6.TagEndpoint).deleteTag(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'isEmailAvailable': _i1.MethodConnector(
          name: 'isEmailAvailable',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).isEmailAvailable(
            session,
            params['email'],
          ),
        ),
        'currentUser': _i1.MethodConnector(
          name: 'currentUser',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).currentUser(session),
        ),
        'getUserStats': _i1.MethodConnector(
          name: 'getUserStats',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).getUserStats(
            session,
            params['userId'],
          ),
        ),
        'followUnfollowUser': _i1.MethodConnector(
          name: 'followUnfollowUser',
          params: {
            'subscriberId': _i1.ParameterDescription(
              name: 'subscriberId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'subscribedToId': _i1.ParameterDescription(
              name: 'subscribedToId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).followUnfollowUser(
            session,
            params['subscriberId'],
            params['subscribedToId'],
          ),
        ),
        'getStats': _i1.MethodStreamConnector(
          name: 'getStats',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['user'] as _i7.UserEndpoint).getStats(
            session,
            params['userId'],
          ),
        ),
        'isUserFollowing': _i1.MethodStreamConnector(
          name: 'isUserFollowing',
          params: {
            'subscriberId': _i1.ParameterDescription(
              name: 'subscriberId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'subscribedToId': _i1.ParameterDescription(
              name: 'subscribedToId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['user'] as _i7.UserEndpoint).isUserFollowing(
            session,
            params['subscriberId'],
            params['subscribedToId'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i10.Endpoints()..initializeEndpoints(server);
  }
}
