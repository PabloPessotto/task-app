import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskforme/data/network/api_exception.dart';
import 'package:taskforme/shared/components/base/alert/base_alert.dart';
import 'package:taskforme/shared/components/button/alert_buttons/high_alert_button.dart';
import 'package:taskforme/shared/functions/dialog/dialog_functions.dart';
import 'package:taskforme/shared/functions/log/console_log.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/resources/routes/routes.dart';

class DioInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('ERRRRIIR - ${err.response}');

    throw APIException(
      jsonEncode(err.response?.data["message"]),
      type: err.type,
      requestOptions: err.requestOptions,
      response: err.response,
      error: err.error,
      stackTrace: err.stackTrace,
    );
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    final excludedPaths = ["/api/login", "/api/register"];
    log('Path - ${options.uri.path}');

    if (!excludedPaths.contains(options.uri.path)) {
      if (token.isEmpty || JwtDecoder.isExpired(token)) {
        if (!g.Get.isDialogOpen!) _tokenExpired();
      } else {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    super.onRequest(options, handler);
  }

  void _tokenExpired() {
    openAlert(
      BaseAlert(
        color: Colors.yellow,
        title: "Sessão expirada!",
        message: "Sua sessão expirou. Faça login novamente para continuar.",
        functions: [
          HighAlertButton(
            label: "Fazer login",
            onTap: () {
              pushUntilView(Routes.login);
            },
          ),
        ],
      ),
    );
  }
}
