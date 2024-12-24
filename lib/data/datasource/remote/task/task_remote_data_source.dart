import 'package:taskforme/data/model/request/task/task_request.dart';
import 'package:taskforme/data/model/task/content/content_task_dto.dart';
import 'package:taskforme/data/network/service_client/task/task_service_client.dart';

abstract interface class TaskRemoteDataSource {
  Future<ContentListTaskDto> getAllTasks();

  Future<ContentTaskDto> registerTask(TaskRequest task);

  Future<ContentTaskDto> updateTask(TaskRequest task, int id);

  Future<ContentTaskDto> deleteTask(int id);

  Future<ContentTaskDto> getTaskById(int id);

  Future<ContentTaskDto> updateTaskStatus(String status, int id);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final TaskServiceClient _taskServiceClient;

  TaskRemoteDataSourceImpl(this._taskServiceClient);

  @override
  Future<ContentTaskDto> deleteTask(int id) async {
    return await _taskServiceClient.deleteTask(id);
  }

  @override
  Future<ContentListTaskDto> getAllTasks() async {
    return await _taskServiceClient.getAllTasks();
  }

  @override
  Future<ContentTaskDto> getTaskById(int id) async {
    return await _taskServiceClient.getTaskById(id);
  }

  @override
  Future<ContentTaskDto> registerTask(TaskRequest task) async {
    return await _taskServiceClient.registerTask(task);
  }

  @override
  Future<ContentTaskDto> updateTask(TaskRequest task, int id) async {
    return await _taskServiceClient.updateTask(task, id);
  }

  @override
  Future<ContentTaskDto> updateTaskStatus(String status, int id) async {
    return await _taskServiceClient.updateTaskStatus(status, id);
  }
}
