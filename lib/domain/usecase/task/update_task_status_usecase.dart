import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/task.dart';
import 'package:taskforme/domain/repository/task_repository.dart';

class UpdateTaskStatusUseCase {
  final TaskRepository _taskRepository;

  UpdateTaskStatusUseCase(this._taskRepository);

  Future<Result<Task, String>> execute(String status, int id) =>
      _taskRepository.updateTaskStatus(status, id);
}
