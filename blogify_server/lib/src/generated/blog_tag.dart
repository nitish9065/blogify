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
import 'blog.dart' as _i2;
import 'tag.dart' as _i3;

abstract class BlogTag implements _i1.TableRow, _i1.ProtocolSerialization {
  BlogTag._({
    this.id,
    required this.blogId,
    this.blog,
    required this.tagId,
    this.tag,
  });

  factory BlogTag({
    int? id,
    required int blogId,
    _i2.Blog? blog,
    required int tagId,
    _i3.Tag? tag,
  }) = _BlogTagImpl;

  factory BlogTag.fromJson(Map<String, dynamic> jsonSerialization) {
    return BlogTag(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      blog: jsonSerialization['blog'] == null
          ? null
          : _i2.Blog.fromJson(
              (jsonSerialization['blog'] as Map<String, dynamic>)),
      tagId: jsonSerialization['tagId'] as int,
      tag: jsonSerialization['tag'] == null
          ? null
          : _i3.Tag.fromJson(
              (jsonSerialization['tag'] as Map<String, dynamic>)),
    );
  }

  static final t = BlogTagTable();

  static const db = BlogTagRepository._();

  @override
  int? id;

  int blogId;

  _i2.Blog? blog;

  int tagId;

  _i3.Tag? tag;

  @override
  _i1.Table get table => t;

  BlogTag copyWith({
    int? id,
    int? blogId,
    _i2.Blog? blog,
    int? tagId,
    _i3.Tag? tag,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'blogId': blogId,
      if (blog != null) 'blog': blog?.toJson(),
      'tagId': tagId,
      if (tag != null) 'tag': tag?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'blogId': blogId,
      if (blog != null) 'blog': blog?.toJsonForProtocol(),
      'tagId': tagId,
      if (tag != null) 'tag': tag?.toJsonForProtocol(),
    };
  }

  static BlogTagInclude include({
    _i2.BlogInclude? blog,
    _i3.TagInclude? tag,
  }) {
    return BlogTagInclude._(
      blog: blog,
      tag: tag,
    );
  }

  static BlogTagIncludeList includeList({
    _i1.WhereExpressionBuilder<BlogTagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BlogTagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BlogTagTable>? orderByList,
    BlogTagInclude? include,
  }) {
    return BlogTagIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BlogTag.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BlogTag.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BlogTagImpl extends BlogTag {
  _BlogTagImpl({
    int? id,
    required int blogId,
    _i2.Blog? blog,
    required int tagId,
    _i3.Tag? tag,
  }) : super._(
          id: id,
          blogId: blogId,
          blog: blog,
          tagId: tagId,
          tag: tag,
        );

  @override
  BlogTag copyWith({
    Object? id = _Undefined,
    int? blogId,
    Object? blog = _Undefined,
    int? tagId,
    Object? tag = _Undefined,
  }) {
    return BlogTag(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      blog: blog is _i2.Blog? ? blog : this.blog?.copyWith(),
      tagId: tagId ?? this.tagId,
      tag: tag is _i3.Tag? ? tag : this.tag?.copyWith(),
    );
  }
}

class BlogTagTable extends _i1.Table {
  BlogTagTable({super.tableRelation}) : super(tableName: 'blogs_tags') {
    blogId = _i1.ColumnInt(
      'blogId',
      this,
    );
    tagId = _i1.ColumnInt(
      'tagId',
      this,
    );
  }

  late final _i1.ColumnInt blogId;

  _i2.BlogTable? _blog;

  late final _i1.ColumnInt tagId;

  _i3.TagTable? _tag;

  _i2.BlogTable get blog {
    if (_blog != null) return _blog!;
    _blog = _i1.createRelationTable(
      relationFieldName: 'blog',
      field: BlogTag.t.blogId,
      foreignField: _i2.Blog.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.BlogTable(tableRelation: foreignTableRelation),
    );
    return _blog!;
  }

  _i3.TagTable get tag {
    if (_tag != null) return _tag!;
    _tag = _i1.createRelationTable(
      relationFieldName: 'tag',
      field: BlogTag.t.tagId,
      foreignField: _i3.Tag.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TagTable(tableRelation: foreignTableRelation),
    );
    return _tag!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        blogId,
        tagId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'blog') {
      return blog;
    }
    if (relationField == 'tag') {
      return tag;
    }
    return null;
  }
}

class BlogTagInclude extends _i1.IncludeObject {
  BlogTagInclude._({
    _i2.BlogInclude? blog,
    _i3.TagInclude? tag,
  }) {
    _blog = blog;
    _tag = tag;
  }

  _i2.BlogInclude? _blog;

  _i3.TagInclude? _tag;

  @override
  Map<String, _i1.Include?> get includes => {
        'blog': _blog,
        'tag': _tag,
      };

  @override
  _i1.Table get table => BlogTag.t;
}

class BlogTagIncludeList extends _i1.IncludeList {
  BlogTagIncludeList._({
    _i1.WhereExpressionBuilder<BlogTagTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BlogTag.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => BlogTag.t;
}

class BlogTagRepository {
  const BlogTagRepository._();

  final attachRow = const BlogTagAttachRowRepository._();

  Future<List<BlogTag>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BlogTagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BlogTagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BlogTagTable>? orderByList,
    _i1.Transaction? transaction,
    BlogTagInclude? include,
  }) async {
    return session.db.find<BlogTag>(
      where: where?.call(BlogTag.t),
      orderBy: orderBy?.call(BlogTag.t),
      orderByList: orderByList?.call(BlogTag.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<BlogTag?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BlogTagTable>? where,
    int? offset,
    _i1.OrderByBuilder<BlogTagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BlogTagTable>? orderByList,
    _i1.Transaction? transaction,
    BlogTagInclude? include,
  }) async {
    return session.db.findFirstRow<BlogTag>(
      where: where?.call(BlogTag.t),
      orderBy: orderBy?.call(BlogTag.t),
      orderByList: orderByList?.call(BlogTag.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<BlogTag?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    BlogTagInclude? include,
  }) async {
    return session.db.findById<BlogTag>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<BlogTag>> insert(
    _i1.Session session,
    List<BlogTag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BlogTag>(
      rows,
      transaction: transaction,
    );
  }

  Future<BlogTag> insertRow(
    _i1.Session session,
    BlogTag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BlogTag>(
      row,
      transaction: transaction,
    );
  }

  Future<List<BlogTag>> update(
    _i1.Session session,
    List<BlogTag> rows, {
    _i1.ColumnSelections<BlogTagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<BlogTag>(
      rows,
      columns: columns?.call(BlogTag.t),
      transaction: transaction,
    );
  }

  Future<BlogTag> updateRow(
    _i1.Session session,
    BlogTag row, {
    _i1.ColumnSelections<BlogTagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BlogTag>(
      row,
      columns: columns?.call(BlogTag.t),
      transaction: transaction,
    );
  }

  Future<List<BlogTag>> delete(
    _i1.Session session,
    List<BlogTag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BlogTag>(
      rows,
      transaction: transaction,
    );
  }

  Future<BlogTag> deleteRow(
    _i1.Session session,
    BlogTag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BlogTag>(
      row,
      transaction: transaction,
    );
  }

  Future<List<BlogTag>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BlogTagTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BlogTag>(
      where: where(BlogTag.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BlogTagTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BlogTag>(
      where: where?.call(BlogTag.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class BlogTagAttachRowRepository {
  const BlogTagAttachRowRepository._();

  Future<void> blog(
    _i1.Session session,
    BlogTag blogTag,
    _i2.Blog blog, {
    _i1.Transaction? transaction,
  }) async {
    if (blogTag.id == null) {
      throw ArgumentError.notNull('blogTag.id');
    }
    if (blog.id == null) {
      throw ArgumentError.notNull('blog.id');
    }

    var $blogTag = blogTag.copyWith(blogId: blog.id);
    await session.db.updateRow<BlogTag>(
      $blogTag,
      columns: [BlogTag.t.blogId],
      transaction: transaction,
    );
  }

  Future<void> tag(
    _i1.Session session,
    BlogTag blogTag,
    _i3.Tag tag, {
    _i1.Transaction? transaction,
  }) async {
    if (blogTag.id == null) {
      throw ArgumentError.notNull('blogTag.id');
    }
    if (tag.id == null) {
      throw ArgumentError.notNull('tag.id');
    }

    var $blogTag = blogTag.copyWith(tagId: tag.id);
    await session.db.updateRow<BlogTag>(
      $blogTag,
      columns: [BlogTag.t.tagId],
      transaction: transaction,
    );
  }
}
