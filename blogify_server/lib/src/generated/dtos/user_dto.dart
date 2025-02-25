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

abstract class UserDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UserDto._({
    required this.id,
    required this.name,
    required this.profileUrl,
    this.bio,
  });

  factory UserDto({
    required int id,
    required String name,
    required String profileUrl,
    String? bio,
  }) = _UserDtoImpl;

  factory UserDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserDto(
      id: jsonSerialization['id'] as int,
      name: jsonSerialization['name'] as String,
      profileUrl: jsonSerialization['profileUrl'] as String,
      bio: jsonSerialization['bio'] as String?,
    );
  }

  int id;

  String name;

  String profileUrl;

  String? bio;

  UserDto copyWith({
    int? id,
    String? name,
    String? profileUrl,
    String? bio,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profileUrl': profileUrl,
      if (bio != null) 'bio': bio,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id,
      'name': name,
      'profileUrl': profileUrl,
      if (bio != null) 'bio': bio,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserDtoImpl extends UserDto {
  _UserDtoImpl({
    required int id,
    required String name,
    required String profileUrl,
    String? bio,
  }) : super._(
          id: id,
          name: name,
          profileUrl: profileUrl,
          bio: bio,
        );

  @override
  UserDto copyWith({
    int? id,
    String? name,
    String? profileUrl,
    Object? bio = _Undefined,
  }) {
    return UserDto(
      id: id ?? this.id,
      name: name ?? this.name,
      profileUrl: profileUrl ?? this.profileUrl,
      bio: bio is String? ? bio : this.bio,
    );
  }
}
