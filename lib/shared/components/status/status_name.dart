import 'package:taskforme/shared/constants/task_status.dart';

String statusName(String status) => switch (status) {
      TaskStatus.opened => 'aberta',
      TaskStatus.pending => 'pendente',
      TaskStatus.doing => 'fazendo',
      TaskStatus.inProgress => 'em andamento',
      TaskStatus.completed => 'concluída',
      TaskStatus.canceled => 'cancelada',
      'todas' => 'todas',
      _ => ''
    };

String status(String name) => switch (name) {
      'aberta' => TaskStatus.opened,
      'pendente' => TaskStatus.pending,
      'em andamento' => TaskStatus.inProgress,
      'fazendo' => TaskStatus.doing,
      'concluída' => TaskStatus.completed,
      'cancelada' => TaskStatus.canceled,
      'todas' => 'todas',
      _ => ''
    };
