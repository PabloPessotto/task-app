import 'package:taskforme/data/model/task/task_dto.dart';
import 'package:taskforme/domain/entities/task.dart';

extension TaskMapper on Task? {
  TaskDto toDto() {
    return TaskDto(
      id: this?.id,
      userId: this?.userId,
      title: this?.title,
      description: this?.description,
      status: this?.status,
      date: this?.date,
      label: this?.label,
    );
  }
}
