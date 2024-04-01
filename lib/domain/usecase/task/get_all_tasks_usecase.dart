import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/task.dart';
import 'package:taskforme/domain/repository/task_repository.dart';

class GetAllTasksUseCase {
  final TaskRepository _taskRepository;

  GetAllTasksUseCase(this._taskRepository);

  Future<Result<List<Task>, String>> execute() async =>
      await _taskRepository.getAllTasks();
}
