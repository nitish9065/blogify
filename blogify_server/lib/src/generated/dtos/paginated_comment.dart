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
import '../dtos/comment_dto.dart' as _i2;

abstract class PaginatedComments
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  PaginatedComments._({
    required this.comments,
    required this.totalCount,
    required this.limit,
    required this.totalPage,
    required this.currentPage,
    required this.hasMore,
  });

  factory PaginatedComments({
    required List<_i2.CommentDto> comments,
    required int totalCount,
    required int limit,
    required int totalPage,
    required int currentPage,
    required bool hasMore,
  }) = _PaginatedCommentsImpl;

  factory PaginatedComments.fromJson(Map<String, dynamic> jsonSerialization) {
    return PaginatedComments(
      comments: (jsonSerialization['comments'] as List)
          .map((e) => _i2.CommentDto.fromJson((e as Map<String, dynamic>)))
          .toList(),
      totalCount: jsonSerialization['totalCount'] as int,
      limit: jsonSerialization['limit'] as int,
      totalPage: jsonSerialization['totalPage'] as int,
      currentPage: jsonSerialization['currentPage'] as int,
      hasMore: jsonSerialization['hasMore'] as bool,
    );
  }

  List<_i2.CommentDto> comments;

  int totalCount;

  int limit;

  int totalPage;

  int currentPage;

  bool hasMore;

  PaginatedComments copyWith({
    List<_i2.CommentDto>? comments,
    int? totalCount,
    int? limit,
    int? totalPage,
    int? currentPage,
    bool? hasMore,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'comments': comments.toJson(valueToJson: (v) => v.toJson()),
      'totalCount': totalCount,
      'limit': limit,
      'totalPage': totalPage,
      'currentPage': currentPage,
      'hasMore': hasMore,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'comments': comments.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'totalCount': totalCount,
      'limit': limit,
      'totalPage': totalPage,
      'currentPage': currentPage,
      'hasMore': hasMore,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PaginatedCommentsImpl extends PaginatedComments {
  _PaginatedCommentsImpl({
    required List<_i2.CommentDto> comments,
    required int totalCount,
    required int limit,
    required int totalPage,
    required int currentPage,
    required bool hasMore,
  }) : super._(
          comments: comments,
          totalCount: totalCount,
          limit: limit,
          totalPage: totalPage,
          currentPage: currentPage,
          hasMore: hasMore,
        );

  @override
  PaginatedComments copyWith({
    List<_i2.CommentDto>? comments,
    int? totalCount,
    int? limit,
    int? totalPage,
    int? currentPage,
    bool? hasMore,
  }) {
    return PaginatedComments(
      comments: comments ?? this.comments.map((e0) => e0.copyWith()).toList(),
      totalCount: totalCount ?? this.totalCount,
      limit: limit ?? this.limit,
      totalPage: totalPage ?? this.totalPage,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
