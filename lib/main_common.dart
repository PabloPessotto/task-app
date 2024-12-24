import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskforme/presenter/view/my_app.dart';
import 'package:taskforme/shared/utils/config_reader.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize(env);

  Intl.defaultLocale = 'pt_BR';

  final sharedPrefs = await SharedPreferences.getInstance();

  Get.lazyPut<SharedPreferences>(() => sharedPrefs, fenix: true);
  runApp(const MyApp());
}
