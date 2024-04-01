import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/task.dart';
import 'package:taskforme/domain/repository/task_repository.dart';

class CreateTaskUseCase {
  final TaskRepository _taskRepository;

  CreateTaskUseCase(this._taskRepository);

  Future<Result<Task, String>> execute(Task task) =>
      _taskRepository.registerTask(task);
}
