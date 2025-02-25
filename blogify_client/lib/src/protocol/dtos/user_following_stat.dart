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

abstract class UserFollowingStat implements _i1.SerializableModel {
  UserFollowingStat._({required this.isFollowing});

  factory UserFollowingStat({required bool isFollowing}) =
      _UserFollowingStatImpl;

  factory UserFollowingStat.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserFollowingStat(
        isFollowing: jsonSerialization['isFollowing'] as bool);
  }

  bool isFollowing;

  UserFollowingStat copyWith({bool? isFollowing});
  @override
  Map<String, dynamic> toJson() {
    return {'isFollowing': isFollowing};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UserFollowingStatImpl extends UserFollowingStat {
  _UserFollowingStatImpl({required bool isFollowing})
      : super._(isFollowing: isFollowing);

  @override
  UserFollowingStat copyWith({bool? isFollowing}) {
    return UserFollowingStat(isFollowing: isFollowing ?? this.isFollowing);
  }
}
