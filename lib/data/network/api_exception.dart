import 'package:dio/dio.dart';

class APIException extends DioException {
  APIException(
    String message, {
    DioExceptionType? type,
    RequestOptions? requestOptions,
    super.response,
    super.stackTrace,
    super.error,
  }) : super(
          message: message,
          requestOptions: requestOptions ?? RequestOptions(),
        );
}
