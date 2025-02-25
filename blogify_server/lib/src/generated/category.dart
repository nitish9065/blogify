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

abstract class Category implements _i1.TableRow, _i1.ProtocolSerialization {
  Category._({
    this.id,
    required this.name,
    this.icon,
    this.blogs,
  });

  factory Category({
    int? id,
    required String name,
    String? icon,
    List<_i2.Blog>? blogs,
  }) = _CategoryImpl;

  factory Category.fromJson(Map<String, dynamic> jsonSerialization) {
    return Category(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      icon: jsonSerialization['icon'] as String?,
      blogs: (jsonSerialization['blogs'] as List?)
          ?.map((e) => _i2.Blog.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = CategoryTable();

  static const db = CategoryRepository._();

  @override
  int? id;

  String name;

  String? icon;

  List<_i2.Blog>? blogs;

  @override
  _i1.Table get table => t;

  Category copyWith({
    int? id,
    String? name,
    String? icon,
    List<_i2.Blog>? blogs,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (icon != null) 'icon': icon,
      if (blogs != null) 'blogs': blogs?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (icon != null) 'icon': icon,
      if (blogs != null)
        'blogs': blogs?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static CategoryInclude include({_i2.BlogIncludeList? blogs}) {
    return CategoryInclude._(blogs: blogs);
  }

  static CategoryIncludeList includeList({
    _i1.WhereExpressionBuilder<CategoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategoryTable>? orderByList,
    CategoryInclude? include,
  }) {
    return CategoryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Category.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Category.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CategoryImpl extends Category {
  _CategoryImpl({
    int? id,
    required String name,
    String? icon,
    List<_i2.Blog>? blogs,
  }) : super._(
          id: id,
          name: name,
          icon: icon,
          blogs: blogs,
        );

  @override
  Category copyWith({
    Object? id = _Undefined,
    String? name,
    Object? icon = _Undefined,
    Object? blogs = _Undefined,
  }) {
    return Category(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      icon: icon is String? ? icon : this.icon,
      blogs: blogs is List<_i2.Blog>?
          ? blogs
          : this.blogs?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class CategoryTable extends _i1.Table {
  CategoryTable({super.tableRelation}) : super(tableName: 'categories') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    icon = _i1.ColumnString(
      'icon',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString icon;

  _i2.BlogTable? ___blogs;

  _i1.ManyRelation<_i2.BlogTable>? _blogs;

  _i2.BlogTable get __blogs {
    if (___blogs != null) return ___blogs!;
    ___blogs = _i1.createRelationTable(
      relationFieldName: '__blogs',
      field: Category.t.id,
      foreignField: _i2.Blog.t.categoryId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.BlogTable(tableRelation: foreignTableRelation),
    );
    return ___blogs!;
  }

  _i1.ManyRelation<_i2.BlogTable> get blogs {
    if (_blogs != null) return _blogs!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'blogs',
      field: Category.t.id,
      foreignField: _i2.Blog.t.categoryId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.BlogTable(tableRelation: foreignTableRelation),
    );
    _blogs = _i1.ManyRelation<_i2.BlogTable>(
      tableWithRelations: relationTable,
      table: _i2.BlogTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _blogs!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        icon,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'blogs') {
      return __blogs;
    }
    return null;
  }
}

class CategoryInclude extends _i1.IncludeObject {
  CategoryInclude._({_i2.BlogIncludeList? blogs}) {
    _blogs = blogs;
  }

  _i2.BlogIncludeList? _blogs;

  @override
  Map<String, _i1.Include?> get includes => {'blogs': _blogs};

  @override
  _i1.Table get table => Category.t;
}

class CategoryIncludeList extends _i1.IncludeList {
  CategoryIncludeList._({
    _i1.WhereExpressionBuilder<CategoryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Category.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Category.t;
}

class CategoryRepository {
  const CategoryRepository._();

  final attach = const CategoryAttachRepository._();

  final attachRow = const CategoryAttachRowRepository._();

  Future<List<Category>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategoryTable>? orderByList,
    _i1.Transaction? transaction,
    CategoryInclude? include,
  }) async {
    return session.db.find<Category>(
      where: where?.call(Category.t),
      orderBy: orderBy?.call(Category.t),
      orderByList: orderByList?.call(Category.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Category?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategoryTable>? where,
    int? offset,
    _i1.OrderByBuilder<CategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategoryTable>? orderByList,
    _i1.Transaction? transaction,
    CategoryInclude? include,
  }) async {
    return session.db.findFirstRow<Category>(
      where: where?.call(Category.t),
      orderBy: orderBy?.call(Category.t),
      orderByList: orderByList?.call(Category.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Category?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CategoryInclude? include,
  }) async {
    return session.db.findById<Category>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Category>> insert(
    _i1.Session session,
    List<Category> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Category>(
      rows,
      transaction: transaction,
    );
  }

  Future<Category> insertRow(
    _i1.Session session,
    Category row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Category>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Category>> update(
    _i1.Session session,
    List<Category> rows, {
    _i1.ColumnSelections<CategoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Category>(
      rows,
      columns: columns?.call(Category.t),
      transaction: transaction,
    );
  }

  Future<Category> updateRow(
    _i1.Session session,
    Category row, {
    _i1.ColumnSelections<CategoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Category>(
      row,
      columns: columns?.call(Category.t),
      transaction: transaction,
    );
  }

  Future<List<Category>> delete(
    _i1.Session session,
    List<Category> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Category>(
      rows,
      transaction: transaction,
    );
  }

  Future<Category> deleteRow(
    _i1.Session session,
    Category row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Category>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Category>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CategoryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Category>(
      where: where(Category.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategoryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Category>(
      where: where?.call(Category.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CategoryAttachRepository {
  const CategoryAttachRepository._();

  Future<void> blogs(
    _i1.Session session,
    Category category,
    List<_i2.Blog> blog, {
    _i1.Transaction? transaction,
  }) async {
    if (blog.any((e) => e.id == null)) {
      throw ArgumentError.notNull('blog.id');
    }
    if (category.id == null) {
      throw ArgumentError.notNull('category.id');
    }

    var $blog = blog.map((e) => e.copyWith(categoryId: category.id)).toList();
    await session.db.update<_i2.Blog>(
      $blog,
      columns: [_i2.Blog.t.categoryId],
      transaction: transaction,
    );
  }
}

class CategoryAttachRowRepository {
  const CategoryAttachRowRepository._();

  Future<void> blogs(
    _i1.Session session,
    Category category,
    _i2.Blog blog, {
    _i1.Transaction? transaction,
  }) async {
    if (blog.id == null) {
      throw ArgumentError.notNull('blog.id');
    }
    if (category.id == null) {
      throw ArgumentError.notNull('category.id');
    }

    var $blog = blog.copyWith(categoryId: category.id);
    await session.db.updateRow<_i2.Blog>(
      $blog,
      columns: [_i2.Blog.t.categoryId],
      transaction: transaction,
    );
  }
}
