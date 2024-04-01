import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:taskforme/data/model/task/content/content_task_dto.dart';
import 'package:taskforme/data/model/task/task_dto.dart';

part 'task_service_client.g.dart';

@RestApi()
abstract interface class TaskServiceClient {
  factory TaskServiceClient(Dio dio, {String? baseUrl}) = _TaskServiceClient;

  @GET('/tasks')
  Future<ContentListTaskDto> getAllTasks(@Header('Authorization') String token);

  @POST('/tasks')
  Future<ContentTaskDto> registerTask(
      @Header('Authorization') String token, @Body() TaskDto task);

  @PUT('/tasks/{id}')
  Future<ContentTaskDto> updateTask(@Header('Authorization') String token,
      @Body() TaskDto task, @Path('id') int id);

  @PUT('/tasks/{id}/status')
  Future<ContentTaskDto> updateTaskStatus(@Header('Authorization') String token,
      @Field('status') String status, @Path('id') int id);

  @DELETE('/tasks/{id}')
  Future<ContentTaskDto> deleteTask(
      @Header('Authorization') String token, @Path('id') int id);

  @GET('/tasks/{id}')
  Future<ContentTaskDto> getTaskById(
      @Header('Authorization') String token, @Path('id') int id);
}
