import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskforme/data/network/dio_factory.dart';
import 'package:taskforme/data/network/service_client/task/task_service_client.dart';
import 'package:taskforme/data/network/service_client/user/user_service_client.dart';

class MainModule implements Bindings {
  @override
  Future<void> dependencies() async {
    final sharedPrefs = await SharedPreferences.getInstance();

    Get.lazyPut<SharedPreferences>(() => sharedPrefs, fenix: true);

    Get.lazyPut<DioFactory>(() => DioFactory(), fenix: true);

    final dio = await Get.find<DioFactory>().getDio();

    Get.lazyPut<UserServiceClient>(() => UserServiceClient(dio), fenix: true);

    Get.lazyPut<TaskServiceClient>(() => TaskServiceClient(dio), fenix: true);
  }
}
