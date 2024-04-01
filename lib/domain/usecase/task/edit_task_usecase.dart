import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/task.dart';
import 'package:taskforme/domain/repository/task_repository.dart';

class EditTaskUseCase {
  final TaskRepository _taskRepository;

  EditTaskUseCase(this._taskRepository);

  Future<Result<Task, String>> execute(Task task) =>
      _taskRepository.updateTask(task);
}
