import 'package:taskforme/shared/constants/task_status.dart';

String statusName(String status) => switch (status) {
      TaskStatus.opened => 'aberta',
      TaskStatus.doing => 'fazendo',
      TaskStatus.completed => 'completa',
      TaskStatus.canceled => 'cancelada',
      'todas' => 'todas',
      _ => ''
    };

String status(String name) => switch (name) {
      'aberta' => TaskStatus.opened,
      'fazendo' => TaskStatus.doing,
      'completa' => TaskStatus.completed,
      'cancelada' => TaskStatus.canceled,
      'todas' => 'todas',
      _ => ''
    };
