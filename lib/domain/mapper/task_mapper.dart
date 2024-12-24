import 'package:taskforme/data/model/request/task/task_request.dart';
import 'package:taskforme/data/model/task/task_dto.dart';
import 'package:taskforme/domain/entities/task.dart';
import 'package:taskforme/domain/mapper/label_mapper.dart';

extension TaskMapper on Task? {
  TaskDto toDto() {
    return TaskDto(
      id: this?.id,
      userId: this?.userId,
      title: this?.title,
      description: this?.description,
      status: this?.status,
      date: this?.date,
      labels: this?.labels?.map((e) => e.toDto()).toList(),
    );
  }

  TaskRequest toRequest() {
    return TaskRequest(
      title: this?.title,
      description: this?.description,
      status: this?.status,
      date: this?.date,
      labels: this?.labels != null ? this?.labels?.map((e) => e.id!).toList() : [],
    );
  }
}
