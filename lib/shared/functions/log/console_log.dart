import 'dart:developer' as dev;

void log(String message, {int level = LogLevel.all}) => dev.log(
      message,
      name: 'tarefas - ${DateTime.now()}',
      level: level,
    );

class LogLevel {
  static const int all = 0;
  static const int off = 2000;
  static const int finest = 300;
  static const int finer = 400;
  static const int fine = 500;
  static const int config = 700;
  static const int info = 800;
  static const int warning = 900;
  static const int severe = 1000;
  static const int shout = 1200;
}
