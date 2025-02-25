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

abstract class Member implements _i1.TableRow, _i1.ProtocolSerialization {
  Member._({
    this.id,
    required this.subscriberId,
    this.subscriber,
    required this.subscribedToId,
    this.subscribedTo,
  });

  factory Member({
    int? id,
    required int subscriberId,
    _i2.AppUser? subscriber,
    required int subscribedToId,
    _i2.AppUser? subscribedTo,
  }) = _MemberImpl;

  factory Member.fromJson(Map<String, dynamic> jsonSerialization) {
    return Member(
      id: jsonSerialization['id'] as int?,
      subscriberId: jsonSerialization['subscriberId'] as int,
      subscriber: jsonSerialization['subscriber'] == null
          ? null
          : _i2.AppUser.fromJson(
              (jsonSerialization['subscriber'] as Map<String, dynamic>)),
      subscribedToId: jsonSerialization['subscribedToId'] as int,
      subscribedTo: jsonSerialization['subscribedTo'] == null
          ? null
          : _i2.AppUser.fromJson(
              (jsonSerialization['subscribedTo'] as Map<String, dynamic>)),
    );
  }

  static final t = MemberTable();

  static const db = MemberRepository._();

  @override
  int? id;

  int subscriberId;

  /// The userid of the row who is going to follow another user
  _i2.AppUser? subscriber;

  int subscribedToId;

  /// This is the userId of the row to which user is being subscribed.
  _i2.AppUser? subscribedTo;

  @override
  _i1.Table get table => t;

  Member copyWith({
    int? id,
    int? subscriberId,
    _i2.AppUser? subscriber,
    int? subscribedToId,
    _i2.AppUser? subscribedTo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'subscriberId': subscriberId,
      if (subscriber != null) 'subscriber': subscriber?.toJson(),
      'subscribedToId': subscribedToId,
      if (subscribedTo != null) 'subscribedTo': subscribedTo?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'subscriberId': subscriberId,
      if (subscriber != null) 'subscriber': subscriber?.toJsonForProtocol(),
      'subscribedToId': subscribedToId,
      if (subscribedTo != null)
        'subscribedTo': subscribedTo?.toJsonForProtocol(),
    };
  }

  static MemberInclude include({
    _i2.AppUserInclude? subscriber,
    _i2.AppUserInclude? subscribedTo,
  }) {
    return MemberInclude._(
      subscriber: subscriber,
      subscribedTo: subscribedTo,
    );
  }

  static MemberIncludeList includeList({
    _i1.WhereExpressionBuilder<MemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemberTable>? orderByList,
    MemberInclude? include,
  }) {
    return MemberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Member.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Member.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MemberImpl extends Member {
  _MemberImpl({
    int? id,
    required int subscriberId,
    _i2.AppUser? subscriber,
    required int subscribedToId,
    _i2.AppUser? subscribedTo,
  }) : super._(
          id: id,
          subscriberId: subscriberId,
          subscriber: subscriber,
          subscribedToId: subscribedToId,
          subscribedTo: subscribedTo,
        );

  @override
  Member copyWith({
    Object? id = _Undefined,
    int? subscriberId,
    Object? subscriber = _Undefined,
    int? subscribedToId,
    Object? subscribedTo = _Undefined,
  }) {
    return Member(
      id: id is int? ? id : this.id,
      subscriberId: subscriberId ?? this.subscriberId,
      subscriber:
          subscriber is _i2.AppUser? ? subscriber : this.subscriber?.copyWith(),
      subscribedToId: subscribedToId ?? this.subscribedToId,
      subscribedTo: subscribedTo is _i2.AppUser?
          ? subscribedTo
          : this.subscribedTo?.copyWith(),
    );
  }
}

class MemberTable extends _i1.Table {
  MemberTable({super.tableRelation}) : super(tableName: 'members') {
    subscriberId = _i1.ColumnInt(
      'subscriberId',
      this,
    );
    subscribedToId = _i1.ColumnInt(
      'subscribedToId',
      this,
    );
  }

  late final _i1.ColumnInt subscriberId;

  /// The userid of the row who is going to follow another user
  _i2.AppUserTable? _subscriber;

  late final _i1.ColumnInt subscribedToId;

  /// This is the userId of the row to which user is being subscribed.
  _i2.AppUserTable? _subscribedTo;

  _i2.AppUserTable get subscriber {
    if (_subscriber != null) return _subscriber!;
    _subscriber = _i1.createRelationTable(
      relationFieldName: 'subscriber',
      field: Member.t.subscriberId,
      foreignField: _i2.AppUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AppUserTable(tableRelation: foreignTableRelation),
    );
    return _subscriber!;
  }

  _i2.AppUserTable get subscribedTo {
    if (_subscribedTo != null) return _subscribedTo!;
    _subscribedTo = _i1.createRelationTable(
      relationFieldName: 'subscribedTo',
      field: Member.t.subscribedToId,
      foreignField: _i2.AppUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AppUserTable(tableRelation: foreignTableRelation),
    );
    return _subscribedTo!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        subscriberId,
        subscribedToId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'subscriber') {
      return subscriber;
    }
    if (relationField == 'subscribedTo') {
      return subscribedTo;
    }
    return null;
  }
}

class MemberInclude extends _i1.IncludeObject {
  MemberInclude._({
    _i2.AppUserInclude? subscriber,
    _i2.AppUserInclude? subscribedTo,
  }) {
    _subscriber = subscriber;
    _subscribedTo = subscribedTo;
  }

  _i2.AppUserInclude? _subscriber;

  _i2.AppUserInclude? _subscribedTo;

  @override
  Map<String, _i1.Include?> get includes => {
        'subscriber': _subscriber,
        'subscribedTo': _subscribedTo,
      };

  @override
  _i1.Table get table => Member.t;
}

class MemberIncludeList extends _i1.IncludeList {
  MemberIncludeList._({
    _i1.WhereExpressionBuilder<MemberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Member.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Member.t;
}

class MemberRepository {
  const MemberRepository._();

  final attachRow = const MemberAttachRowRepository._();

  Future<List<Member>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemberTable>? orderByList,
    _i1.Transaction? transaction,
    MemberInclude? include,
  }) async {
    return session.db.find<Member>(
      where: where?.call(Member.t),
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Member?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemberTable>? where,
    int? offset,
    _i1.OrderByBuilder<MemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemberTable>? orderByList,
    _i1.Transaction? transaction,
    MemberInclude? include,
  }) async {
    return session.db.findFirstRow<Member>(
      where: where?.call(Member.t),
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Member?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MemberInclude? include,
  }) async {
    return session.db.findById<Member>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Member>> insert(
    _i1.Session session,
    List<Member> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Member>(
      rows,
      transaction: transaction,
    );
  }

  Future<Member> insertRow(
    _i1.Session session,
    Member row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Member>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Member>> update(
    _i1.Session session,
    List<Member> rows, {
    _i1.ColumnSelections<MemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Member>(
      rows,
      columns: columns?.call(Member.t),
      transaction: transaction,
    );
  }

  Future<Member> updateRow(
    _i1.Session session,
    Member row, {
    _i1.ColumnSelections<MemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Member>(
      row,
      columns: columns?.call(Member.t),
      transaction: transaction,
    );
  }

  Future<List<Member>> delete(
    _i1.Session session,
    List<Member> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Member>(
      rows,
      transaction: transaction,
    );
  }

  Future<Member> deleteRow(
    _i1.Session session,
    Member row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Member>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Member>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MemberTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Member>(
      where: where(Member.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemberTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Member>(
      where: where?.call(Member.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class MemberAttachRowRepository {
  const MemberAttachRowRepository._();

  Future<void> subscriber(
    _i1.Session session,
    Member member,
    _i2.AppUser subscriber, {
    _i1.Transaction? transaction,
  }) async {
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }
    if (subscriber.id == null) {
      throw ArgumentError.notNull('subscriber.id');
    }

    var $member = member.copyWith(subscriberId: subscriber.id);
    await session.db.updateRow<Member>(
      $member,
      columns: [Member.t.subscriberId],
      transaction: transaction,
    );
  }

  Future<void> subscribedTo(
    _i1.Session session,
    Member member,
    _i2.AppUser subscribedTo, {
    _i1.Transaction? transaction,
  }) async {
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }
    if (subscribedTo.id == null) {
      throw ArgumentError.notNull('subscribedTo.id');
    }

    var $member = member.copyWith(subscribedToId: subscribedTo.id);
    await session.db.updateRow<Member>(
      $member,
      columns: [Member.t.subscribedToId],
      transaction: transaction,
    );
  }
}
