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

abstract class ServerException
    implements _i1.SerializableException, _i1.SerializableModel {
  ServerException._({
    required this.message,
    this.error,
    this.stackTrace,
  });

  factory ServerException({
    required String message,
    String? error,
    String? stackTrace,
  }) = _ServerExceptionImpl;

  factory ServerException.fromJson(Map<String, dynamic> jsonSerialization) {
    return ServerException(
      message: jsonSerialization['message'] as String,
      error: jsonSerialization['error'] as String?,
      stackTrace: jsonSerialization['stackTrace'] as String?,
    );
  }

  String message;

  String? error;

  String? stackTrace;

  ServerException copyWith({
    String? message,
    String? error,
    String? stackTrace,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      if (error != null) 'error': error,
      if (stackTrace != null) 'stackTrace': stackTrace,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ServerExceptionImpl extends ServerException {
  _ServerExceptionImpl({
    required String message,
    String? error,
    String? stackTrace,
  }) : super._(
          message: message,
          error: error,
          stackTrace: stackTrace,
        );

  @override
  ServerException copyWith({
    String? message,
    Object? error = _Undefined,
    Object? stackTrace = _Undefined,
  }) {
    return ServerException(
      message: message ?? this.message,
      error: error is String? ? error : this.error,
      stackTrace: stackTrace is String? ? stackTrace : this.stackTrace,
    );
  }
}
