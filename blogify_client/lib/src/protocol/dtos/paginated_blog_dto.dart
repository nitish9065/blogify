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
import '../dtos/blog_sto.dart' as _i2;

abstract class PaginatedBlogDto implements _i1.SerializableModel {
  PaginatedBlogDto._({
    required this.blogs,
    required this.totalCount,
    required this.limit,
    required this.totalPage,
    required this.currentPage,
    required this.hasMore,
  });

  factory PaginatedBlogDto({
    required List<_i2.BlogDto> blogs,
    required int totalCount,
    required int limit,
    required int totalPage,
    required int currentPage,
    required bool hasMore,
  }) = _PaginatedBlogDtoImpl;

  factory PaginatedBlogDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return PaginatedBlogDto(
      blogs: (jsonSerialization['blogs'] as List)
          .map((e) => _i2.BlogDto.fromJson((e as Map<String, dynamic>)))
          .toList(),
      totalCount: jsonSerialization['totalCount'] as int,
      limit: jsonSerialization['limit'] as int,
      totalPage: jsonSerialization['totalPage'] as int,
      currentPage: jsonSerialization['currentPage'] as int,
      hasMore: jsonSerialization['hasMore'] as bool,
    );
  }

  List<_i2.BlogDto> blogs;

  int totalCount;

  int limit;

  int totalPage;

  int currentPage;

  bool hasMore;

  PaginatedBlogDto copyWith({
    List<_i2.BlogDto>? blogs,
    int? totalCount,
    int? limit,
    int? totalPage,
    int? currentPage,
    bool? hasMore,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'blogs': blogs.toJson(valueToJson: (v) => v.toJson()),
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

class _PaginatedBlogDtoImpl extends PaginatedBlogDto {
  _PaginatedBlogDtoImpl({
    required List<_i2.BlogDto> blogs,
    required int totalCount,
    required int limit,
    required int totalPage,
    required int currentPage,
    required bool hasMore,
  }) : super._(
          blogs: blogs,
          totalCount: totalCount,
          limit: limit,
          totalPage: totalPage,
          currentPage: currentPage,
          hasMore: hasMore,
        );

  @override
  PaginatedBlogDto copyWith({
    List<_i2.BlogDto>? blogs,
    int? totalCount,
    int? limit,
    int? totalPage,
    int? currentPage,
    bool? hasMore,
  }) {
    return PaginatedBlogDto(
      blogs: blogs ?? this.blogs.map((e0) => e0.copyWith()).toList(),
      totalCount: totalCount ?? this.totalCount,
      limit: limit ?? this.limit,
      totalPage: totalPage ?? this.totalPage,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
