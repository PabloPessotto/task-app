import 'package:taskforme/data/mapper/label_dto_mapper.dart';
import 'package:taskforme/data/model/task/task_dto.dart';
import 'package:taskforme/domain/entities/task.dart';

extension TaskDtoMapper on TaskDto? {
  Task toDomain() {
    return Task(
      id: this?.id,
      userId: this?.userId,
      title: this?.title,
      description: this?.description,
      status: this?.status,
      date: this?.date,
      labels: this?.labels?.map((e) => e.toDomain()).toList(),
    );
  }
}
