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
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import 'blog.dart' as _i3;
import 'comment.dart' as _i4;
import 'member..dart' as _i5;

abstract class AppUser implements _i1.TableRow, _i1.ProtocolSerialization {
  AppUser._({
    this.id,
    required this.userInfoId,
    this.userInfo,
    required this.bio,
    this.blogs,
    this.comments,
    this.followers,
    this.followings,
  });

  factory AppUser({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required String bio,
    List<_i3.Blog>? blogs,
    List<_i4.Comment>? comments,
    List<_i5.Member>? followers,
    List<_i5.Member>? followings,
  }) = _AppUserImpl;

  factory AppUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppUser(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      bio: jsonSerialization['bio'] as String,
      blogs: (jsonSerialization['blogs'] as List?)
          ?.map((e) => _i3.Blog.fromJson((e as Map<String, dynamic>)))
          .toList(),
      comments: (jsonSerialization['comments'] as List?)
          ?.map((e) => _i4.Comment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      followers: (jsonSerialization['followers'] as List?)
          ?.map((e) => _i5.Member.fromJson((e as Map<String, dynamic>)))
          .toList(),
      followings: (jsonSerialization['followings'] as List?)
          ?.map((e) => _i5.Member.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = AppUserTable();

  static const db = AppUserRepository._();

  @override
  int? id;

  int userInfoId;

  _i2.UserInfo? userInfo;

  String bio;

  List<_i3.Blog>? blogs;

  List<_i4.Comment>? comments;

  List<_i5.Member>? followers;

  /// Followings of the user
  List<_i5.Member>? followings;

  @override
  _i1.Table get table => t;

  AppUser copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? bio,
    List<_i3.Blog>? blogs,
    List<_i4.Comment>? comments,
    List<_i5.Member>? followers,
    List<_i5.Member>? followings,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'bio': bio,
      if (blogs != null) 'blogs': blogs?.toJson(valueToJson: (v) => v.toJson()),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJson()),
      if (followers != null)
        'followers': followers?.toJson(valueToJson: (v) => v.toJson()),
      if (followings != null)
        'followings': followings?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      'bio': bio,
      if (blogs != null)
        'blogs': blogs?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (followers != null)
        'followers':
            followers?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (followings != null)
        'followings':
            followings?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static AppUserInclude include({
    _i2.UserInfoInclude? userInfo,
    _i3.BlogIncludeList? blogs,
    _i4.CommentIncludeList? comments,
    _i5.MemberIncludeList? followers,
    _i5.MemberIncludeList? followings,
  }) {
    return AppUserInclude._(
      userInfo: userInfo,
      blogs: blogs,
      comments: comments,
      followers: followers,
      followings: followings,
    );
  }

  static AppUserIncludeList includeList({
    _i1.WhereExpressionBuilder<AppUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppUserTable>? orderByList,
    AppUserInclude? include,
  }) {
    return AppUserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppUser.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AppUser.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppUserImpl extends AppUser {
  _AppUserImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required String bio,
    List<_i3.Blog>? blogs,
    List<_i4.Comment>? comments,
    List<_i5.Member>? followers,
    List<_i5.Member>? followings,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          bio: bio,
          blogs: blogs,
          comments: comments,
          followers: followers,
          followings: followings,
        );

  @override
  AppUser copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    String? bio,
    Object? blogs = _Undefined,
    Object? comments = _Undefined,
    Object? followers = _Undefined,
    Object? followings = _Undefined,
  }) {
    return AppUser(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      bio: bio ?? this.bio,
      blogs: blogs is List<_i3.Blog>?
          ? blogs
          : this.blogs?.map((e0) => e0.copyWith()).toList(),
      comments: comments is List<_i4.Comment>?
          ? comments
          : this.comments?.map((e0) => e0.copyWith()).toList(),
      followers: followers is List<_i5.Member>?
          ? followers
          : this.followers?.map((e0) => e0.copyWith()).toList(),
      followings: followings is List<_i5.Member>?
          ? followings
          : this.followings?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class AppUserTable extends _i1.Table {
  AppUserTable({super.tableRelation}) : super(tableName: 'app_users') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    bio = _i1.ColumnString(
      'bio',
      this,
    );
  }

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  late final _i1.ColumnString bio;

  _i3.BlogTable? ___blogs;

  _i1.ManyRelation<_i3.BlogTable>? _blogs;

  _i4.CommentTable? ___comments;

  _i1.ManyRelation<_i4.CommentTable>? _comments;

  _i5.MemberTable? ___followers;

  _i1.ManyRelation<_i5.MemberTable>? _followers;

  /// Followings of the user
  _i5.MemberTable? ___followings;

  /// Followings of the user
  _i1.ManyRelation<_i5.MemberTable>? _followings;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: AppUser.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  _i3.BlogTable get __blogs {
    if (___blogs != null) return ___blogs!;
    ___blogs = _i1.createRelationTable(
      relationFieldName: '__blogs',
      field: AppUser.t.id,
      foreignField: _i3.Blog.t.authorId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.BlogTable(tableRelation: foreignTableRelation),
    );
    return ___blogs!;
  }

  _i4.CommentTable get __comments {
    if (___comments != null) return ___comments!;
    ___comments = _i1.createRelationTable(
      relationFieldName: '__comments',
      field: AppUser.t.id,
      foreignField: _i4.Comment.t.ownerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.CommentTable(tableRelation: foreignTableRelation),
    );
    return ___comments!;
  }

  _i5.MemberTable get __followers {
    if (___followers != null) return ___followers!;
    ___followers = _i1.createRelationTable(
      relationFieldName: '__followers',
      field: AppUser.t.id,
      foreignField: _i5.Member.t.subscribedToId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.MemberTable(tableRelation: foreignTableRelation),
    );
    return ___followers!;
  }

  _i5.MemberTable get __followings {
    if (___followings != null) return ___followings!;
    ___followings = _i1.createRelationTable(
      relationFieldName: '__followings',
      field: AppUser.t.id,
      foreignField: _i5.Member.t.subscriberId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.MemberTable(tableRelation: foreignTableRelation),
    );
    return ___followings!;
  }

  _i1.ManyRelation<_i3.BlogTable> get blogs {
    if (_blogs != null) return _blogs!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'blogs',
      field: AppUser.t.id,
      foreignField: _i3.Blog.t.authorId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.BlogTable(tableRelation: foreignTableRelation),
    );
    _blogs = _i1.ManyRelation<_i3.BlogTable>(
      tableWithRelations: relationTable,
      table: _i3.BlogTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _blogs!;
  }

  _i1.ManyRelation<_i4.CommentTable> get comments {
    if (_comments != null) return _comments!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'comments',
      field: AppUser.t.id,
      foreignField: _i4.Comment.t.ownerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.CommentTable(tableRelation: foreignTableRelation),
    );
    _comments = _i1.ManyRelation<_i4.CommentTable>(
      tableWithRelations: relationTable,
      table: _i4.CommentTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _comments!;
  }

  _i1.ManyRelation<_i5.MemberTable> get followers {
    if (_followers != null) return _followers!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'followers',
      field: AppUser.t.id,
      foreignField: _i5.Member.t.subscribedToId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.MemberTable(tableRelation: foreignTableRelation),
    );
    _followers = _i1.ManyRelation<_i5.MemberTable>(
      tableWithRelations: relationTable,
      table: _i5.MemberTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _followers!;
  }

  _i1.ManyRelation<_i5.MemberTable> get followings {
    if (_followings != null) return _followings!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'followings',
      field: AppUser.t.id,
      foreignField: _i5.Member.t.subscriberId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.MemberTable(tableRelation: foreignTableRelation),
    );
    _followings = _i1.ManyRelation<_i5.MemberTable>(
      tableWithRelations: relationTable,
      table: _i5.MemberTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _followings!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
        bio,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    if (relationField == 'blogs') {
      return __blogs;
    }
    if (relationField == 'comments') {
      return __comments;
    }
    if (relationField == 'followers') {
      return __followers;
    }
    if (relationField == 'followings') {
      return __followings;
    }
    return null;
  }
}

class AppUserInclude extends _i1.IncludeObject {
  AppUserInclude._({
    _i2.UserInfoInclude? userInfo,
    _i3.BlogIncludeList? blogs,
    _i4.CommentIncludeList? comments,
    _i5.MemberIncludeList? followers,
    _i5.MemberIncludeList? followings,
  }) {
    _userInfo = userInfo;
    _blogs = blogs;
    _comments = comments;
    _followers = followers;
    _followings = followings;
  }

  _i2.UserInfoInclude? _userInfo;

  _i3.BlogIncludeList? _blogs;

  _i4.CommentIncludeList? _comments;

  _i5.MemberIncludeList? _followers;

  _i5.MemberIncludeList? _followings;

  @override
  Map<String, _i1.Include?> get includes => {
        'userInfo': _userInfo,
        'blogs': _blogs,
        'comments': _comments,
        'followers': _followers,
        'followings': _followings,
      };

  @override
  _i1.Table get table => AppUser.t;
}

class AppUserIncludeList extends _i1.IncludeList {
  AppUserIncludeList._({
    _i1.WhereExpressionBuilder<AppUserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AppUser.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => AppUser.t;
}

class AppUserRepository {
  const AppUserRepository._();

  final attach = const AppUserAttachRepository._();

  final attachRow = const AppUserAttachRowRepository._();

  final detach = const AppUserDetachRepository._();

  final detachRow = const AppUserDetachRowRepository._();

  Future<List<AppUser>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppUserTable>? orderByList,
    _i1.Transaction? transaction,
    AppUserInclude? include,
  }) async {
    return session.db.find<AppUser>(
      where: where?.call(AppUser.t),
      orderBy: orderBy?.call(AppUser.t),
      orderByList: orderByList?.call(AppUser.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<AppUser?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppUserTable>? where,
    int? offset,
    _i1.OrderByBuilder<AppUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppUserTable>? orderByList,
    _i1.Transaction? transaction,
    AppUserInclude? include,
  }) async {
    return session.db.findFirstRow<AppUser>(
      where: where?.call(AppUser.t),
      orderBy: orderBy?.call(AppUser.t),
      orderByList: orderByList?.call(AppUser.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<AppUser?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AppUserInclude? include,
  }) async {
    return session.db.findById<AppUser>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<AppUser>> insert(
    _i1.Session session,
    List<AppUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AppUser>(
      rows,
      transaction: transaction,
    );
  }

  Future<AppUser> insertRow(
    _i1.Session session,
    AppUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AppUser>(
      row,
      transaction: transaction,
    );
  }

  Future<List<AppUser>> update(
    _i1.Session session,
    List<AppUser> rows, {
    _i1.ColumnSelections<AppUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AppUser>(
      rows,
      columns: columns?.call(AppUser.t),
      transaction: transaction,
    );
  }

  Future<AppUser> updateRow(
    _i1.Session session,
    AppUser row, {
    _i1.ColumnSelections<AppUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AppUser>(
      row,
      columns: columns?.call(AppUser.t),
      transaction: transaction,
    );
  }

  Future<List<AppUser>> delete(
    _i1.Session session,
    List<AppUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AppUser>(
      rows,
      transaction: transaction,
    );
  }

  Future<AppUser> deleteRow(
    _i1.Session session,
    AppUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AppUser>(
      row,
      transaction: transaction,
    );
  }

  Future<List<AppUser>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AppUserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AppUser>(
      where: where(AppUser.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppUserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AppUser>(
      where: where?.call(AppUser.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AppUserAttachRepository {
  const AppUserAttachRepository._();

  Future<void> blogs(
    _i1.Session session,
    AppUser appUser,
    List<_i3.Blog> blog, {
    _i1.Transaction? transaction,
  }) async {
    if (blog.any((e) => e.id == null)) {
      throw ArgumentError.notNull('blog.id');
    }
    if (appUser.id == null) {
      throw ArgumentError.notNull('appUser.id');
    }

    var $blog = blog.map((e) => e.copyWith(authorId: appUser.id)).toList();
    await session.db.update<_i3.Blog>(
      $blog,
      columns: [_i3.Blog.t.authorId],
      transaction: transaction,
    );
  }

  Future<void> comments(
    _i1.Session session,
    AppUser appUser,
    List<_i4.Comment> comment, {
    _i1.Transaction? transaction,
  }) async {
    if (comment.any((e) => e.id == null)) {
      throw ArgumentError.notNull('comment.id');
    }
    if (appUser.id == null) {
      throw ArgumentError.notNull('appUser.id');
    }

    var $comment = comment.map((e) => e.copyWith(ownerId: appUser.id)).toList();
    await session.db.update<_i4.Comment>(
      $comment,
      columns: [_i4.Comment.t.ownerId],
      transaction: transaction,
    );
  }

  Future<void> followers(
    _i1.Session session,
    AppUser appUser,
    List<_i5.Member> member, {
    _i1.Transaction? transaction,
  }) async {
    if (member.any((e) => e.id == null)) {
      throw ArgumentError.notNull('member.id');
    }
    if (appUser.id == null) {
      throw ArgumentError.notNull('appUser.id');
    }

    var $member =
        member.map((e) => e.copyWith(subscribedToId: appUser.id)).toList();
    await session.db.update<_i5.Member>(
      $member,
      columns: [_i5.Member.t.subscribedToId],
      transaction: transaction,
    );
  }

  Future<void> followings(
    _i1.Session session,
    AppUser appUser,
    List<_i5.Member> member, {
    _i1.Transaction? transaction,
  }) async {
    if (member.any((e) => e.id == null)) {
      throw ArgumentError.notNull('member.id');
    }
    if (appUser.id == null) {
      throw ArgumentError.notNull('appUser.id');
    }

    var $member =
        member.map((e) => e.copyWith(subscriberId: appUser.id)).toList();
    await session.db.update<_i5.Member>(
      $member,
      columns: [_i5.Member.t.subscriberId],
      transaction: transaction,
    );
  }
}

class AppUserAttachRowRepository {
  const AppUserAttachRowRepository._();

  Future<void> userInfo(
    _i1.Session session,
    AppUser appUser,
    _i2.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (appUser.id == null) {
      throw ArgumentError.notNull('appUser.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $appUser = appUser.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<AppUser>(
      $appUser,
      columns: [AppUser.t.userInfoId],
      transaction: transaction,
    );
  }

  Future<void> blogs(
    _i1.Session session,
    AppUser appUser,
    _i3.Blog blog, {
    _i1.Transaction? transaction,
  }) async {
    if (blog.id == null) {
      throw ArgumentError.notNull('blog.id');
    }
    if (appUser.id == null) {
      throw ArgumentError.notNull('appUser.id');
    }

    var $blog = blog.copyWith(authorId: appUser.id);
    await session.db.updateRow<_i3.Blog>(
      $blog,
      columns: [_i3.Blog.t.authorId],
      transaction: transaction,
    );
  }

  Future<void> comments(
    _i1.Session session,
    AppUser appUser,
    _i4.Comment comment, {
    _i1.Transaction? transaction,
  }) async {
    if (comment.id == null) {
      throw ArgumentError.notNull('comment.id');
    }
    if (appUser.id == null) {
      throw ArgumentError.notNull('appUser.id');
    }

    var $comment = comment.copyWith(ownerId: appUser.id);
    await session.db.updateRow<_i4.Comment>(
      $comment,
      columns: [_i4.Comment.t.ownerId],
      transaction: transaction,
    );
  }

  Future<void> followers(
    _i1.Session session,
    AppUser appUser,
    _i5.Member member, {
    _i1.Transaction? transaction,
  }) async {
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }
    if (appUser.id == null) {
      throw ArgumentError.notNull('appUser.id');
    }

    var $member = member.copyWith(subscribedToId: appUser.id);
    await session.db.updateRow<_i5.Member>(
      $member,
      columns: [_i5.Member.t.subscribedToId],
      transaction: transaction,
    );
  }

  Future<void> followings(
    _i1.Session session,
    AppUser appUser,
    _i5.Member member, {
    _i1.Transaction? transaction,
  }) async {
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }
    if (appUser.id == null) {
      throw ArgumentError.notNull('appUser.id');
    }

    var $member = member.copyWith(subscriberId: appUser.id);
    await session.db.updateRow<_i5.Member>(
      $member,
      columns: [_i5.Member.t.subscriberId],
      transaction: transaction,
    );
  }
}

class AppUserDetachRepository {
  const AppUserDetachRepository._();

  Future<void> blogs(
    _i1.Session session,
    List<_i3.Blog> blog, {
    _i1.Transaction? transaction,
  }) async {
    if (blog.any((e) => e.id == null)) {
      throw ArgumentError.notNull('blog.id');
    }

    var $blog = blog.map((e) => e.copyWith(authorId: null)).toList();
    await session.db.update<_i3.Blog>(
      $blog,
      columns: [_i3.Blog.t.authorId],
      transaction: transaction,
    );
  }

  Future<void> comments(
    _i1.Session session,
    List<_i4.Comment> comment, {
    _i1.Transaction? transaction,
  }) async {
    if (comment.any((e) => e.id == null)) {
      throw ArgumentError.notNull('comment.id');
    }

    var $comment = comment.map((e) => e.copyWith(ownerId: null)).toList();
    await session.db.update<_i4.Comment>(
      $comment,
      columns: [_i4.Comment.t.ownerId],
      transaction: transaction,
    );
  }

  Future<void> followers(
    _i1.Session session,
    List<_i5.Member> member, {
    _i1.Transaction? transaction,
  }) async {
    if (member.any((e) => e.id == null)) {
      throw ArgumentError.notNull('member.id');
    }

    var $member = member.map((e) => e.copyWith(subscribedToId: null)).toList();
    await session.db.update<_i5.Member>(
      $member,
      columns: [_i5.Member.t.subscribedToId],
      transaction: transaction,
    );
  }

  Future<void> followings(
    _i1.Session session,
    List<_i5.Member> member, {
    _i1.Transaction? transaction,
  }) async {
    if (member.any((e) => e.id == null)) {
      throw ArgumentError.notNull('member.id');
    }

    var $member = member.map((e) => e.copyWith(subscriberId: null)).toList();
    await session.db.update<_i5.Member>(
      $member,
      columns: [_i5.Member.t.subscriberId],
      transaction: transaction,
    );
  }
}

class AppUserDetachRowRepository {
  const AppUserDetachRowRepository._();

  Future<void> blogs(
    _i1.Session session,
    _i3.Blog blog, {
    _i1.Transaction? transaction,
  }) async {
    if (blog.id == null) {
      throw ArgumentError.notNull('blog.id');
    }

    var $blog = blog.copyWith(authorId: null);
    await session.db.updateRow<_i3.Blog>(
      $blog,
      columns: [_i3.Blog.t.authorId],
      transaction: transaction,
    );
  }

  Future<void> comments(
    _i1.Session session,
    _i4.Comment comment, {
    _i1.Transaction? transaction,
  }) async {
    if (comment.id == null) {
      throw ArgumentError.notNull('comment.id');
    }

    var $comment = comment.copyWith(ownerId: null);
    await session.db.updateRow<_i4.Comment>(
      $comment,
      columns: [_i4.Comment.t.ownerId],
      transaction: transaction,
    );
  }

  Future<void> followers(
    _i1.Session session,
    _i5.Member member, {
    _i1.Transaction? transaction,
  }) async {
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    var $member = member.copyWith(subscribedToId: null);
    await session.db.updateRow<_i5.Member>(
      $member,
      columns: [_i5.Member.t.subscribedToId],
      transaction: transaction,
    );
  }

  Future<void> followings(
    _i1.Session session,
    _i5.Member member, {
    _i1.Transaction? transaction,
  }) async {
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    var $member = member.copyWith(subscriberId: null);
    await session.db.updateRow<_i5.Member>(
      $member,
      columns: [_i5.Member.t.subscriberId],
      transaction: transaction,
    );
  }
}
