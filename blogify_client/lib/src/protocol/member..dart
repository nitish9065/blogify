/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'app_user.dart' as _i2;

abstract class Member implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int subscriberId;

  /// The userid of the row who is going to follow another user
  _i2.AppUser? subscriber;

  int subscribedToId;

  /// This is the userId of the row to which user is being subscribed.
  _i2.AppUser? subscribedTo;

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
