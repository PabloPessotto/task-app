import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:taskforme/data/network/dio_factory.dart';

class MainModule implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut<DioFactory>(() => DioFactory(), fenix: true);

    final dio = await Get.find<DioFactory>().getDio();

    Get.lazyPut<Dio>(() => dio, fenix: true);
  }
}
