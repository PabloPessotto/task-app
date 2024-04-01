import 'package:flutter/material.dart';
import 'package:taskforme/shared/constants/task_status.dart';

Color statusColor(String status) => switch (status) {
      TaskStatus.opened => Colors.blue[700]!,
      TaskStatus.doing => Colors.yellow[700]!,
      TaskStatus.completed => Colors.green[700]!,
      TaskStatus.canceled => Colors.red[700]!,
      'todas' => Colors.orangeAccent,
      _ => Colors.transparent
    };
