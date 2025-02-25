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
import 'comment.dart' as _i3;

abstract class Comment implements _i1.TableRow, _i1.ProtocolSerialization {
  Comment._({
    this.id,
    required this.content,
    required this.ownerId,
    this.owner,
    required this.postId,
    this.repliedOnCommentId,
    this.repliedOnComment,
    this.replies,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Comment({
    int? id,
    required String content,
    required int ownerId,
    _i2.AppUser? owner,
    required int postId,
    int? repliedOnCommentId,
    _i3.Comment? repliedOnComment,
    List<_i3.Comment>? replies,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CommentImpl;

  factory Comment.fromJson(Map<String, dynamic> jsonSerialization) {
    return Comment(
      id: jsonSerialization['id'] as int?,
      content: jsonSerialization['content'] as String,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.AppUser.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      postId: jsonSerialization['postId'] as int,
      repliedOnCommentId: jsonSerialization['repliedOnCommentId'] as int?,
      repliedOnComment: jsonSerialization['repliedOnComment'] == null
          ? null
          : _i3.Comment.fromJson(
              (jsonSerialization['repliedOnComment'] as Map<String, dynamic>)),
      replies: (jsonSerialization['replies'] as List?)
          ?.map((e) => _i3.Comment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = CommentTable();

  static const db = CommentRepository._();

  @override
  int? id;

  String content;

  int ownerId;

  /// User who have written the comment
  _i2.AppUser? owner;

  /// Post on which this comment hav been made
  int postId;

  int? repliedOnCommentId;

  /// This is self reference in order to store the id of the comment on which reply is being made
  _i3.Comment? repliedOnComment;

  /// Stores the list of comment/replies made on a comment of a post.
  List<_i3.Comment>? replies;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table get table => t;

  Comment copyWith({
    int? id,
    String? content,
    int? ownerId,
    _i2.AppUser? owner,
    int? postId,
    int? repliedOnCommentId,
    _i3.Comment? repliedOnComment,
    List<_i3.Comment>? replies,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'content': content,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'postId': postId,
      if (repliedOnCommentId != null) 'repliedOnCommentId': repliedOnCommentId,
      if (repliedOnComment != null)
        'repliedOnComment': repliedOnComment?.toJson(),
      if (replies != null)
        'replies': replies?.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'content': content,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      'postId': postId,
      if (repliedOnCommentId != null) 'repliedOnCommentId': repliedOnCommentId,
      if (repliedOnComment != null)
        'repliedOnComment': repliedOnComment?.toJsonForProtocol(),
      if (replies != null)
        'replies': replies?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static CommentInclude include({
    _i2.AppUserInclude? owner,
    _i3.CommentInclude? repliedOnComment,
    _i3.CommentIncludeList? replies,
  }) {
    return CommentInclude._(
      owner: owner,
      repliedOnComment: repliedOnComment,
      replies: replies,
    );
  }

  static CommentIncludeList includeList({
    _i1.WhereExpressionBuilder<CommentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommentTable>? orderByList,
    CommentInclude? include,
  }) {
    return CommentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Comment.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Comment.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommentImpl extends Comment {
  _CommentImpl({
    int? id,
    required String content,
    required int ownerId,
    _i2.AppUser? owner,
    required int postId,
    int? repliedOnCommentId,
    _i3.Comment? repliedOnComment,
    List<_i3.Comment>? replies,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          content: content,
          ownerId: ownerId,
          owner: owner,
          postId: postId,
          repliedOnCommentId: repliedOnCommentId,
          repliedOnComment: repliedOnComment,
          replies: replies,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  Comment copyWith({
    Object? id = _Undefined,
    String? content,
    int? ownerId,
    Object? owner = _Undefined,
    int? postId,
    Object? repliedOnCommentId = _Undefined,
    Object? repliedOnComment = _Undefined,
    Object? replies = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Comment(
      id: id is int? ? id : this.id,
      content: content ?? this.content,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.AppUser? ? owner : this.owner?.copyWith(),
      postId: postId ?? this.postId,
      repliedOnCommentId: repliedOnCommentId is int?
          ? repliedOnCommentId
          : this.repliedOnCommentId,
      repliedOnComment: repliedOnComment is _i3.Comment?
          ? repliedOnComment
          : this.repliedOnComment?.copyWith(),
      replies: replies is List<_i3.Comment>?
          ? replies
          : this.replies?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class CommentTable extends _i1.Table {
  CommentTable({super.tableRelation}) : super(tableName: 'comments') {
    content = _i1.ColumnString(
      'content',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    postId = _i1.ColumnInt(
      'postId',
      this,
    );
    repliedOnCommentId = _i1.ColumnInt(
      'repliedOnCommentId',
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

  late final _i1.ColumnString content;

  late final _i1.ColumnInt ownerId;

  /// User who have written the comment
  _i2.AppUserTable? _owner;

  /// Post on which this comment hav been made
  late final _i1.ColumnInt postId;

  late final _i1.ColumnInt repliedOnCommentId;

  /// This is self reference in order to store the id of the comment on which reply is being made
  _i3.CommentTable? _repliedOnComment;

  /// Stores the list of comment/replies made on a comment of a post.
  _i3.CommentTable? ___replies;

  /// Stores the list of comment/replies made on a comment of a post.
  _i1.ManyRelation<_i3.CommentTable>? _replies;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.AppUserTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: Comment.t.ownerId,
      foreignField: _i2.AppUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AppUserTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  _i3.CommentTable get repliedOnComment {
    if (_repliedOnComment != null) return _repliedOnComment!;
    _repliedOnComment = _i1.createRelationTable(
      relationFieldName: 'repliedOnComment',
      field: Comment.t.repliedOnCommentId,
      foreignField: _i3.Comment.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CommentTable(tableRelation: foreignTableRelation),
    );
    return _repliedOnComment!;
  }

  _i3.CommentTable get __replies {
    if (___replies != null) return ___replies!;
    ___replies = _i1.createRelationTable(
      relationFieldName: '__replies',
      field: Comment.t.id,
      foreignField: _i3.Comment.t.repliedOnCommentId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CommentTable(tableRelation: foreignTableRelation),
    );
    return ___replies!;
  }

  _i1.ManyRelation<_i3.CommentTable> get replies {
    if (_replies != null) return _replies!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'replies',
      field: Comment.t.id,
      foreignField: _i3.Comment.t.repliedOnCommentId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CommentTable(tableRelation: foreignTableRelation),
    );
    _replies = _i1.ManyRelation<_i3.CommentTable>(
      tableWithRelations: relationTable,
      table: _i3.CommentTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _replies!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        content,
        ownerId,
        postId,
        repliedOnCommentId,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    if (relationField == 'repliedOnComment') {
      return repliedOnComment;
    }
    if (relationField == 'replies') {
      return __replies;
    }
    return null;
  }
}

class CommentInclude extends _i1.IncludeObject {
  CommentInclude._({
    _i2.AppUserInclude? owner,
    _i3.CommentInclude? repliedOnComment,
    _i3.CommentIncludeList? replies,
  }) {
    _owner = owner;
    _repliedOnComment = repliedOnComment;
    _replies = replies;
  }

  _i2.AppUserInclude? _owner;

  _i3.CommentInclude? _repliedOnComment;

  _i3.CommentIncludeList? _replies;

  @override
  Map<String, _i1.Include?> get includes => {
        'owner': _owner,
        'repliedOnComment': _repliedOnComment,
        'replies': _replies,
      };

  @override
  _i1.Table get table => Comment.t;
}

class CommentIncludeList extends _i1.IncludeList {
  CommentIncludeList._({
    _i1.WhereExpressionBuilder<CommentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Comment.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Comment.t;
}

class CommentRepository {
  const CommentRepository._();

  final attach = const CommentAttachRepository._();

  final attachRow = const CommentAttachRowRepository._();

  final detach = const CommentDetachRepository._();

  final detachRow = const CommentDetachRowRepository._();

  Future<List<Comment>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CommentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommentTable>? orderByList,
    _i1.Transaction? transaction,
    CommentInclude? include,
  }) async {
    return session.db.find<Comment>(
      where: where?.call(Comment.t),
      orderBy: orderBy?.call(Comment.t),
      orderByList: orderByList?.call(Comment.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Comment?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CommentTable>? where,
    int? offset,
    _i1.OrderByBuilder<CommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommentTable>? orderByList,
    _i1.Transaction? transaction,
    CommentInclude? include,
  }) async {
    return session.db.findFirstRow<Comment>(
      where: where?.call(Comment.t),
      orderBy: orderBy?.call(Comment.t),
      orderByList: orderByList?.call(Comment.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Comment?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CommentInclude? include,
  }) async {
    return session.db.findById<Comment>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Comment>> insert(
    _i1.Session session,
    List<Comment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Comment>(
      rows,
      transaction: transaction,
    );
  }

  Future<Comment> insertRow(
    _i1.Session session,
    Comment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Comment>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Comment>> update(
    _i1.Session session,
    List<Comment> rows, {
    _i1.ColumnSelections<CommentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Comment>(
      rows,
      columns: columns?.call(Comment.t),
      transaction: transaction,
    );
  }

  Future<Comment> updateRow(
    _i1.Session session,
    Comment row, {
    _i1.ColumnSelections<CommentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Comment>(
      row,
      columns: columns?.call(Comment.t),
      transaction: transaction,
    );
  }

  Future<List<Comment>> delete(
    _i1.Session session,
    List<Comment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Comment>(
      rows,
      transaction: transaction,
    );
  }

  Future<Comment> deleteRow(
    _i1.Session session,
    Comment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Comment>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Comment>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CommentTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Comment>(
      where: where(Comment.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CommentTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Comment>(
      where: where?.call(Comment.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CommentAttachRepository {
  const CommentAttachRepository._();

  Future<void> replies(
    _i1.Session session,
    Comment comment,
    List<_i3.Comment> nestedComment, {
    _i1.Transaction? transaction,
  }) async {
    if (nestedComment.any((e) => e.id == null)) {
      throw ArgumentError.notNull('nestedComment.id');
    }
    if (comment.id == null) {
      throw ArgumentError.notNull('comment.id');
    }

    var $nestedComment = nestedComment
        .map((e) => e.copyWith(repliedOnCommentId: comment.id))
        .toList();
    await session.db.update<_i3.Comment>(
      $nestedComment,
      columns: [_i3.Comment.t.repliedOnCommentId],
      transaction: transaction,
    );
  }
}

class CommentAttachRowRepository {
  const CommentAttachRowRepository._();

  Future<void> owner(
    _i1.Session session,
    Comment comment,
    _i2.AppUser owner, {
    _i1.Transaction? transaction,
  }) async {
    if (comment.id == null) {
      throw ArgumentError.notNull('comment.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $comment = comment.copyWith(ownerId: owner.id);
    await session.db.updateRow<Comment>(
      $comment,
      columns: [Comment.t.ownerId],
      transaction: transaction,
    );
  }

  Future<void> repliedOnComment(
    _i1.Session session,
    Comment comment,
    _i3.Comment repliedOnComment, {
    _i1.Transaction? transaction,
  }) async {
    if (comment.id == null) {
      throw ArgumentError.notNull('comment.id');
    }
    if (repliedOnComment.id == null) {
      throw ArgumentError.notNull('repliedOnComment.id');
    }

    var $comment = comment.copyWith(repliedOnCommentId: repliedOnComment.id);
    await session.db.updateRow<Comment>(
      $comment,
      columns: [Comment.t.repliedOnCommentId],
      transaction: transaction,
    );
  }

  Future<void> replies(
    _i1.Session session,
    Comment comment,
    _i3.Comment nestedComment, {
    _i1.Transaction? transaction,
  }) async {
    if (nestedComment.id == null) {
      throw ArgumentError.notNull('nestedComment.id');
    }
    if (comment.id == null) {
      throw ArgumentError.notNull('comment.id');
    }

    var $nestedComment = nestedComment.copyWith(repliedOnCommentId: comment.id);
    await session.db.updateRow<_i3.Comment>(
      $nestedComment,
      columns: [_i3.Comment.t.repliedOnCommentId],
      transaction: transaction,
    );
  }
}

class CommentDetachRepository {
  const CommentDetachRepository._();

  Future<void> replies(
    _i1.Session session,
    List<_i3.Comment> comment, {
    _i1.Transaction? transaction,
  }) async {
    if (comment.any((e) => e.id == null)) {
      throw ArgumentError.notNull('comment.id');
    }

    var $comment =
        comment.map((e) => e.copyWith(repliedOnCommentId: null)).toList();
    await session.db.update<_i3.Comment>(
      $comment,
      columns: [_i3.Comment.t.repliedOnCommentId],
      transaction: transaction,
    );
  }
}

class CommentDetachRowRepository {
  const CommentDetachRowRepository._();

  Future<void> repliedOnComment(
    _i1.Session session,
    Comment comment, {
    _i1.Transaction? transaction,
  }) async {
    if (comment.id == null) {
      throw ArgumentError.notNull('comment.id');
    }

    var $comment = comment.copyWith(repliedOnCommentId: null);
    await session.db.updateRow<Comment>(
      $comment,
      columns: [Comment.t.repliedOnCommentId],
      transaction: transaction,
    );
  }

  Future<void> replies(
    _i1.Session session,
    _i3.Comment comment, {
    _i1.Transaction? transaction,
  }) async {
    if (comment.id == null) {
      throw ArgumentError.notNull('comment.id');
    }

    var $comment = comment.copyWith(repliedOnCommentId: null);
    await session.db.updateRow<_i3.Comment>(
      $comment,
      columns: [_i3.Comment.t.repliedOnCommentId],
      transaction: transaction,
    );
  }
}
