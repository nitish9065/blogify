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

abstract class UserStats
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UserStats._({
    required this.userId,
    required this.followersCount,
    required this.followingCount,
    required this.blogCount,
  });

  factory UserStats({
    required int userId,
    required int followersCount,
    required int followingCount,
    required int blogCount,
  }) = _UserStatsImpl;

  factory UserStats.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserStats(
      userId: jsonSerialization['userId'] as int,
      followersCount: jsonSerialization['followersCount'] as int,
      followingCount: jsonSerialization['followingCount'] as int,
      blogCount: jsonSerialization['blogCount'] as int,
    );
  }

  int userId;

  int followersCount;

  int followingCount;

  int blogCount;

  UserStats copyWith({
    int? userId,
    int? followersCount,
    int? followingCount,
    int? blogCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'blogCount': blogCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'userId': userId,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'blogCount': blogCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UserStatsImpl extends UserStats {
  _UserStatsImpl({
    required int userId,
    required int followersCount,
    required int followingCount,
    required int blogCount,
  }) : super._(
          userId: userId,
          followersCount: followersCount,
          followingCount: followingCount,
          blogCount: blogCount,
        );

  @override
  UserStats copyWith({
    int? userId,
    int? followersCount,
    int? followingCount,
    int? blogCount,
  }) {
    return UserStats(
      userId: userId ?? this.userId,
      followersCount: followersCount ?? this.followersCount,
      followingCount: followingCount ?? this.followingCount,
      blogCount: blogCount ?? this.blogCount,
    );
  }
}
