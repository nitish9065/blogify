import 'package:blogify_server/src/utils/user_extension.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

import '../generated/protocol.dart';

class BlogEndpoint extends Endpoint {
  static final int _wordsPerMinute = 150;

  int _calculateReadingTime(String? content) {
    if (content == null || content.isEmpty) {
      return 0;
    }
    final wordCount = content
        .trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .length;

    // Calculate minutes using ceiling to round up partial minutes
    final minutes = (wordCount / _wordsPerMinute).ceil();

    // Ensure at least 1 minute for any non-empty content
    return minutes > 0 ? minutes : 0;
  }

  Future<void> uploadBlog(Session session, CreateBlogDto blogDto) async {
    try {
      final authInfo = await session.authenticated;
      if (authInfo == null) {
        session.log('Not authenticated...');
        throw ServerException(
            message: 'Not authenticated', error: 'User is not authenticated');
      }
      var blog = Blog(
        title: blogDto.title,
        content: blogDto.content,
        authorId: blogDto.userId,
        categoryId: blogDto.categoryId,
        status: blogDto.status,
        readingTime: 0,
      );
      final readTime = _calculateReadingTime(blog.content);
      blog.readingTime = readTime;

      if (blogDto.id != null && blogDto.id != 0) {
        blog.id = blogDto.id;
        await BlogTag.db.deleteWhere(
          session,
          where: (bt) => bt.blogId.equals(blogDto.id),
        );
        blog = await Blog.db.updateRow(session, blog);
      } else {
        blog = await Blog.db.insertRow(session, blog);
      }

      final tags = blogDto.tags.toSet().map(
        (tagId) {
          var blogtag = BlogTag(blogId: blog.id!, tagId: tagId);
          return blogtag;
        },
      ).toList();

      await BlogTag.db.insert(session, tags);
      await _updateBlogCountStream(session, PostStatus.draft);
      await _updateBlogCountStream(session, PostStatus.scheduled);
    } on ServerException catch (_) {
      rethrow;
    } catch (e, stackTrace) {
      session.log(
        'Error occured while creating blog',
        exception: e,
        stackTrace: stackTrace,
      );
      throw ServerException(
        message: 'Error occured while creating blog',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<PaginatedBlogDto> paginateBlogs(
    Session session, {
    required int page,
    required int limit,
    int categoryId = 0,
    int userId = 0,
    PostStatus? status,
  }) async {
    status ??= PostStatus.published;
    try {
      var blogDtos = <BlogDto>[];
      final blogCount = await Blog.db.count(
        session,
        where: categoryId != 0
            ? (blog) =>
                blog.categoryId.equals(categoryId) & blog.status.equals(status)
            : userId != 0
                ? (blog) =>
                    blog.author.id.equals(userId) & blog.status.equals(status)
                : (blog) => blog.status.equals(status),
      );

      var blogs = await Blog.db.find(
        session,
        limit: limit,
        where: categoryId != 0
            ? (blog) =>
                blog.categoryId.equals(categoryId) & blog.status.equals(status)
            : userId != 0
                ? (blog) =>
                    blog.author.id.equals(userId) & blog.status.equals(status)
                : (blog) => blog.status.equals(status),
        offset: (page * limit) - limit,
        orderBy: (p0) => p0.createdAt,
        orderDescending: true,
        include: Blog.include(
          author: AppUser.include(
            userInfo: UserInfo.include(),
          ),
          category: Category.include(),
          tags: BlogTag.includeList(
            limit: 4,
            include: BlogTag.include(
              tag: Tag.include(),
            ),
          ),
        ),
      );

      blogDtos
        ..clear()
        ..addAll(
          blogs.map(
            (blog) {
              var tags = blog.tags
                      ?.map(
                        (e) => e.tag?.toDto,
                      )
                      .toList()
                      .nonNulls
                      .toList() ??
                  <TagDto>[];
              var dto = BlogDto(
                id: blog.id!,
                title: blog.title,
                content: blog.content,
                author: blog.author!.toDto,
                tags: tags,
                category: blog.category!.toDto,
                readingTime: blog.readingTime,
                createdAt: blog.createdAt,
                updatedAt: blog.updatedAt,
                status: blog.status,
              );
              return dto;
            },
          ).toList(),
        );

      var paginatedBlogs = PaginatedBlogDto(
        blogs: blogDtos,
        totalCount: blogCount,
        limit: limit,
        totalPage: (blogCount / limit).ceil(),
        currentPage: page,
        hasMore: (page * limit) < blogCount,
      );
      return paginatedBlogs;
    } catch (e, stackTrace) {
      session.log(
        'Error occured while paginating blogs',
        exception: e,
        stackTrace: stackTrace,
      );
      throw ServerException(
        message: 'Error occured while paginating blogs',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<List<BlogDto>> getLatestBlogs(Session session) async {
    try {
      var blogDtos = <BlogDto>[];
      var blogs = await Blog.db.find(
        session,
        where: (p0) =>
            p0.status.equals(PostStatus.published) &
            (p0.createdAt >=
                DateTime.now().subtract(
                  const Duration(
                    hours: 48,
                  ),
                )),
        orderBy: (p0) => p0.createdAt,
        limit: 10,
        orderDescending: true,
        include: Blog.include(
          author: AppUser.include(
            userInfo: UserInfo.include(),
          ),
          category: Category.include(),
          tags: BlogTag.includeList(
            limit: 4,
            include: BlogTag.include(
              tag: Tag.include(),
            ),
          ),
        ),
      );

      blogDtos
        ..clear()
        ..addAll(
          blogs.map(
            (blog) {
              var tags = blog.tags
                      ?.map(
                        (e) => e.tag?.toDto,
                      )
                      .toList()
                      .nonNulls
                      .toList() ??
                  <TagDto>[];
              var dto = BlogDto(
                id: blog.id!,
                title: blog.title,
                content: blog.content,
                author: blog.author!.toDto,
                tags: tags,
                category: blog.category!.toDto,
                readingTime: blog.readingTime,
                createdAt: blog.createdAt,
                updatedAt: blog.updatedAt,
                status: blog.status,
              );
              return dto;
            },
          ).toList(),
        );

      return blogDtos;
    } catch (e, stackTrace) {
      session.log(
        'Error occured while fetching latest blogs',
        exception: e,
        stackTrace: stackTrace,
      );
      throw ServerException(
        message: 'Error occured while fetching latest blogs',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Stream<BlogCountByStatusDto> streamBlogCount(
      Session session, PostStatus status) async* {
    try {
      final data = await _getBlogCount(session, status);
      var countStream = session.messages.createStream<BlogCountByStatusDto>(
        '/users/${data['userId']}/blogs/count/$status',
      );
      yield BlogCountByStatusDto(count: data['count']!, status: status);
      await for (var blogCount in countStream) {
        yield blogCount;
      }
    } on ServerException catch (_) {
      rethrow;
    } catch (e, stackTrace) {
      session.log(
        'Error occured while fetching draft count for current user',
        exception: e,
        stackTrace: stackTrace,
      );
      throw ServerException(
        message: 'Error occured while fetching draft count for current user',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<void> deleteBlog(Session session, int blogId) async {
    try {
      final authInfo = await session.authenticated;
      if (authInfo == null) {
        session.log('Not authenticated...');
        throw ServerException(
            message: 'Not authenticated', error: 'User is not authenticated');
      }
      final blog = await Blog.db.findById(
        session,
        blogId,
        include: Blog.include(
          author: AppUser.include(
            userInfo: UserInfo.include(),
          ),
        ),
      );
      if (blog == null) {
        throw ServerException(message: 'Blog does not exist with provided id');
      }
      if (authInfo.userId != blog.author!.userInfoId) {
        throw ServerException(
            message: 'You are not allowed to delete this blog!');
      }
      await BlogTag.db.deleteWhere(
        session,
        where: (bt) => bt.blogId.equals(blogId),
      );
      await Blog.db.deleteRow(session, blog);
      await _updateBlogCountStream(session, blog.status);
    } on ServerException catch (_) {
      rethrow;
    } catch (e, stackTrace) {
      session.log(
        'Error occured while deleting blog with id $blogId',
        exception: e,
        stackTrace: stackTrace,
      );
      throw ServerException(
        message: 'Error occured while deleting blog with id $blogId',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<Map<String, int>> _getBlogCount(
      Session session, PostStatus status) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) {
      session.log('Not authenticated...');
      throw ServerException(
          message: 'Not authenticated', error: 'User is not authenticated');
    }
    final count = await Blog.db.count(
      session,
      where: (blog) =>
          blog.author.userInfoId.equals(authInfo.userId) &
          blog.status.equals(
            status,
          ),
    );
    return {'count': count, 'userId': authInfo.userId};
  }

  Future<void> _updateBlogCountStream(
      Session session, PostStatus status) async {
    final data = await _getBlogCount(session, status);
    await session.messages.postMessage(
      '/users/${data['userId']}/blogs/count/$status',
      BlogCountByStatusDto(count: data['count']!, status: status),
    );
  }
}
