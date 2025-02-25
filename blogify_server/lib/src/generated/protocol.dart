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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'dtos/blog_count_by_status_dto.dart' as _i4;
import 'dtos/blog_sto.dart' as _i5;
import 'dtos/category_dto.dart' as _i6;
import 'dtos/comment_count_value_dto.dart' as _i7;
import 'dtos/comment_dto.dart' as _i8;
import 'dtos/create_blog_dto.dart' as _i9;
import 'dtos/paginated_blog_dto.dart' as _i10;
import 'dtos/paginated_category_dto.dart' as _i11;
import 'dtos/paginated_comment.dart' as _i12;
import 'dtos/paginated_tag_dto.dart' as _i13;
import 'dtos/server_exception.dart' as _i14;
import 'dtos/tag_dto.dart' as _i15;
import 'dtos/user_dto.dart' as _i16;
import 'dtos/user_following_stat.dart' as _i17;
import 'dtos/user_stats.dart' as _i18;
import 'app_user.dart' as _i19;
import 'blog.dart' as _i20;
import 'blog_tag.dart' as _i21;
import 'category.dart' as _i22;
import 'comment.dart' as _i23;
import 'example.dart' as _i24;
import 'member..dart' as _i25;
import 'post_status.dart' as _i26;
import 'tag.dart' as _i27;
import 'package:blogify_server/src/generated/dtos/blog_sto.dart' as _i28;
import 'package:blogify_server/src/generated/dtos/category_dto.dart' as _i29;
import 'package:blogify_server/src/generated/dtos/tag_dto.dart' as _i30;
export 'dtos/blog_count_by_status_dto.dart';
export 'dtos/blog_sto.dart';
export 'dtos/category_dto.dart';
export 'dtos/comment_count_value_dto.dart';
export 'dtos/comment_dto.dart';
export 'dtos/create_blog_dto.dart';
export 'dtos/paginated_blog_dto.dart';
export 'dtos/paginated_category_dto.dart';
export 'dtos/paginated_comment.dart';
export 'dtos/paginated_tag_dto.dart';
export 'dtos/server_exception.dart';
export 'dtos/tag_dto.dart';
export 'dtos/user_dto.dart';
export 'dtos/user_following_stat.dart';
export 'dtos/user_stats.dart';
export 'app_user.dart';
export 'blog.dart';
export 'blog_tag.dart';
export 'category.dart';
export 'comment.dart';
export 'example.dart';
export 'member..dart';
export 'post_status.dart';
export 'tag.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'app_users',
      dartName: 'AppUser',
      schema: 'public',
      module: 'blogify',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'app_users_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'bio',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'app_users_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'app_users_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'app_user_unique_userInfo',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userInfoId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'blogs',
      dartName: 'Blog',
      schema: 'public',
      module: 'blogify',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'blogs_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'authorId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'categoryId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:PostStatus',
        ),
        _i2.ColumnDefinition(
          name: 'readingTime',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'nextId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'blogs_fk_0',
          columns: ['authorId'],
          referenceTable: 'app_users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'blogs_fk_1',
          columns: ['categoryId'],
          referenceTable: 'categories',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'blogs_fk_2',
          columns: ['nextId'],
          referenceTable: 'blogs',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'blogs_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'next_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'nextId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'blogs_tags',
      dartName: 'BlogTag',
      schema: 'public',
      module: 'blogify',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'blogs_tags_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'blogId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'tagId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'blogs_tags_fk_0',
          columns: ['blogId'],
          referenceTable: 'blogs',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'blogs_tags_fk_1',
          columns: ['tagId'],
          referenceTable: 'tags',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'blogs_tags_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'blog_tag_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'blogId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'tagId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'categories',
      dartName: 'Category',
      schema: 'public',
      module: 'blogify',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'categories_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'icon',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'categories_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'category_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'name',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'comments',
      dartName: 'Comment',
      schema: 'public',
      module: 'blogify',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'comments_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'postId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'repliedOnCommentId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'comments_fk_0',
          columns: ['ownerId'],
          referenceTable: 'app_users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'comments_fk_1',
          columns: ['postId'],
          referenceTable: 'blogs',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'comments_fk_2',
          columns: ['repliedOnCommentId'],
          referenceTable: 'comments',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'comments_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'members',
      dartName: 'Member',
      schema: 'public',
      module: 'blogify',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'members_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'subscriberId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'subscribedToId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'members_fk_0',
          columns: ['subscriberId'],
          referenceTable: 'app_users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'members_fk_1',
          columns: ['subscribedToId'],
          referenceTable: 'app_users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'members_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'subscriptions_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'subscriberId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'subscribedToId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'tags',
      dartName: 'Tag',
      schema: 'public',
      module: 'blogify',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'tags_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'tags_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'tag_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'name',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.BlogCountByStatusDto) {
      return _i4.BlogCountByStatusDto.fromJson(data) as T;
    }
    if (t == _i5.BlogDto) {
      return _i5.BlogDto.fromJson(data) as T;
    }
    if (t == _i6.CategoryDto) {
      return _i6.CategoryDto.fromJson(data) as T;
    }
    if (t == _i7.CommentCountStream) {
      return _i7.CommentCountStream.fromJson(data) as T;
    }
    if (t == _i8.CommentDto) {
      return _i8.CommentDto.fromJson(data) as T;
    }
    if (t == _i9.CreateBlogDto) {
      return _i9.CreateBlogDto.fromJson(data) as T;
    }
    if (t == _i10.PaginatedBlogDto) {
      return _i10.PaginatedBlogDto.fromJson(data) as T;
    }
    if (t == _i11.PaginatedCategoryDto) {
      return _i11.PaginatedCategoryDto.fromJson(data) as T;
    }
    if (t == _i12.PaginatedComments) {
      return _i12.PaginatedComments.fromJson(data) as T;
    }
    if (t == _i13.PaginatedTagDto) {
      return _i13.PaginatedTagDto.fromJson(data) as T;
    }
    if (t == _i14.ServerException) {
      return _i14.ServerException.fromJson(data) as T;
    }
    if (t == _i15.TagDto) {
      return _i15.TagDto.fromJson(data) as T;
    }
    if (t == _i16.UserDto) {
      return _i16.UserDto.fromJson(data) as T;
    }
    if (t == _i17.UserFollowingStat) {
      return _i17.UserFollowingStat.fromJson(data) as T;
    }
    if (t == _i18.UserStats) {
      return _i18.UserStats.fromJson(data) as T;
    }
    if (t == _i19.AppUser) {
      return _i19.AppUser.fromJson(data) as T;
    }
    if (t == _i20.Blog) {
      return _i20.Blog.fromJson(data) as T;
    }
    if (t == _i21.BlogTag) {
      return _i21.BlogTag.fromJson(data) as T;
    }
    if (t == _i22.Category) {
      return _i22.Category.fromJson(data) as T;
    }
    if (t == _i23.Comment) {
      return _i23.Comment.fromJson(data) as T;
    }
    if (t == _i24.Example) {
      return _i24.Example.fromJson(data) as T;
    }
    if (t == _i25.Member) {
      return _i25.Member.fromJson(data) as T;
    }
    if (t == _i26.PostStatus) {
      return _i26.PostStatus.fromJson(data) as T;
    }
    if (t == _i27.Tag) {
      return _i27.Tag.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.BlogCountByStatusDto?>()) {
      return (data != null ? _i4.BlogCountByStatusDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.BlogDto?>()) {
      return (data != null ? _i5.BlogDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.CategoryDto?>()) {
      return (data != null ? _i6.CategoryDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.CommentCountStream?>()) {
      return (data != null ? _i7.CommentCountStream.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.CommentDto?>()) {
      return (data != null ? _i8.CommentDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.CreateBlogDto?>()) {
      return (data != null ? _i9.CreateBlogDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.PaginatedBlogDto?>()) {
      return (data != null ? _i10.PaginatedBlogDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.PaginatedCategoryDto?>()) {
      return (data != null ? _i11.PaginatedCategoryDto.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i12.PaginatedComments?>()) {
      return (data != null ? _i12.PaginatedComments.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.PaginatedTagDto?>()) {
      return (data != null ? _i13.PaginatedTagDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.ServerException?>()) {
      return (data != null ? _i14.ServerException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.TagDto?>()) {
      return (data != null ? _i15.TagDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.UserDto?>()) {
      return (data != null ? _i16.UserDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.UserFollowingStat?>()) {
      return (data != null ? _i17.UserFollowingStat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.UserStats?>()) {
      return (data != null ? _i18.UserStats.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.AppUser?>()) {
      return (data != null ? _i19.AppUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Blog?>()) {
      return (data != null ? _i20.Blog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.BlogTag?>()) {
      return (data != null ? _i21.BlogTag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.Category?>()) {
      return (data != null ? _i22.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.Comment?>()) {
      return (data != null ? _i23.Comment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.Example?>()) {
      return (data != null ? _i24.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.Member?>()) {
      return (data != null ? _i25.Member.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.PostStatus?>()) {
      return (data != null ? _i26.PostStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.Tag?>()) {
      return (data != null ? _i27.Tag.fromJson(data) : null) as T;
    }
    if (t == List<_i15.TagDto>) {
      return (data as List).map((e) => deserialize<_i15.TagDto>(e)).toList()
          as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i5.BlogDto>) {
      return (data as List).map((e) => deserialize<_i5.BlogDto>(e)).toList()
          as dynamic;
    }
    if (t == List<_i6.CategoryDto>) {
      return (data as List).map((e) => deserialize<_i6.CategoryDto>(e)).toList()
          as dynamic;
    }
    if (t == List<_i8.CommentDto>) {
      return (data as List).map((e) => deserialize<_i8.CommentDto>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i20.Blog>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i20.Blog>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i23.Comment>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i23.Comment>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i25.Member>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i25.Member>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i25.Member>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i25.Member>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i21.BlogTag>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i21.BlogTag>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i23.Comment>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i23.Comment>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i20.Blog>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i20.Blog>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i23.Comment>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i23.Comment>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i21.BlogTag>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i21.BlogTag>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i28.BlogDto>) {
      return (data as List).map((e) => deserialize<_i28.BlogDto>(e)).toList()
          as dynamic;
    }
    if (t == List<_i29.CategoryDto>) {
      return (data as List)
          .map((e) => deserialize<_i29.CategoryDto>(e))
          .toList() as dynamic;
    }
    if (t == List<_i30.TagDto>) {
      return (data as List).map((e) => deserialize<_i30.TagDto>(e)).toList()
          as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.BlogCountByStatusDto) {
      return 'BlogCountByStatusDto';
    }
    if (data is _i5.BlogDto) {
      return 'BlogDto';
    }
    if (data is _i6.CategoryDto) {
      return 'CategoryDto';
    }
    if (data is _i7.CommentCountStream) {
      return 'CommentCountStream';
    }
    if (data is _i8.CommentDto) {
      return 'CommentDto';
    }
    if (data is _i9.CreateBlogDto) {
      return 'CreateBlogDto';
    }
    if (data is _i10.PaginatedBlogDto) {
      return 'PaginatedBlogDto';
    }
    if (data is _i11.PaginatedCategoryDto) {
      return 'PaginatedCategoryDto';
    }
    if (data is _i12.PaginatedComments) {
      return 'PaginatedComments';
    }
    if (data is _i13.PaginatedTagDto) {
      return 'PaginatedTagDto';
    }
    if (data is _i14.ServerException) {
      return 'ServerException';
    }
    if (data is _i15.TagDto) {
      return 'TagDto';
    }
    if (data is _i16.UserDto) {
      return 'UserDto';
    }
    if (data is _i17.UserFollowingStat) {
      return 'UserFollowingStat';
    }
    if (data is _i18.UserStats) {
      return 'UserStats';
    }
    if (data is _i19.AppUser) {
      return 'AppUser';
    }
    if (data is _i20.Blog) {
      return 'Blog';
    }
    if (data is _i21.BlogTag) {
      return 'BlogTag';
    }
    if (data is _i22.Category) {
      return 'Category';
    }
    if (data is _i23.Comment) {
      return 'Comment';
    }
    if (data is _i24.Example) {
      return 'Example';
    }
    if (data is _i25.Member) {
      return 'Member';
    }
    if (data is _i26.PostStatus) {
      return 'PostStatus';
    }
    if (data is _i27.Tag) {
      return 'Tag';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'BlogCountByStatusDto') {
      return deserialize<_i4.BlogCountByStatusDto>(data['data']);
    }
    if (dataClassName == 'BlogDto') {
      return deserialize<_i5.BlogDto>(data['data']);
    }
    if (dataClassName == 'CategoryDto') {
      return deserialize<_i6.CategoryDto>(data['data']);
    }
    if (dataClassName == 'CommentCountStream') {
      return deserialize<_i7.CommentCountStream>(data['data']);
    }
    if (dataClassName == 'CommentDto') {
      return deserialize<_i8.CommentDto>(data['data']);
    }
    if (dataClassName == 'CreateBlogDto') {
      return deserialize<_i9.CreateBlogDto>(data['data']);
    }
    if (dataClassName == 'PaginatedBlogDto') {
      return deserialize<_i10.PaginatedBlogDto>(data['data']);
    }
    if (dataClassName == 'PaginatedCategoryDto') {
      return deserialize<_i11.PaginatedCategoryDto>(data['data']);
    }
    if (dataClassName == 'PaginatedComments') {
      return deserialize<_i12.PaginatedComments>(data['data']);
    }
    if (dataClassName == 'PaginatedTagDto') {
      return deserialize<_i13.PaginatedTagDto>(data['data']);
    }
    if (dataClassName == 'ServerException') {
      return deserialize<_i14.ServerException>(data['data']);
    }
    if (dataClassName == 'TagDto') {
      return deserialize<_i15.TagDto>(data['data']);
    }
    if (dataClassName == 'UserDto') {
      return deserialize<_i16.UserDto>(data['data']);
    }
    if (dataClassName == 'UserFollowingStat') {
      return deserialize<_i17.UserFollowingStat>(data['data']);
    }
    if (dataClassName == 'UserStats') {
      return deserialize<_i18.UserStats>(data['data']);
    }
    if (dataClassName == 'AppUser') {
      return deserialize<_i19.AppUser>(data['data']);
    }
    if (dataClassName == 'Blog') {
      return deserialize<_i20.Blog>(data['data']);
    }
    if (dataClassName == 'BlogTag') {
      return deserialize<_i21.BlogTag>(data['data']);
    }
    if (dataClassName == 'Category') {
      return deserialize<_i22.Category>(data['data']);
    }
    if (dataClassName == 'Comment') {
      return deserialize<_i23.Comment>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i24.Example>(data['data']);
    }
    if (dataClassName == 'Member') {
      return deserialize<_i25.Member>(data['data']);
    }
    if (dataClassName == 'PostStatus') {
      return deserialize<_i26.PostStatus>(data['data']);
    }
    if (dataClassName == 'Tag') {
      return deserialize<_i27.Tag>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i19.AppUser:
        return _i19.AppUser.t;
      case _i20.Blog:
        return _i20.Blog.t;
      case _i21.BlogTag:
        return _i21.BlogTag.t;
      case _i22.Category:
        return _i22.Category.t;
      case _i23.Comment:
        return _i23.Comment.t;
      case _i25.Member:
        return _i25.Member.t;
      case _i27.Tag:
        return _i27.Tag.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'blogify';
}
