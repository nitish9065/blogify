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

abstract class TagDto implements _i1.SerializableModel {
  TagDto._({
    required this.id,
    required this.name,
    required this.postCount,
  });

  factory TagDto({
    required int id,
    required String name,
    required int postCount,
  }) = _TagDtoImpl;

  factory TagDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return TagDto(
      id: jsonSerialization['id'] as int,
      name: jsonSerialization['name'] as String,
      postCount: jsonSerialization['postCount'] as int,
    );
  }

  int id;

  String name;

  int postCount;

  TagDto copyWith({
    int? id,
    String? name,
    int? postCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'postCount': postCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TagDtoImpl extends TagDto {
  _TagDtoImpl({
    required int id,
    required String name,
    required int postCount,
  }) : super._(
          id: id,
          name: name,
          postCount: postCount,
        );

  @override
  TagDto copyWith({
    int? id,
    String? name,
    int? postCount,
  }) {
    return TagDto(
      id: id ?? this.id,
      name: name ?? this.name,
      postCount: postCount ?? this.postCount,
    );
  }
}
