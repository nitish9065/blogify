import 'package:blogify_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TagEndpoint extends Endpoint {

  Future<PaginatedTagDto> paginateTags(
      Session session, int limit, int page) async {
    try {
      var tags = <TagDto>[];

      final tagsCount = await Tag.db.count(session);
      // Query categories with blog counts
      final result = await session.db.unsafeQuery('''
    SELECT 
      t.id, 
      t.name, 
      COUNT(b.id) AS blog_count
    FROM tags t
    LEFT JOIN blogs_tags b ON t.id = b."tagId"
    GROUP BY t.id, t.name
    ORDER BY blog_count DESC
    LIMIT @limit OFFSET @offset
    ''',
          parameters: QueryParameters.named(
            {'limit': limit, 'offset': (page * limit) - limit},
          ));

      // Map results to DTOs
      tags
        ..clear()
        ..addAll(
          result.map((row) {
            final map = row.toColumnMap();
            return TagDto(
                id: map['id'] as int,
                name: map['name'] as String,
                postCount: map['blog_count'] as int);
          }).toList(),
        );

      var paginatedData = PaginatedTagDto(
        tags: tags,
        totalCount: tagsCount,
        currentPage: page,
        limit: limit,
        totalPage: (tagsCount / limit).ceil(),
        hasMore: (limit * page) < tagsCount,
      );
      print('fetched tags for page $page & total tags count $tagsCount');

      return paginatedData;
    } catch (e, stackTrace) {
      throw ServerException(
        message: 'Failed to fetch tags',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<List<TagDto>> searchTags(Session session, String name) async {
    try {
      var tags = <TagDto>[];
      final result = await session.db.unsafeQuery('''
    SELECT 
      t.id, 
      t.name, 
      COUNT(b.id) AS blog_count
    FROM tags t
    LEFT JOIN blogs_tags b ON t.id = b."tagId"
    WHERE t.name ILIKE '%' || @keyword || '%'
    GROUP BY t.id, t.name
    ''',
          parameters: QueryParameters.named(
            {'keyword': name},
          ));
      tags
        ..clear()
        ..addAll(
          result.map(
            (e) {
              final map = e.toColumnMap();
              return TagDto(
                  id: map['id'] as int,
                  name: map['name'] as String,
                  postCount: map['blog_count'] as int);
            },
          ),
        );
      print('fetched tags length is ${tags.length}');
      return tags;
    } catch (e, stackTrace) {
      throw ServerException(
        message: 'Failed to search tags',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<TagDto> createTag(Session session, String name) async {
    try {
      var tagExist = await Tag.db.findFirstRow(
        session,
        where: (p0) => p0.name.equals(name),
      );
      if (tagExist == null) {
        final tag = await Tag.db.insertRow(
          session,
          Tag(name: name),
        );
        return TagDto(
          id: tag.id!,
          name: tag.name,
          postCount: 0,
        );
      }
      return TagDto(id: tagExist.id!, name: tagExist.name, postCount: 0);
    } catch (e, stackTrace) {
      throw ServerException(
        message: 'Failed to create tag',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<void> deleteTag(Session session, int id) async {
    try {
      var tagexist = await Tag.db.findById(
        session,
        id,
        include: Tag.include(
          blogs: BlogTag.includeList(
            include: BlogTag.include(blog: Blog.include()),
            limit: 1,
          ),
        ),
      );
      if (tagexist == null) {
        throw ServerException(message: 'Tag not found with given id');
      } else {
        if (tagexist.blogs?.isNotEmpty ?? false) {
          throw ServerException(
            message:
                'Can not delete tags as it has multiple blogs associated with it!',
          );
        }
        await Tag.db.deleteRow(
          session,
          tagexist,
        );
      }
    } on ServerException catch (_) {
      rethrow;
    } catch (e, stackTrace) {
      throw ServerException(
        message: 'Failed to delete tag',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }
}
