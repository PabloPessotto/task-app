import 'package:taskforme/data/model/task/content/content_task_dto.dart';
import 'package:taskforme/data/model/task/task_dto.dart';
import 'package:taskforme/data/network/service_client/task/task_service_client.dart';

abstract interface class TaskRemoteDataSource {
  Future<ContentListTaskDto> getAllTasks(String token);

  Future<ContentTaskDto> registerTask(String token, TaskDto task);

  Future<ContentTaskDto> updateTask(String token, TaskDto task);

  Future<ContentTaskDto> deleteTask(String token, int id);

  Future<ContentTaskDto> getTaskById(String token, int id);

  Future<ContentTaskDto> updateTaskStatus(String token, String status, int id);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final TaskServiceClient _taskServiceClient;

  TaskRemoteDataSourceImpl(this._taskServiceClient);

  @override
  Future<ContentTaskDto> deleteTask(String token, int id) async {
    return await _taskServiceClient.deleteTask('Bearer $token', id);
  }

  @override
  Future<ContentListTaskDto> getAllTasks(String token) async {
    return await _taskServiceClient.getAllTasks('Bearer $token');
  }

  @override
  Future<ContentTaskDto> getTaskById(String token, int id) async {
    return await _taskServiceClient.getTaskById('Bearer $token', id);
  }

  @override
  Future<ContentTaskDto> registerTask(String token, TaskDto task) async {
    return await _taskServiceClient.registerTask('Bearer $token', task);
  }

  @override
  Future<ContentTaskDto> updateTask(String token, TaskDto task) async {
    return await _taskServiceClient.updateTask('Bearer $token', task, task.id!);
  }

  @override
  Future<ContentTaskDto> updateTaskStatus(
      String token, String status, int id) async {
    return await _taskServiceClient.updateTaskStatus('Bearer $token', status, id);
  }
}
