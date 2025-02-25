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
import 'blog.dart' as _i2;

abstract class Category implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String? icon;

  List<_i2.Blog>? blogs;

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
