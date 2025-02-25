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
import 'app_user.dart' as _i2;
import 'comment.dart' as _i3;

abstract class Comment implements _i1.SerializableModel {
  Comment._({
    this.id,
    required this.content,
    required this.ownerId,
    this.owner,
    required this.postId,
    this.repliedOnCommentId,
    this.repliedOnComment,
    this.replies,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Comment({
    int? id,
    required String content,
    required int ownerId,
    _i2.AppUser? owner,
    required int postId,
    int? repliedOnCommentId,
    _i3.Comment? repliedOnComment,
    List<_i3.Comment>? replies,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CommentImpl;

  factory Comment.fromJson(Map<String, dynamic> jsonSerialization) {
    return Comment(
      id: jsonSerialization['id'] as int?,
      content: jsonSerialization['content'] as String,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.AppUser.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      postId: jsonSerialization['postId'] as int,
      repliedOnCommentId: jsonSerialization['repliedOnCommentId'] as int?,
      repliedOnComment: jsonSerialization['repliedOnComment'] == null
          ? null
          : _i3.Comment.fromJson(
              (jsonSerialization['repliedOnComment'] as Map<String, dynamic>)),
      replies: (jsonSerialization['replies'] as List?)
          ?.map((e) => _i3.Comment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String content;

  int ownerId;

  /// User who have written the comment
  _i2.AppUser? owner;

  /// Post on which this comment hav been made
  int postId;

  int? repliedOnCommentId;

  /// This is self reference in order to store the id of the comment on which reply is being made
  _i3.Comment? repliedOnComment;

  /// Stores the list of comment/replies made on a comment of a post.
  List<_i3.Comment>? replies;

  DateTime createdAt;

  DateTime updatedAt;

  Comment copyWith({
    int? id,
    String? content,
    int? ownerId,
    _i2.AppUser? owner,
    int? postId,
    int? repliedOnCommentId,
    _i3.Comment? repliedOnComment,
    List<_i3.Comment>? replies,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'content': content,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'postId': postId,
      if (repliedOnCommentId != null) 'repliedOnCommentId': repliedOnCommentId,
      if (repliedOnComment != null)
        'repliedOnComment': repliedOnComment?.toJson(),
      if (replies != null)
        'replies': replies?.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommentImpl extends Comment {
  _CommentImpl({
    int? id,
    required String content,
    required int ownerId,
    _i2.AppUser? owner,
    required int postId,
    int? repliedOnCommentId,
    _i3.Comment? repliedOnComment,
    List<_i3.Comment>? replies,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          content: content,
          ownerId: ownerId,
          owner: owner,
          postId: postId,
          repliedOnCommentId: repliedOnCommentId,
          repliedOnComment: repliedOnComment,
          replies: replies,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  Comment copyWith({
    Object? id = _Undefined,
    String? content,
    int? ownerId,
    Object? owner = _Undefined,
    int? postId,
    Object? repliedOnCommentId = _Undefined,
    Object? repliedOnComment = _Undefined,
    Object? replies = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Comment(
      id: id is int? ? id : this.id,
      content: content ?? this.content,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.AppUser? ? owner : this.owner?.copyWith(),
      postId: postId ?? this.postId,
      repliedOnCommentId: repliedOnCommentId is int?
          ? repliedOnCommentId
          : this.repliedOnCommentId,
      repliedOnComment: repliedOnComment is _i3.Comment?
          ? repliedOnComment
          : this.repliedOnComment?.copyWith(),
      replies: replies is List<_i3.Comment>?
          ? replies
          : this.replies?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
