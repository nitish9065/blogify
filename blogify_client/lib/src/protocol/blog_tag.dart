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
import 'tag.dart' as _i3;

abstract class BlogTag implements _i1.SerializableModel {
  BlogTag._({
    this.id,
    required this.blogId,
    this.blog,
    required this.tagId,
    this.tag,
  });

  factory BlogTag({
    int? id,
    required int blogId,
    _i2.Blog? blog,
    required int tagId,
    _i3.Tag? tag,
  }) = _BlogTagImpl;

  factory BlogTag.fromJson(Map<String, dynamic> jsonSerialization) {
    return BlogTag(
      id: jsonSerialization['id'] as int?,
      blogId: jsonSerialization['blogId'] as int,
      blog: jsonSerialization['blog'] == null
          ? null
          : _i2.Blog.fromJson(
              (jsonSerialization['blog'] as Map<String, dynamic>)),
      tagId: jsonSerialization['tagId'] as int,
      tag: jsonSerialization['tag'] == null
          ? null
          : _i3.Tag.fromJson(
              (jsonSerialization['tag'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int blogId;

  _i2.Blog? blog;

  int tagId;

  _i3.Tag? tag;

  BlogTag copyWith({
    int? id,
    int? blogId,
    _i2.Blog? blog,
    int? tagId,
    _i3.Tag? tag,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'blogId': blogId,
      if (blog != null) 'blog': blog?.toJson(),
      'tagId': tagId,
      if (tag != null) 'tag': tag?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BlogTagImpl extends BlogTag {
  _BlogTagImpl({
    int? id,
    required int blogId,
    _i2.Blog? blog,
    required int tagId,
    _i3.Tag? tag,
  }) : super._(
          id: id,
          blogId: blogId,
          blog: blog,
          tagId: tagId,
          tag: tag,
        );

  @override
  BlogTag copyWith({
    Object? id = _Undefined,
    int? blogId,
    Object? blog = _Undefined,
    int? tagId,
    Object? tag = _Undefined,
  }) {
    return BlogTag(
      id: id is int? ? id : this.id,
      blogId: blogId ?? this.blogId,
      blog: blog is _i2.Blog? ? blog : this.blog?.copyWith(),
      tagId: tagId ?? this.tagId,
      tag: tag is _i3.Tag? ? tag : this.tag?.copyWith(),
    );
  }
}
