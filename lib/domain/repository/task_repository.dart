import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/entities/task.dart';

abstract interface class TaskRepository {
  Future<Result<List<Task>, String>> getAllTasks();

  Future<Result<Task, String>> registerTask(Task task);

  Future<Result<Task, String>> updateTask(Task task);

  Future<Result<Task, String>> updateTaskStatus(String status, int id);

  Future<Result<String, String>> deleteTask(int id);

  Future<Result<Task, String>> getTaskById(int id);
}
