import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:taskforme/data/network/api_exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('ERRRRIIR - ${err.response}');
    print('tyoe - ${err.type}');

    throw APIException(
      DioExceptionType.unknown,
      jsonEncode(err.response?.data["message"]),
      requestOptions: err.requestOptions,
      response: err.response,
    );
  }
}
