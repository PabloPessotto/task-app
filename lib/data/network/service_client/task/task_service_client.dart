import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:taskforme/data/model/request/task/task_request.dart';
import 'package:taskforme/data/model/task/content/content_task_dto.dart';

part 'task_service_client.g.dart';

@RestApi()
abstract interface class TaskServiceClient {
  factory TaskServiceClient(Dio dio, {String? baseUrl}) = _TaskServiceClient;

  @GET('/tasks')
  Future<ContentListTaskDto> getAllTasks();

  @POST('/tasks')
  Future<ContentTaskDto> registerTask(@Body() TaskRequest task);

  @PUT('/tasks/{id}')
  Future<ContentTaskDto> updateTask(@Body() TaskRequest task, @Path('id') int id);

  @PUT('/tasks/{id}/status')
  Future<ContentTaskDto> updateTaskStatus(
      @Field('status') String status, @Path('id') int id);

  @DELETE('/tasks/{id}')
  Future<ContentTaskDto> deleteTask(@Path('id') int id);

  @GET('/tasks/{id}')
  Future<ContentTaskDto> getTaskById(@Path('id') int id);
}
