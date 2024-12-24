import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:taskforme/data/datasource/remote/label/label_remote_data_source.dart';
import 'package:taskforme/data/network/service_client/label/label_service_client.dart';
import 'package:taskforme/data/repository/label_repository_impl.dart';
import 'package:taskforme/domain/repository/label_repository.dart';

class LabelModule implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LabelServiceClient>(
      () => LabelServiceClient(
        Get.find<Dio>(),
      ),
    );

    Get.lazyPut<LabelRemoteDataSource>(
      () => LabelRemoteDataSourceImpl(
        Get.find<LabelServiceClient>(),
      ),
    );

    Get.lazyPut<LabelRepository>(
      () => LabelRepositoryImpl(
        Get.find<LabelRemoteDataSource>(),
      ),
    );
  }
}
