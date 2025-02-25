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
import '../dtos/user_dto.dart' as _i2;
import '../dtos/tag_dto.dart' as _i3;
import '../dtos/category_dto.dart' as _i4;
import '../post_status.dart' as _i5;

abstract class BlogDto implements _i1.SerializableModel {
  BlogDto._({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.tags,
    required this.category,
    required this.readingTime,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  factory BlogDto({
    required int id,
    required String title,
    required String content,
    required _i2.UserDto author,
    required List<_i3.TagDto> tags,
    required _i4.CategoryDto category,
    required int readingTime,
    required DateTime createdAt,
    required DateTime updatedAt,
    required _i5.PostStatus status,
  }) = _BlogDtoImpl;

  factory BlogDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return BlogDto(
      id: jsonSerialization['id'] as int,
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      author: _i2.UserDto.fromJson(
          (jsonSerialization['author'] as Map<String, dynamic>)),
      tags: (jsonSerialization['tags'] as List)
          .map((e) => _i3.TagDto.fromJson((e as Map<String, dynamic>)))
          .toList(),
      category: _i4.CategoryDto.fromJson(
          (jsonSerialization['category'] as Map<String, dynamic>)),
      readingTime: jsonSerialization['readingTime'] as int,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      status: _i5.PostStatus.fromJson((jsonSerialization['status'] as String)),
    );
  }

  int id;

  String title;

  String content;

  _i2.UserDto author;

  List<_i3.TagDto> tags;

  _i4.CategoryDto category;

  int readingTime;

  DateTime createdAt;

  DateTime updatedAt;

  _i5.PostStatus status;

  BlogDto copyWith({
    int? id,
    String? title,
    String? content,
    _i2.UserDto? author,
    List<_i3.TagDto>? tags,
    _i4.CategoryDto? category,
    int? readingTime,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i5.PostStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'author': author.toJson(),
      'tags': tags.toJson(valueToJson: (v) => v.toJson()),
      'category': category.toJson(),
      'readingTime': readingTime,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'status': status.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _BlogDtoImpl extends BlogDto {
  _BlogDtoImpl({
    required int id,
    required String title,
    required String content,
    required _i2.UserDto author,
    required List<_i3.TagDto> tags,
    required _i4.CategoryDto category,
    required int readingTime,
    required DateTime createdAt,
    required DateTime updatedAt,
    required _i5.PostStatus status,
  }) : super._(
          id: id,
          title: title,
          content: content,
          author: author,
          tags: tags,
          category: category,
          readingTime: readingTime,
          createdAt: createdAt,
          updatedAt: updatedAt,
          status: status,
        );

  @override
  BlogDto copyWith({
    int? id,
    String? title,
    String? content,
    _i2.UserDto? author,
    List<_i3.TagDto>? tags,
    _i4.CategoryDto? category,
    int? readingTime,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i5.PostStatus? status,
  }) {
    return BlogDto(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      author: author ?? this.author.copyWith(),
      tags: tags ?? this.tags.map((e0) => e0.copyWith()).toList(),
      category: category ?? this.category.copyWith(),
      readingTime: readingTime ?? this.readingTime,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
    );
  }
}
