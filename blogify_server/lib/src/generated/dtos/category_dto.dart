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

abstract class CategoryDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CategoryDto._({
    required this.id,
    required this.name,
    this.icon,
    required this.postCount,
  });

  factory CategoryDto({
    required int id,
    required String name,
    String? icon,
    required int postCount,
  }) = _CategoryDtoImpl;

  factory CategoryDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return CategoryDto(
      id: jsonSerialization['id'] as int,
      name: jsonSerialization['name'] as String,
      icon: jsonSerialization['icon'] as String?,
      postCount: jsonSerialization['postCount'] as int,
    );
  }

  int id;

  String name;

  String? icon;

  int postCount;

  CategoryDto copyWith({
    int? id,
    String? name,
    String? icon,
    int? postCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (icon != null) 'icon': icon,
      'postCount': postCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id,
      'name': name,
      if (icon != null) 'icon': icon,
      'postCount': postCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CategoryDtoImpl extends CategoryDto {
  _CategoryDtoImpl({
    required int id,
    required String name,
    String? icon,
    required int postCount,
  }) : super._(
          id: id,
          name: name,
          icon: icon,
          postCount: postCount,
        );

  @override
  CategoryDto copyWith({
    int? id,
    String? name,
    Object? icon = _Undefined,
    int? postCount,
  }) {
    return CategoryDto(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon is String? ? icon : this.icon,
      postCount: postCount ?? this.postCount,
    );
  }
}
