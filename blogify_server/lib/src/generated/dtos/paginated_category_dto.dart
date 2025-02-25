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
import '../dtos/category_dto.dart' as _i2;

abstract class PaginatedCategoryDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  PaginatedCategoryDto._({
    required this.categories,
    required this.totalCount,
    required this.totalPage,
    required this.currentPage,
    required this.limit,
    required this.hasMore,
  });

  factory PaginatedCategoryDto({
    required List<_i2.CategoryDto> categories,
    required int totalCount,
    required int totalPage,
    required int currentPage,
    required int limit,
    required bool hasMore,
  }) = _PaginatedCategoryDtoImpl;

  factory PaginatedCategoryDto.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return PaginatedCategoryDto(
      categories: (jsonSerialization['categories'] as List)
          .map((e) => _i2.CategoryDto.fromJson((e as Map<String, dynamic>)))
          .toList(),
      totalCount: jsonSerialization['totalCount'] as int,
      totalPage: jsonSerialization['totalPage'] as int,
      currentPage: jsonSerialization['currentPage'] as int,
      limit: jsonSerialization['limit'] as int,
      hasMore: jsonSerialization['hasMore'] as bool,
    );
  }

  List<_i2.CategoryDto> categories;

  int totalCount;

  int totalPage;

  int currentPage;

  int limit;

  bool hasMore;

  PaginatedCategoryDto copyWith({
    List<_i2.CategoryDto>? categories,
    int? totalCount,
    int? totalPage,
    int? currentPage,
    int? limit,
    bool? hasMore,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'categories': categories.toJson(valueToJson: (v) => v.toJson()),
      'totalCount': totalCount,
      'totalPage': totalPage,
      'currentPage': currentPage,
      'limit': limit,
      'hasMore': hasMore,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'categories':
          categories.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'totalCount': totalCount,
      'totalPage': totalPage,
      'currentPage': currentPage,
      'limit': limit,
      'hasMore': hasMore,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PaginatedCategoryDtoImpl extends PaginatedCategoryDto {
  _PaginatedCategoryDtoImpl({
    required List<_i2.CategoryDto> categories,
    required int totalCount,
    required int totalPage,
    required int currentPage,
    required int limit,
    required bool hasMore,
  }) : super._(
          categories: categories,
          totalCount: totalCount,
          totalPage: totalPage,
          currentPage: currentPage,
          limit: limit,
          hasMore: hasMore,
        );

  @override
  PaginatedCategoryDto copyWith({
    List<_i2.CategoryDto>? categories,
    int? totalCount,
    int? totalPage,
    int? currentPage,
    int? limit,
    bool? hasMore,
  }) {
    return PaginatedCategoryDto(
      categories:
          categories ?? this.categories.map((e0) => e0.copyWith()).toList(),
      totalCount: totalCount ?? this.totalCount,
      totalPage: totalPage ?? this.totalPage,
      currentPage: currentPage ?? this.currentPage,
      limit: limit ?? this.limit,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
