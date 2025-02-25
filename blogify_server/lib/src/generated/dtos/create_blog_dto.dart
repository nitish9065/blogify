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
import '../post_status.dart' as _i2;

abstract class CreateBlogDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateBlogDto._({
    this.id,
    required this.title,
    required this.content,
    required this.categoryId,
    required this.tags,
    required this.userId,
    required this.status,
  });

  factory CreateBlogDto({
    int? id,
    required String title,
    required String content,
    required int categoryId,
    required List<int> tags,
    required int userId,
    required _i2.PostStatus status,
  }) = _CreateBlogDtoImpl;

  factory CreateBlogDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreateBlogDto(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      categoryId: jsonSerialization['categoryId'] as int,
      tags: (jsonSerialization['tags'] as List).map((e) => e as int).toList(),
      userId: jsonSerialization['userId'] as int,
      status: _i2.PostStatus.fromJson((jsonSerialization['status'] as String)),
    );
  }

  int? id;

  String title;

  String content;

  int categoryId;

  List<int> tags;

  int userId;

  _i2.PostStatus status;

  CreateBlogDto copyWith({
    int? id,
    String? title,
    String? content,
    int? categoryId,
    List<int>? tags,
    int? userId,
    _i2.PostStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'content': content,
      'categoryId': categoryId,
      'tags': tags.toJson(),
      'userId': userId,
      'status': status.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'content': content,
      'categoryId': categoryId,
      'tags': tags.toJson(),
      'userId': userId,
      'status': status.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateBlogDtoImpl extends CreateBlogDto {
  _CreateBlogDtoImpl({
    int? id,
    required String title,
    required String content,
    required int categoryId,
    required List<int> tags,
    required int userId,
    required _i2.PostStatus status,
  }) : super._(
          id: id,
          title: title,
          content: content,
          categoryId: categoryId,
          tags: tags,
          userId: userId,
          status: status,
        );

  @override
  CreateBlogDto copyWith({
    Object? id = _Undefined,
    String? title,
    String? content,
    int? categoryId,
    List<int>? tags,
    int? userId,
    _i2.PostStatus? status,
  }) {
    return CreateBlogDto(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      categoryId: categoryId ?? this.categoryId,
      tags: tags ?? this.tags.map((e0) => e0).toList(),
      userId: userId ?? this.userId,
      status: status ?? this.status,
    );
  }
}
