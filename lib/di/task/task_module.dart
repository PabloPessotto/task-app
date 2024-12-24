import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:taskforme/data/datasource/local/user/user_local_data_source.dart';
import 'package:taskforme/data/datasource/remote/task/task_remote_data_source.dart';
import 'package:taskforme/data/network/service_client/task/task_service_client.dart';
import 'package:taskforme/data/repository/task_repository_impl.dart';
import 'package:taskforme/domain/repository/task_repository.dart';

class TaskModule implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskServiceClient>(() => TaskServiceClient(Get.find<Dio>()));

    Get.lazyPut<TaskRemoteDataSource>(
      () => TaskRemoteDataSourceImpl(
        Get.find<TaskServiceClient>(),
      ),
    );

    Get.lazyPut<TaskRepository>(
      () => TaskRepositoryImpl(
        Get.find<TaskRemoteDataSource>(),
        Get.find<UserLocalDataSource>(),
      ),
    );
  }
}
