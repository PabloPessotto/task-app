import 'package:dio/dio.dart';

class APIException extends DioException {
  APIException(
    DioExceptionType type,
    String message, {
    required super.requestOptions,
    super.response,
  }) : super(message: message);
}
