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
import '../post_status.dart' as _i2;

abstract class BlogCountByStatusDto implements _i1.SerializableModel {
  BlogCountByStatusDto._({
    required this.count,
    required this.status,
  });

  factory BlogCountByStatusDto({
    required int count,
    required _i2.PostStatus status,
  }) = _BlogCountByStatusDtoImpl;

  factory BlogCountByStatusDto.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return BlogCountByStatusDto(
      count: jsonSerialization['count'] as int,
      status: _i2.PostStatus.fromJson((jsonSerialization['status'] as String)),
    );
  }

  int count;

  _i2.PostStatus status;

  BlogCountByStatusDto copyWith({
    int? count,
    _i2.PostStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'status': status.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _BlogCountByStatusDtoImpl extends BlogCountByStatusDto {
  _BlogCountByStatusDtoImpl({
    required int count,
    required _i2.PostStatus status,
  }) : super._(
          count: count,
          status: status,
        );

  @override
  BlogCountByStatusDto copyWith({
    int? count,
    _i2.PostStatus? status,
  }) {
    return BlogCountByStatusDto(
      count: count ?? this.count,
      status: status ?? this.status,
    );
  }
}
