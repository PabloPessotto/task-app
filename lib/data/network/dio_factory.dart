import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:taskforme/data/network/dio_interceptor.dart';
import 'package:taskforme/shared/utils/config_reader.dart';

const String applicationJson = 'application/json';
const String contentType = 'Content-Type';
const String accept = 'accept';
const String authorization = 'Authorization';
const String defaultLanguage = 'language';

class DioFactory {
  DioFactory();

  Future<Dio> getDio() async {
    Dio dio = Dio();
    int timeout = 1; // 1 min
    String language = "pt";
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      defaultLanguage: language,
    };
    dio.options = BaseOptions(
      baseUrl: ConfigReader.getBaseUrl(),
      connectTimeout: Duration(minutes: timeout),
      receiveTimeout: Duration(minutes: timeout),
    );

    dio.interceptors.add(DioInterceptor());

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    return dio;
  }
}
