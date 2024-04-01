import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/shared/components/base/alert/base_alert.dart';

Future<T?> openAlert<T>(BaseAlert alert) {
  return showDialog<T>(
    context: Get.context!,
    useSafeArea: true,
    builder: (context) => alert,
  );
}

void openSnackBar({BuildContext? context, required String message, Color? color}) {
  ScaffoldMessenger.of(context ?? Get.context!).showSnackBar(
    SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: color ?? Colors.black.withOpacity(0.55),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 16.5),
      ),
    ),
  );
}
