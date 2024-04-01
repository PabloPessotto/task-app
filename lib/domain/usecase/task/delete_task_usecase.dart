import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/repository/task_repository.dart';

class DeleteTaskUseCase {
  final TaskRepository _taskRepository;

  DeleteTaskUseCase(this._taskRepository);

  Future<Result<String, String>> execute(int id) => _taskRepository.deleteTask(id);
}
