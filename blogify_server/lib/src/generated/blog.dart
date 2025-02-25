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
import 'app_user.dart' as _i2;
import 'category.dart' as _i3;
import 'blog_tag.dart' as _i4;
import 'comment.dart' as _i5;
import 'post_status.dart' as _i6;
import 'blog.dart' as _i7;

abstract class Blog implements _i1.TableRow, _i1.ProtocolSerialization {
  Blog._({
    this.id,
    required this.title,
    required this.content,
    required this.authorId,
    this.author,
    required this.categoryId,
    this.category,
    this.tags,
    this.comments,
    required this.status,
    required this.readingTime,
    this.previous,
    this.nextId,
    this.next,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Blog({
    int? id,
    required String title,
    required String content,
    required int authorId,
    _i2.AppUser? author,
    required int categoryId,
    _i3.Category? category,
    List<_i4.BlogTag>? tags,
    List<_i5.Comment>? comments,
    required _i6.PostStatus status,
    required int readingTime,
    _i7.Blog? previous,
    int? nextId,
    _i7.Blog? next,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _BlogImpl;

  factory Blog.fromJson(Map<String, dynamic> jsonSerialization) {
    return Blog(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      authorId: jsonSerialization['authorId'] as int,
      author: jsonSerialization['author'] == null
          ? null
          : _i2.AppUser.fromJson(
              (jsonSerialization['author'] as Map<String, dynamic>)),
      categoryId: jsonSerialization['categoryId'] as int,
      category: jsonSerialization['category'] == null
          ? null
          : _i3.Category.fromJson(
              (jsonSerialization['category'] as Map<String, dynamic>)),
      tags: (jsonSerialization['tags'] as List?)
          ?.map((e) => _i4.BlogTag.fromJson((e as Map<String, dynamic>)))
          .toList(),
      comments: (jsonSerialization['comments'] as List?)
          ?.map((e) => _i5.Comment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      status: _i6.PostStatus.fromJson((jsonSerialization['status'] as String)),
      readingTime: jsonSerialization['readingTime'] as int,
      previous: jsonSerialization['previous'] == null
          ? null
          : _i7.Blog.fromJson(
              (jsonSerialization['previous'] as Map<String, dynamic>)),
      nextId: jsonSerialization['nextId'] as int?,
      next: jsonSerialization['next'] == null
          ? null
          : _i7.Blog.fromJson(
              (jsonSerialization['next'] as Map<String, dynamic>)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = BlogTable();

  static const db = BlogRepository._();

  @override
  int? id;

  String title;

  String content;

  int authorId;

  _i2.AppUser? author;

  int categoryId;

  _i3.Category? category;

  List<_i4.BlogTag>? tags;

  List<_i5.Comment>? comments;

  _i6.PostStatus status;

  int readingTime;

  /// To hold the previous blog Id & next BlogId -> Useful for navigation between multiple blogs.
  /// the previous post is the corresponding object on the "other" side.
  _i7.Blog? previous;

  /// nextId is a nullable field that stores the id of the next post
  int? nextId;

  /// The next post represents the object on "this" side
  _i7.Blog? next;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table get table => t;

  Blog copyWith({
    int? id,
    String? title,
    String? content,
    int? authorId,
    _i2.AppUser? author,
    int? categoryId,
    _i3.Category? category,
    List<_i4.BlogTag>? tags,
    List<_i5.Comment>? comments,
    _i6.PostStatus? status,
    int? readingTime,
    _i7.Blog? previous,
    int? nextId,
    _i7.Blog? next,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'content': content,
      'authorId': authorId,
      if (author != null) 'author': author?.toJson(),
      'categoryId': categoryId,
      if (category != null) 'category': category?.toJson(),
      if (tags != null) 'tags': tags?.toJson(valueToJson: (v) => v.toJson()),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJson()),
      'status': status.toJson(),
      'readingTime': readingTime,
      if (previous != null) 'previous': previous?.toJson(),
      if (nextId != null) 'nextId': nextId,
      if (next != null) 'next': next?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'content': content,
      'authorId': authorId,
      if (author != null) 'author': author?.toJsonForProtocol(),
      'categoryId': categoryId,
      if (category != null) 'category': category?.toJsonForProtocol(),
      if (tags != null)
        'tags': tags?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'status': status.toJson(),
      'readingTime': readingTime,
      if (previous != null) 'previous': previous?.toJsonForProtocol(),
      if (nextId != null) 'nextId': nextId,
      if (next != null) 'next': next?.toJsonForProtocol(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static BlogInclude include({
    _i2.AppUserInclude? author,
    _i3.CategoryInclude? category,
    _i4.BlogTagIncludeList? tags,
    _i5.CommentIncludeList? comments,
    _i7.BlogInclude? previous,
    _i7.BlogInclude? next,
  }) {
    return BlogInclude._(
      author: author,
      category: category,
      tags: tags,
      comments: comments,
      previous: previous,
      next: next,
    );
  }

  static BlogIncludeList includeList({
    _i1.WhereExpressionBuilder<BlogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BlogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BlogTable>? orderByList,
    BlogInclude? include,
  }) {
    return BlogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Blog.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Blog.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BlogImpl extends Blog {
  _BlogImpl({
    int? id,
    required String title,
    required String content,
    required int authorId,
    _i2.AppUser? author,
    required int categoryId,
    _i3.Category? category,
    List<_i4.BlogTag>? tags,
    List<_i5.Comment>? comments,
    required _i6.PostStatus status,
    required int readingTime,
    _i7.Blog? previous,
    int? nextId,
    _i7.Blog? next,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          title: title,
          content: content,
          authorId: authorId,
          author: author,
          categoryId: categoryId,
          category: category,
          tags: tags,
          comments: comments,
          status: status,
          readingTime: readingTime,
          previous: previous,
          nextId: nextId,
          next: next,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  Blog copyWith({
    Object? id = _Undefined,
    String? title,
    String? content,
    int? authorId,
    Object? author = _Undefined,
    int? categoryId,
    Object? category = _Undefined,
    Object? tags = _Undefined,
    Object? comments = _Undefined,
    _i6.PostStatus? status,
    int? readingTime,
    Object? previous = _Undefined,
    Object? nextId = _Undefined,
    Object? next = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Blog(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      authorId: authorId ?? this.authorId,
      author: author is _i2.AppUser? ? author : this.author?.copyWith(),
      categoryId: categoryId ?? this.categoryId,
      category:
          category is _i3.Category? ? category : this.category?.copyWith(),
      tags: tags is List<_i4.BlogTag>?
          ? tags
          : this.tags?.map((e0) => e0.copyWith()).toList(),
      comments: comments is List<_i5.Comment>?
          ? comments
          : this.comments?.map((e0) => e0.copyWith()).toList(),
      status: status ?? this.status,
      readingTime: readingTime ?? this.readingTime,
      previous: previous is _i7.Blog? ? previous : this.previous?.copyWith(),
      nextId: nextId is int? ? nextId : this.nextId,
      next: next is _i7.Blog? ? next : this.next?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class BlogTable extends _i1.Table {
  BlogTable({super.tableRelation}) : super(tableName: 'blogs') {
    title = _i1.ColumnString(
      'title',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    authorId = _i1.ColumnInt(
      'authorId',
      this,
    );
    categoryId = _i1.ColumnInt(
      'categoryId',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    readingTime = _i1.ColumnInt(
      'readingTime',
      this,
    );
    nextId = _i1.ColumnInt(
      'nextId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnString title;

  late final _i1.ColumnString content;

  late final _i1.ColumnInt authorId;

  _i2.AppUserTable? _author;

  late final _i1.ColumnInt categoryId;

  _i3.CategoryTable? _category;

  _i4.BlogTagTable? ___tags;

  _i1.ManyRelation<_i4.BlogTagTable>? _tags;

  _i5.CommentTable? ___comments;

  _i1.ManyRelation<_i5.CommentTable>? _comments;

  late final _i1.ColumnEnum<_i6.PostStatus> status;

  late final _i1.ColumnInt readingTime;

  /// To hold the previous blog Id & next BlogId -> Useful for navigation between multiple blogs.
  /// the previous post is the corresponding object on the "other" side.
  _i7.BlogTable? _previous;

  /// nextId is a nullable field that stores the id of the next post
  late final _i1.ColumnInt nextId;

  /// The next post represents the object on "this" side
  _i7.BlogTable? _next;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.AppUserTable get author {
    if (_author != null) return _author!;
    _author = _i1.createRelationTable(
      relationFieldName: 'author',
      field: Blog.t.authorId,
      foreignField: _i2.AppUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AppUserTable(tableRelation: foreignTableRelation),
    );
    return _author!;
  }

  _i3.CategoryTable get category {
    if (_category != null) return _category!;
    _category = _i1.createRelationTable(
      relationFieldName: 'category',
      field: Blog.t.categoryId,
      foreignField: _i3.Category.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CategoryTable(tableRelation: foreignTableRelation),
    );
    return _category!;
  }

  _i4.BlogTagTable get __tags {
    if (___tags != null) return ___tags!;
    ___tags = _i1.createRelationTable(
      relationFieldName: '__tags',
      field: Blog.t.id,
      foreignField: _i4.BlogTag.t.blogId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.BlogTagTable(tableRelation: foreignTableRelation),
    );
    return ___tags!;
  }

  _i5.CommentTable get __comments {
    if (___comments != null) return ___comments!;
    ___comments = _i1.createRelationTable(
      relationFieldName: '__comments',
      field: Blog.t.id,
      foreignField: _i5.Comment.t.postId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.CommentTable(tableRelation: foreignTableRelation),
    );
    return ___comments!;
  }

  _i7.BlogTable get previous {
    if (_previous != null) return _previous!;
    _previous = _i1.createRelationTable(
      relationFieldName: 'previous',
      field: Blog.t.id,
      foreignField: _i7.Blog.t.nextId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.BlogTable(tableRelation: foreignTableRelation),
    );
    return _previous!;
  }

  _i7.BlogTable get next {
    if (_next != null) return _next!;
    _next = _i1.createRelationTable(
      relationFieldName: 'next',
      field: Blog.t.nextId,
      foreignField: _i7.Blog.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.BlogTable(tableRelation: foreignTableRelation),
    );
    return _next!;
  }

  _i1.ManyRelation<_i4.BlogTagTable> get tags {
    if (_tags != null) return _tags!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'tags',
      field: Blog.t.id,
      foreignField: _i4.BlogTag.t.blogId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.BlogTagTable(tableRelation: foreignTableRelation),
    );
    _tags = _i1.ManyRelation<_i4.BlogTagTable>(
      tableWithRelations: relationTable,
      table: _i4.BlogTagTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _tags!;
  }

  _i1.ManyRelation<_i5.CommentTable> get comments {
    if (_comments != null) return _comments!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'comments',
      field: Blog.t.id,
      foreignField: _i5.Comment.t.postId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.CommentTable(tableRelation: foreignTableRelation),
    );
    _comments = _i1.ManyRelation<_i5.CommentTable>(
      tableWithRelations: relationTable,
      table: _i5.CommentTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _comments!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        content,
        authorId,
        categoryId,
        status,
        readingTime,
        nextId,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'author') {
      return author;
    }
    if (relationField == 'category') {
      return category;
    }
    if (relationField == 'tags') {
      return __tags;
    }
    if (relationField == 'comments') {
      return __comments;
    }
    if (relationField == 'previous') {
      return previous;
    }
    if (relationField == 'next') {
      return next;
    }
    return null;
  }
}

class BlogInclude extends _i1.IncludeObject {
  BlogInclude._({
    _i2.AppUserInclude? author,
    _i3.CategoryInclude? category,
    _i4.BlogTagIncludeList? tags,
    _i5.CommentIncludeList? comments,
    _i7.BlogInclude? previous,
    _i7.BlogInclude? next,
  }) {
    _author = author;
    _category = category;
    _tags = tags;
    _comments = comments;
    _previous = previous;
    _next = next;
  }

  _i2.AppUserInclude? _author;

  _i3.CategoryInclude? _category;

  _i4.BlogTagIncludeList? _tags;

  _i5.CommentIncludeList? _comments;

  _i7.BlogInclude? _previous;

  _i7.BlogInclude? _next;

  @override
  Map<String, _i1.Include?> get includes => {
        'author': _author,
        'category': _category,
        'tags': _tags,
        'comments': _comments,
        'previous': _previous,
        'next': _next,
      };

  @override
  _i1.Table get table => Blog.t;
}

class BlogIncludeList extends _i1.IncludeList {
  BlogIncludeList._({
    _i1.WhereExpressionBuilder<BlogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Blog.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Blog.t;
}

class BlogRepository {
  const BlogRepository._();

  final attach = const BlogAttachRepository._();

  final attachRow = const BlogAttachRowRepository._();

  final detach = const BlogDetachRepository._();

  final detachRow = const BlogDetachRowRepository._();

  Future<List<Blog>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BlogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BlogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BlogTable>? orderByList,
    _i1.Transaction? transaction,
    BlogInclude? include,
  }) async {
    return session.db.find<Blog>(
      where: where?.call(Blog.t),
      orderBy: orderBy?.call(Blog.t),
      orderByList: orderByList?.call(Blog.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Blog?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BlogTable>? where,
    int? offset,
    _i1.OrderByBuilder<BlogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BlogTable>? orderByList,
    _i1.Transaction? transaction,
    BlogInclude? include,
  }) async {
    return session.db.findFirstRow<Blog>(
      where: where?.call(Blog.t),
      orderBy: orderBy?.call(Blog.t),
      orderByList: orderByList?.call(Blog.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Blog?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    BlogInclude? include,
  }) async {
    return session.db.findById<Blog>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Blog>> insert(
    _i1.Session session,
    List<Blog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Blog>(
      rows,
      transaction: transaction,
    );
  }

  Future<Blog> insertRow(
    _i1.Session session,
    Blog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Blog>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Blog>> update(
    _i1.Session session,
    List<Blog> rows, {
    _i1.ColumnSelections<BlogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Blog>(
      rows,
      columns: columns?.call(Blog.t),
      transaction: transaction,
    );
  }

  Future<Blog> updateRow(
    _i1.Session session,
    Blog row, {
    _i1.ColumnSelections<BlogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Blog>(
      row,
      columns: columns?.call(Blog.t),
      transaction: transaction,
    );
  }

  Future<List<Blog>> delete(
    _i1.Session session,
    List<Blog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Blog>(
      rows,
      transaction: transaction,
    );
  }

  Future<Blog> deleteRow(
    _i1.Session session,
    Blog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Blog>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Blog>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BlogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Blog>(
      where: where(Blog.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BlogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Blog>(
      where: where?.call(Blog.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class BlogAttachRepository {
  const BlogAttachRepository._();

  Future<void> tags(
    _i1.Session session,
    Blog blog,
    List<_i4.BlogTag> blogTag, {
    _i1.Transaction? transaction,
  }) async {
    if (blogTag.any((e) => e.id == null)) {
      throw ArgumentError.notNull('blogTag.id');
    }
    if (blog.id == null) {
      throw ArgumentError.notNull('blog.id');
    }

    var $blogTag = blogTag.map((e) => e.copyWith(blogId: blog.id)).toList();
    await session.db.update<_i4.BlogTag>(
      $blogTag,
      columns: [_i4.BlogTag.t.blogId],
      transaction: transaction,
    );
  }

  Future<void> comments(
    _i1.Session session,
    Blog blog,
    List<_i5.Comment> comment, {
    _i1.Transaction? transaction,
  }) async {
    if (comment.any((e) => e.id == null)) {
      throw ArgumentError.notNull('comment.id');
    }
    if (blog.id == null) {
      throw ArgumentError.notNull('blog.id');
    }

    var $comment = comment.map((e) => e.copyWith(postId: blog.id)).toList();
    await session.db.update<_i5.Comment>(
      $comment,
      columns: [_i5.Comment.t.postId],
      transaction: transaction,
    );
  }
}

class BlogAttachRowRepository {
  const BlogAttachRowRepository._();

  Future<void> author(
    _i1.Session session,
    Blog blog,
    _i2.AppUser author, {
    _i1.Transaction? transaction,
  }) async {
    if (blog.id == null) {
      throw ArgumentError.notNull('blog.id');
    }
    if (author.id == null) {
      throw ArgumentError.notNull('author.id');
    }

    var $blog = blog.copyWith(authorId: author.id);
    await session.db.updateRow<Blog>(
      $blog,
      columns: [Blog.t.authorId],
      transaction: transaction,
    );
  }

  Future<void> category(
    _i1.Session session,
    Blog blog,
    _i3.Category category, {
    _i1.Transaction? transaction,
  }) async {
    if (blog.id == null) {
      throw ArgumentError.notNull('blog.id');
    }
    if (category.id == null) {
      throw ArgumentError.notNull('category.id');
    }

    var $blog = blog.copyWith(categoryId: category.id);
    await session.db.updateRow<Blog>(
      $blog,
      columns: [Blog.t.categoryId],
      transaction: transaction,
    );
  }

  Future<void> previous(
    _i1.Session session,
    Blog blog,
    _i7.Blog previous, {
    _i1.Transaction? transaction,
  }) async {
    if (previous.id == null) {
      throw ArgumentError.notNull('previous.id');
    }
    if (blog.id == null) {
      throw ArgumentError.notNull('blog.id');
    }

    var $previous = previous.copyWith(nextId: blog.id);
    await session.db.updateRow<_i7.Blog>(
      $previous,
      columns: [_i7.Blog.t.nextId],
      transaction: transaction,
    );
  }

  Future<void> next(
    _i1.Session session,
    Blog blog,
    _i7.Blog next, {
    _i1.Transaction? transaction,
  }) async {
    if (blog.id == null) {
      throw ArgumentError.notNull('blog.id');
    }
    if (next.id == null) {
      throw ArgumentError.notNull('next.id');
    }

    var $blog = blog.copyWith(nextId: next.id);
    await session.db.updateRow<Blog>(
      $blog,
      columns: [Blog.t.nextId],
      transaction: transaction,
    );
  }

  Future<void> tags(
    _i1.Session session,
    Blog blog,
    _i4.BlogTag blogTag, {
    _i1.Transaction? transaction,
  }) async {
    if (blogTag.id == null) {
      throw ArgumentError.notNull('blogTag.id');
    }
    if (blog.id == null) {
      throw ArgumentError.notNull('blog.id');
    }

    var $blogTag = blogTag.copyWith(blogId: blog.id);
    await session.db.updateRow<_i4.BlogTag>(
      $blogTag,
      columns: [_i4.BlogTag.t.blogId],
      transaction: transaction,
    );
  }

  Future<void> comments(
    _i1.Session session,
    Blog blog,
    _i5.Comment comment, {
    _i1.Transaction? transaction,
  }) async {
    if (comment.id == null) {
      throw ArgumentError.notNull('comment.id');
    }
    if (blog.id == null) {
      throw ArgumentError.notNull('blog.id');
    }

    var $comment = comment.copyWith(postId: blog.id);
    await session.db.updateRow<_i5.Comment>(
      $comment,
      columns: [_i5.Comment.t.postId],
      transaction: transaction,
    );
  }
}

class BlogDetachRepository {
  const BlogDetachRepository._();

  Future<void> tags(
    _i1.Session session,
    List<_i4.BlogTag> blogTag, {
    _i1.Transaction? transaction,
  }) async {
    if (blogTag.any((e) => e.id == null)) {
      throw ArgumentError.notNull('blogTag.id');
    }

    var $blogTag = blogTag.map((e) => e.copyWith(blogId: null)).toList();
    await session.db.update<_i4.BlogTag>(
      $blogTag,
      columns: [_i4.BlogTag.t.blogId],
      transaction: transaction,
    );
  }
}

class BlogDetachRowRepository {
  const BlogDetachRowRepository._();

  Future<void> previous(
    _i1.Session session,
    Blog blog, {
    _i1.Transaction? transaction,
  }) async {
    var $previous = blog.previous;

    if ($previous == null) {
      throw ArgumentError.notNull('blog.previous');
    }
    if ($previous.id == null) {
      throw ArgumentError.notNull('blog.previous.id');
    }
    if (blog.id == null) {
      throw ArgumentError.notNull('blog.id');
    }

    var $$previous = $previous.copyWith(nextId: null);
    await session.db.updateRow<_i7.Blog>(
      $$previous,
      columns: [_i7.Blog.t.nextId],
      transaction: transaction,
    );
  }

  Future<void> next(
    _i1.Session session,
    Blog blog, {
    _i1.Transaction? transaction,
  }) async {
    if (blog.id == null) {
      throw ArgumentError.notNull('blog.id');
    }

    var $blog = blog.copyWith(nextId: null);
    await session.db.updateRow<Blog>(
      $blog,
      columns: [Blog.t.nextId],
      transaction: transaction,
    );
  }

  Future<void> tags(
    _i1.Session session,
    _i4.BlogTag blogTag, {
    _i1.Transaction? transaction,
  }) async {
    if (blogTag.id == null) {
      throw ArgumentError.notNull('blogTag.id');
    }

    var $blogTag = blogTag.copyWith(blogId: null);
    await session.db.updateRow<_i4.BlogTag>(
      $blogTag,
      columns: [_i4.BlogTag.t.blogId],
      transaction: transaction,
    );
  }
}
