import 'package:flutter/material.dart';
import 'package:taskforme/presenter/view/my_app.dart';
import 'package:taskforme/shared/constants/environment.dart';
import 'package:taskforme/shared/utils/config_reader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize(Environment.dev);
  runApp(const MyApp());
}
