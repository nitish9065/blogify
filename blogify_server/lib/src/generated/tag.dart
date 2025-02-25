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
import 'blog_tag.dart' as _i2;

abstract class Tag implements _i1.TableRow, _i1.ProtocolSerialization {
  Tag._({
    this.id,
    required this.name,
    this.blogs,
  });

  factory Tag({
    int? id,
    required String name,
    List<_i2.BlogTag>? blogs,
  }) = _TagImpl;

  factory Tag.fromJson(Map<String, dynamic> jsonSerialization) {
    return Tag(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      blogs: (jsonSerialization['blogs'] as List?)
          ?.map((e) => _i2.BlogTag.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = TagTable();

  static const db = TagRepository._();

  @override
  int? id;

  String name;

  List<_i2.BlogTag>? blogs;

  @override
  _i1.Table get table => t;

  Tag copyWith({
    int? id,
    String? name,
    List<_i2.BlogTag>? blogs,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (blogs != null) 'blogs': blogs?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (blogs != null)
        'blogs': blogs?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static TagInclude include({_i2.BlogTagIncludeList? blogs}) {
    return TagInclude._(blogs: blogs);
  }

  static TagIncludeList includeList({
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TagTable>? orderByList,
    TagInclude? include,
  }) {
    return TagIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Tag.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Tag.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TagImpl extends Tag {
  _TagImpl({
    int? id,
    required String name,
    List<_i2.BlogTag>? blogs,
  }) : super._(
          id: id,
          name: name,
          blogs: blogs,
        );

  @override
  Tag copyWith({
    Object? id = _Undefined,
    String? name,
    Object? blogs = _Undefined,
  }) {
    return Tag(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      blogs: blogs is List<_i2.BlogTag>?
          ? blogs
          : this.blogs?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class TagTable extends _i1.Table {
  TagTable({super.tableRelation}) : super(tableName: 'tags') {
    name = _i1.ColumnString(
      'name',
      this,
    );
  }

  late final _i1.ColumnString name;

  _i2.BlogTagTable? ___blogs;

  _i1.ManyRelation<_i2.BlogTagTable>? _blogs;

  _i2.BlogTagTable get __blogs {
    if (___blogs != null) return ___blogs!;
    ___blogs = _i1.createRelationTable(
      relationFieldName: '__blogs',
      field: Tag.t.id,
      foreignField: _i2.BlogTag.t.tagId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.BlogTagTable(tableRelation: foreignTableRelation),
    );
    return ___blogs!;
  }

  _i1.ManyRelation<_i2.BlogTagTable> get blogs {
    if (_blogs != null) return _blogs!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'blogs',
      field: Tag.t.id,
      foreignField: _i2.BlogTag.t.tagId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.BlogTagTable(tableRelation: foreignTableRelation),
    );
    _blogs = _i1.ManyRelation<_i2.BlogTagTable>(
      tableWithRelations: relationTable,
      table: _i2.BlogTagTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _blogs!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'blogs') {
      return __blogs;
    }
    return null;
  }
}

class TagInclude extends _i1.IncludeObject {
  TagInclude._({_i2.BlogTagIncludeList? blogs}) {
    _blogs = blogs;
  }

  _i2.BlogTagIncludeList? _blogs;

  @override
  Map<String, _i1.Include?> get includes => {'blogs': _blogs};

  @override
  _i1.Table get table => Tag.t;
}

class TagIncludeList extends _i1.IncludeList {
  TagIncludeList._({
    _i1.WhereExpressionBuilder<TagTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Tag.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Tag.t;
}

class TagRepository {
  const TagRepository._();

  final attach = const TagAttachRepository._();

  final attachRow = const TagAttachRowRepository._();

  Future<List<Tag>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TagTable>? orderByList,
    _i1.Transaction? transaction,
    TagInclude? include,
  }) async {
    return session.db.find<Tag>(
      where: where?.call(Tag.t),
      orderBy: orderBy?.call(Tag.t),
      orderByList: orderByList?.call(Tag.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Tag?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? offset,
    _i1.OrderByBuilder<TagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TagTable>? orderByList,
    _i1.Transaction? transaction,
    TagInclude? include,
  }) async {
    return session.db.findFirstRow<Tag>(
      where: where?.call(Tag.t),
      orderBy: orderBy?.call(Tag.t),
      orderByList: orderByList?.call(Tag.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Tag?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    TagInclude? include,
  }) async {
    return session.db.findById<Tag>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Tag>> insert(
    _i1.Session session,
    List<Tag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Tag>(
      rows,
      transaction: transaction,
    );
  }

  Future<Tag> insertRow(
    _i1.Session session,
    Tag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Tag>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Tag>> update(
    _i1.Session session,
    List<Tag> rows, {
    _i1.ColumnSelections<TagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Tag>(
      rows,
      columns: columns?.call(Tag.t),
      transaction: transaction,
    );
  }

  Future<Tag> updateRow(
    _i1.Session session,
    Tag row, {
    _i1.ColumnSelections<TagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Tag>(
      row,
      columns: columns?.call(Tag.t),
      transaction: transaction,
    );
  }

  Future<List<Tag>> delete(
    _i1.Session session,
    List<Tag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Tag>(
      rows,
      transaction: transaction,
    );
  }

  Future<Tag> deleteRow(
    _i1.Session session,
    Tag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Tag>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Tag>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TagTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Tag>(
      where: where(Tag.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Tag>(
      where: where?.call(Tag.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class TagAttachRepository {
  const TagAttachRepository._();

  Future<void> blogs(
    _i1.Session session,
    Tag tag,
    List<_i2.BlogTag> blogTag, {
    _i1.Transaction? transaction,
  }) async {
    if (blogTag.any((e) => e.id == null)) {
      throw ArgumentError.notNull('blogTag.id');
    }
    if (tag.id == null) {
      throw ArgumentError.notNull('tag.id');
    }

    var $blogTag = blogTag.map((e) => e.copyWith(tagId: tag.id)).toList();
    await session.db.update<_i2.BlogTag>(
      $blogTag,
      columns: [_i2.BlogTag.t.tagId],
      transaction: transaction,
    );
  }
}

class TagAttachRowRepository {
  const TagAttachRowRepository._();

  Future<void> blogs(
    _i1.Session session,
    Tag tag,
    _i2.BlogTag blogTag, {
    _i1.Transaction? transaction,
  }) async {
    if (blogTag.id == null) {
      throw ArgumentError.notNull('blogTag.id');
    }
    if (tag.id == null) {
      throw ArgumentError.notNull('tag.id');
    }

    var $blogTag = blogTag.copyWith(tagId: tag.id);
    await session.db.updateRow<_i2.BlogTag>(
      $blogTag,
      columns: [_i2.BlogTag.t.tagId],
      transaction: transaction,
    );
  }
}
