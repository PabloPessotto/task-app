import 'dart:convert';

import 'package:taskforme/core/result.dart';
import 'package:taskforme/data/datasource/local/user/user_local_data_source.dart';
import 'package:taskforme/data/datasource/remote/task/task_remote_data_source.dart';
import 'package:taskforme/data/mapper/task_dto_mapper.dart';
import 'package:taskforme/data/network/api_exception.dart';
import 'package:taskforme/domain/entities/task.dart';
import 'package:taskforme/domain/mapper/task_mapper.dart';
import 'package:taskforme/domain/repository/task_repository.dart';
import 'package:taskforme/shared/constants/task_status.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource _taskRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;

  TaskRepositoryImpl(this._taskRemoteDataSource, this._userLocalDataSource);

  @override
  Future<Result<String, String>> deleteTask(int id) async {
    final token = _userLocalDataSource.getToken();
    try {
      final response = await _taskRemoteDataSource.deleteTask(token, id);
      return Success("${response.message}");
    } on APIException catch (e) {
      final text = jsonDecode(e.message!);
      return Failure(text['text']);
    }
  }

  @override
  Future<Result<List<Task>, String>> getAllTasks() async {
    final userId = _userLocalDataSource.getUserId();
    final token = _userLocalDataSource.getToken();
    try {
      final response = await _taskRemoteDataSource.getAllTasks(token);
      final tasks =
          response.content?.where((task) => task.userId == userId).toList();

      return Success(tasks?.map((e) => e.toDomain()).toList() ?? <Task>[]);
    } on APIException catch (e) {
      final text = jsonDecode(e.message!);
      return Failure(text['text']);
    }
  }

  @override
  Future<Result<Task, String>> getTaskById(int id) async {
    try {
      final token = _userLocalDataSource.getToken();
      final response = await _taskRemoteDataSource.getTaskById(token, id);
      return Success(response.content.toDomain());
    } on APIException catch (e) {
      final text = jsonDecode(e.message!);
      return Failure(text['text']);
    }
  }

  @override
  Future<Result<Task, String>> registerTask(Task task) async {
    final userId = _userLocalDataSource.getUserId();
    final token = _userLocalDataSource.getToken();
    try {
      task.userId = userId;
      task.status = TaskStatus.opened;
      final response = await _taskRemoteDataSource.registerTask(token, task.toDto());

      return Success(response.content.toDomain());
    } on APIException catch (e) {
      final text = jsonDecode(e.message!);
      return Failure(text['text']);
    }
  }

  @override
  Future<Result<Task, String>> updateTask(Task task) async {
    final userId = _userLocalDataSource.getUserId();
    final token = _userLocalDataSource.getToken();
    try {
      task.userId = userId;
      final response = await _taskRemoteDataSource.updateTask(token, task.toDto());
      return Success(response.content.toDomain());
    } on APIException catch (e) {
      final text = jsonDecode(e.message!);
      return Failure(text['text']);
    }
  }

  @override
  Future<Result<Task, String>> updateTaskStatus(String status, int id) async {
    final token = _userLocalDataSource.getToken();
    try {
      final response =
          await _taskRemoteDataSource.updateTaskStatus(token, status, id);
      return Success(response.content.toDomain());
    } on APIException catch (e) {
      final text = jsonDecode(e.message!);
      return Failure(text['text']);
    }
  }
}
