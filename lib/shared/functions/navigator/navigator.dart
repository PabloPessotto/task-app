import 'package:flutter/material.dart';
import 'package:get/get.dart';

final navigatorKey = GlobalKey<NavigatorState>();

NavigatorState get router => navigatorKey.currentState!;

Future<T?>? pushView<T>(String route,
    {dynamic arguments, Map<String, String>? parameters}) {
  return Get.toNamed(route, arguments: arguments, parameters: parameters);
}

Future<T?>? pushUntilView<T>(String name,
    {dynamic arguments, bool Function(Route<dynamic>)? route}) {
  return Get.offNamedUntil(
    name,
    route ?? (routes) => false,
    arguments: arguments,
  );
}

void closeView<T>({T? result}) {
  return Get.back(result: result);
}

Future<T?>? closePushView<T>(String route,
    {dynamic result, dynamic arguments}) {
  return Get.offAndToNamed<T>(route, result: result, arguments: arguments);
}
