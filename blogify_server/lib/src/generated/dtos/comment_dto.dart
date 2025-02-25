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
import '../dtos/user_dto.dart' as _i2;

abstract class CommentDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CommentDto._({
    required this.id,
    required this.content,
    required this.owner,
    required this.postId,
    required this.repliesCount,
    required this.updatedAt,
  });

  factory CommentDto({
    required int id,
    required String content,
    required _i2.UserDto owner,
    required int postId,
    required int repliesCount,
    required DateTime updatedAt,
  }) = _CommentDtoImpl;

  factory CommentDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return CommentDto(
      id: jsonSerialization['id'] as int,
      content: jsonSerialization['content'] as String,
      owner: _i2.UserDto.fromJson(
          (jsonSerialization['owner'] as Map<String, dynamic>)),
      postId: jsonSerialization['postId'] as int,
      repliesCount: jsonSerialization['repliesCount'] as int,
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  int id;

  String content;

  _i2.UserDto owner;

  int postId;

  int repliesCount;

  DateTime updatedAt;

  CommentDto copyWith({
    int? id,
    String? content,
    _i2.UserDto? owner,
    int? postId,
    int? repliesCount,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'owner': owner.toJson(),
      'postId': postId,
      'repliesCount': repliesCount,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id,
      'content': content,
      'owner': owner.toJsonForProtocol(),
      'postId': postId,
      'repliesCount': repliesCount,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CommentDtoImpl extends CommentDto {
  _CommentDtoImpl({
    required int id,
    required String content,
    required _i2.UserDto owner,
    required int postId,
    required int repliesCount,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          content: content,
          owner: owner,
          postId: postId,
          repliesCount: repliesCount,
          updatedAt: updatedAt,
        );

  @override
  CommentDto copyWith({
    int? id,
    String? content,
    _i2.UserDto? owner,
    int? postId,
    int? repliesCount,
    DateTime? updatedAt,
  }) {
    return CommentDto(
      id: id ?? this.id,
      content: content ?? this.content,
      owner: owner ?? this.owner.copyWith(),
      postId: postId ?? this.postId,
      repliesCount: repliesCount ?? this.repliesCount,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
