import 'dart:developer';

import 'package:blogify_client/blogify_client.dart';


class ApiExcepion {
  ApiExcepion._();

  static String onError(dynamic exception) {
    String message;
    if (exception is ServerException) {
      log(
        exception.message,
        error: exception.error,
        stackTrace: StackTrace.fromString(exception.stackTrace ?? ''),
      );
      return exception.message;
    } else if (exception is ServerpodClientException) {
      log(
        '${exception.message} with status code ${exception.statusCode}',
      );
      return exception.message;
    }
    log('Something went wrong....');
    message = 'Somnething went wrong, please try again later!';
    return message;
  }
}
