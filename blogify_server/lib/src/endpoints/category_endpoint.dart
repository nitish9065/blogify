import 'package:blogify_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CategoryEndpoint extends Endpoint {
  Future<PaginatedCategoryDto> getCategory(
      Session session, int limit, int page) async {
    try {
      var categories = <CategoryDto>[];

      final categoryCount = await Category.db.count(session);
      // Query categories with blog counts
      final result = await session.db.unsafeQuery('''
    SELECT 
      c.id, 
      c.name, 
      c.icon,
      COUNT(CASE WHEN b."status" = @status THEN 1 ELSE NULL END) AS blog_count
    FROM categories c
    LEFT JOIN blogs b ON c.id = b."categoryId"
    GROUP BY c.id, c.name
    ORDER BY blog_count DESC
    LIMIT @limit OFFSET @offset
    
    ''',
          parameters: QueryParameters.named(
            {
              'limit': limit,
              'offset': (page * limit) - limit,
              'status': PostStatus.published.name,
            },
          ));

      // Map results to DTOs
      categories
        ..clear()
        ..addAll(
          result.map((row) {
            final map = row.toColumnMap();
            return CategoryDto(
                id: map['id'] as int,
                name: map['name'] as String,
                icon: map['icon'] as String?,
                postCount: map['blog_count'] as int);
          }).toList(),
        );
      if (page == 1) {
        final blogCounts = await Blog.db.count(
          session,
          where: (p0) => p0.status.equals(PostStatus.published),
        );
        categories.insert(0,
            CategoryDto(id: 0, name: 'All', postCount: blogCounts, icon: '📊'));
      }
      var paginatedData = PaginatedCategoryDto(
        categories: categories,
        totalCount: categoryCount,
        currentPage: page,
        limit: limit,
        totalPage: (categoryCount / limit).ceil(),
        hasMore: (limit * page) < categoryCount,
      );
      return paginatedData;
    } catch (e, stackTrace) {
      throw ServerException(
        message: 'Failed to fetch categories',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<List<CategoryDto>> searchCategories(
      Session session, String name) async {
    try {
      var categories = <CategoryDto>[];
      final result = await session.db.unsafeQuery('''
    SELECT 
      c.id, 
      c.name, 
      c.icon,
      COUNT(b.id) AS blog_count
    FROM categories c
    LEFT JOIN blogs b ON c.id = b."categoryId"
    WHERE c.name ILIKE '%' || @keyword || '%'
    GROUP BY c.id, c.name
    ''',
          parameters: QueryParameters.named(
            {'keyword': name},
          ));

      // Map results to DTOs
      categories
        ..clear()
        ..addAll(
          result.map((row) {
            final map = row.toColumnMap();
            return CategoryDto(
                id: map['id'] as int,
                name: map['name'] as String,
                icon: map['icon'] as String?,
                postCount: map['blog_count'] as int);
          }).toList(),
        );
      print('categoris fetched is ${categories.length}');
      return categories;
    } catch (e, stackTrace) {
      throw ServerException(
        message: 'Failed to search categories',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<CategoryDto> createCategory(Session session, String name) async {
    try {
      var categoryExist = await Category.db.findFirstRow(
        session,
        where: (p0) => p0.name.equals(name),
      );
      if (categoryExist == null) {
        final category = await Category.db.insertRow(
          session,
          Category(name: name),
        );
        return CategoryDto(
          id: category.id!,
          name: category.name,
          postCount: 0,
        );
      }
      return CategoryDto(
          id: categoryExist.id!, name: categoryExist.name, postCount: 0);
    } catch (e, stackTrace) {
      throw ServerException(
        message: 'Failed to create category!',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<void> deleteTag(Session session, int id) async {
    try {
      var categoryExist = await Category.db.findById(
        session,
        id,
        include: Category.include(
          blogs: Blog.includeList(
            limit: 1,
          ),
        ),
      );
      if (categoryExist == null) {
        throw ServerException(message: 'Category not found with given id');
      } else {
        if (categoryExist.blogs?.isNotEmpty ?? false) {
          throw ServerException(
            message:
                'Can not delete category as it has multiple blogs associated with it!',
          );
        }
        await Category.db.deleteRow(
          session,
          categoryExist,
        );
      }
    } on ServerException catch (_) {
      rethrow;
    } catch (e, stackTrace) {
      throw ServerException(
        message: 'Failed to delete category',
        error: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }
}
