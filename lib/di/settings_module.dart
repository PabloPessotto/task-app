import 'package:get/get.dart';
import 'package:taskforme/domain/repository/user_repository.dart';
import 'package:taskforme/domain/usecase/user/logout_usecase.dart';
import 'package:taskforme/presenter/view_model/settings/settings_view_model.dart';

class SettingsModule implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogoutUseCase>(() => LogoutUseCase(Get.find<UserRepository>()));

    Get.lazyPut<SettingsViewModel>(
      () => SettingsViewModel(
        Get.find<LogoutUseCase>(),
      ),
    );
  }
}
