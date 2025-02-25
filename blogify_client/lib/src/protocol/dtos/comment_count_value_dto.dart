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

abstract class CommentCountStream implements _i1.SerializableModel {
  CommentCountStream._({required this.count});

  factory CommentCountStream({required int count}) = _CommentCountStreamImpl;

  factory CommentCountStream.fromJson(Map<String, dynamic> jsonSerialization) {
    return CommentCountStream(count: jsonSerialization['count'] as int);
  }

  int count;

  CommentCountStream copyWith({int? count});
  @override
  Map<String, dynamic> toJson() {
    return {'count': count};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CommentCountStreamImpl extends CommentCountStream {
  _CommentCountStreamImpl({required int count}) : super._(count: count);

  @override
  CommentCountStream copyWith({int? count}) {
    return CommentCountStream(count: count ?? this.count);
  }
}
