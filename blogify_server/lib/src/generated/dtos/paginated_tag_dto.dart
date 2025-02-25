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
import '../dtos/tag_dto.dart' as _i2;

abstract class PaginatedTagDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  PaginatedTagDto._({
    required this.tags,
    required this.totalCount,
    required this.totalPage,
    required this.currentPage,
    required this.limit,
    required this.hasMore,
  });

  factory PaginatedTagDto({
    required List<_i2.TagDto> tags,
    required int totalCount,
    required int totalPage,
    required int currentPage,
    required int limit,
    required bool hasMore,
  }) = _PaginatedTagDtoImpl;

  factory PaginatedTagDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return PaginatedTagDto(
      tags: (jsonSerialization['tags'] as List)
          .map((e) => _i2.TagDto.fromJson((e as Map<String, dynamic>)))
          .toList(),
      totalCount: jsonSerialization['totalCount'] as int,
      totalPage: jsonSerialization['totalPage'] as int,
      currentPage: jsonSerialization['currentPage'] as int,
      limit: jsonSerialization['limit'] as int,
      hasMore: jsonSerialization['hasMore'] as bool,
    );
  }

  List<_i2.TagDto> tags;

  int totalCount;

  int totalPage;

  int currentPage;

  int limit;

  bool hasMore;

  PaginatedTagDto copyWith({
    List<_i2.TagDto>? tags,
    int? totalCount,
    int? totalPage,
    int? currentPage,
    int? limit,
    bool? hasMore,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'tags': tags.toJson(valueToJson: (v) => v.toJson()),
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
      'tags': tags.toJson(valueToJson: (v) => v.toJsonForProtocol()),
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

class _PaginatedTagDtoImpl extends PaginatedTagDto {
  _PaginatedTagDtoImpl({
    required List<_i2.TagDto> tags,
    required int totalCount,
    required int totalPage,
    required int currentPage,
    required int limit,
    required bool hasMore,
  }) : super._(
          tags: tags,
          totalCount: totalCount,
          totalPage: totalPage,
          currentPage: currentPage,
          limit: limit,
          hasMore: hasMore,
        );

  @override
  PaginatedTagDto copyWith({
    List<_i2.TagDto>? tags,
    int? totalCount,
    int? totalPage,
    int? currentPage,
    int? limit,
    bool? hasMore,
  }) {
    return PaginatedTagDto(
      tags: tags ?? this.tags.map((e0) => e0.copyWith()).toList(),
      totalCount: totalCount ?? this.totalCount,
      totalPage: totalPage ?? this.totalPage,
      currentPage: currentPage ?? this.currentPage,
      limit: limit ?? this.limit,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
