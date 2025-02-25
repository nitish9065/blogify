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
import 'category.dart' as _i3;
import 'blog_tag.dart' as _i4;
import 'comment.dart' as _i5;
import 'post_status.dart' as _i6;
import 'blog.dart' as _i7;

abstract class Blog implements _i1.SerializableModel {
  Blog._({
    this.id,
    required this.title,
    required this.content,
    required this.authorId,
    this.author,
    required this.categoryId,
    this.category,
    this.tags,
    this.comments,
    required this.status,
    required this.readingTime,
    this.previous,
    this.nextId,
    this.next,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Blog({
    int? id,
    required String title,
    required String content,
    required int authorId,
    _i2.AppUser? author,
    required int categoryId,
    _i3.Category? category,
    List<_i4.BlogTag>? tags,
    List<_i5.Comment>? comments,
    required _i6.PostStatus status,
    required int readingTime,
    _i7.Blog? previous,
    int? nextId,
    _i7.Blog? next,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _BlogImpl;

  factory Blog.fromJson(Map<String, dynamic> jsonSerialization) {
    return Blog(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      authorId: jsonSerialization['authorId'] as int,
      author: jsonSerialization['author'] == null
          ? null
          : _i2.AppUser.fromJson(
              (jsonSerialization['author'] as Map<String, dynamic>)),
      categoryId: jsonSerialization['categoryId'] as int,
      category: jsonSerialization['category'] == null
          ? null
          : _i3.Category.fromJson(
              (jsonSerialization['category'] as Map<String, dynamic>)),
      tags: (jsonSerialization['tags'] as List?)
          ?.map((e) => _i4.BlogTag.fromJson((e as Map<String, dynamic>)))
          .toList(),
      comments: (jsonSerialization['comments'] as List?)
          ?.map((e) => _i5.Comment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      status: _i6.PostStatus.fromJson((jsonSerialization['status'] as String)),
      readingTime: jsonSerialization['readingTime'] as int,
      previous: jsonSerialization['previous'] == null
          ? null
          : _i7.Blog.fromJson(
              (jsonSerialization['previous'] as Map<String, dynamic>)),
      nextId: jsonSerialization['nextId'] as int?,
      next: jsonSerialization['next'] == null
          ? null
          : _i7.Blog.fromJson(
              (jsonSerialization['next'] as Map<String, dynamic>)),
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

  String title;

  String content;

  int authorId;

  _i2.AppUser? author;

  int categoryId;

  _i3.Category? category;

  List<_i4.BlogTag>? tags;

  List<_i5.Comment>? comments;

  _i6.PostStatus status;

  int readingTime;

  /// To hold the previous blog Id & next BlogId -> Useful for navigation between multiple blogs.
  /// the previous post is the corresponding object on the "other" side.
  _i7.Blog? previous;

  /// nextId is a nullable field that stores the id of the next post
  int? nextId;

  /// The next post represents the object on "this" side
  _i7.Blog? next;

  DateTime createdAt;

  DateTime updatedAt;

  Blog copyWith({
    int? id,
    String? title,
    String? content,
    int? authorId,
    _i2.AppUser? author,
    int? categoryId,
    _i3.Category? category,
    List<_i4.BlogTag>? tags,
    List<_i5.Comment>? comments,
    _i6.PostStatus? status,
    int? readingTime,
    _i7.Blog? previous,
    int? nextId,
    _i7.Blog? next,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'content': content,
      'authorId': authorId,
      if (author != null) 'author': author?.toJson(),
      'categoryId': categoryId,
      if (category != null) 'category': category?.toJson(),
      if (tags != null) 'tags': tags?.toJson(valueToJson: (v) => v.toJson()),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJson()),
      'status': status.toJson(),
      'readingTime': readingTime,
      if (previous != null) 'previous': previous?.toJson(),
      if (nextId != null) 'nextId': nextId,
      if (next != null) 'next': next?.toJson(),
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

class _BlogImpl extends Blog {
  _BlogImpl({
    int? id,
    required String title,
    required String content,
    required int authorId,
    _i2.AppUser? author,
    required int categoryId,
    _i3.Category? category,
    List<_i4.BlogTag>? tags,
    List<_i5.Comment>? comments,
    required _i6.PostStatus status,
    required int readingTime,
    _i7.Blog? previous,
    int? nextId,
    _i7.Blog? next,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          title: title,
          content: content,
          authorId: authorId,
          author: author,
          categoryId: categoryId,
          category: category,
          tags: tags,
          comments: comments,
          status: status,
          readingTime: readingTime,
          previous: previous,
          nextId: nextId,
          next: next,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  Blog copyWith({
    Object? id = _Undefined,
    String? title,
    String? content,
    int? authorId,
    Object? author = _Undefined,
    int? categoryId,
    Object? category = _Undefined,
    Object? tags = _Undefined,
    Object? comments = _Undefined,
    _i6.PostStatus? status,
    int? readingTime,
    Object? previous = _Undefined,
    Object? nextId = _Undefined,
    Object? next = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Blog(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      authorId: authorId ?? this.authorId,
      author: author is _i2.AppUser? ? author : this.author?.copyWith(),
      categoryId: categoryId ?? this.categoryId,
      category:
          category is _i3.Category? ? category : this.category?.copyWith(),
      tags: tags is List<_i4.BlogTag>?
          ? tags
          : this.tags?.map((e0) => e0.copyWith()).toList(),
      comments: comments is List<_i5.Comment>?
          ? comments
          : this.comments?.map((e0) => e0.copyWith()).toList(),
      status: status ?? this.status,
      readingTime: readingTime ?? this.readingTime,
      previous: previous is _i7.Blog? ? previous : this.previous?.copyWith(),
      nextId: nextId is int? ? nextId : this.nextId,
      next: next is _i7.Blog? ? next : this.next?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
