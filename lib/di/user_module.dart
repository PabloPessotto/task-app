import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskforme/data/datasource/local/user/user_local_data_source.dart';
import 'package:taskforme/data/datasource/remote/user/user_remote_data_source.dart';
import 'package:taskforme/data/network/service_client/user/user_service_client.dart';
import 'package:taskforme/data/repository/user_repository_impl.dart';
import 'package:taskforme/domain/repository/user_repository.dart';

class UserModule implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserServiceClient>(() => UserServiceClient(Get.find<Dio>()));

    Get.lazyPut<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(
        Get.find<SharedPreferences>(),
      ),
    );

    Get.lazyPut<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(
        Get.find<UserServiceClient>(),
      ),
    );

    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(
        Get.find<UserRemoteDataSource>(),
        Get.find<UserLocalDataSource>(),
      ),
    );
  }
}
