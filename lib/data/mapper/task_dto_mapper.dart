import 'dart:convert';

import 'package:taskforme/data/model/task/task_dto.dart';
import 'package:taskforme/domain/entities/task.dart';

extension TaskDtoMapper on TaskDto? {
  Task toDomain() {
    print('dgkafjkgasjkdgajksf ${this?.label.runtimeType}');
    return Task(
      id: this?.id,
      userId: this?.userId,
      title: this?.title,
      description: this?.description,
      status: this?.status,
      date: this?.date,
      label: this?.label == null
          ? <String>[]
          : List<String>.from(jsonDecode(this?.label)),
    );
  }
}
