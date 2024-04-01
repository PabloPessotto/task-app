import 'package:get/get.dart';
import 'package:taskforme/domain/repository/user_repository.dart';
import 'package:taskforme/domain/usecase/user/get_username_usecase.dart';
import 'package:taskforme/domain/usecase/user/login_usecase.dart';
import 'package:taskforme/presenter/view_model/login/login_view_model.dart';

class LoginModule implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginUseCase>(
      () => LoginUseCase(
        Get.find<UserRepository>(),
      ),
    );

    Get.lazyPut<GetUsernameUseCase>(
      () => GetUsernameUseCase(
        Get.find<UserRepository>(),
      ),
    );

    Get.lazyPut<LoginViewModel>(
      () => LoginViewModel(
        Get.find<LoginUseCase>(),
        Get.find<GetUsernameUseCase>(),
      ),
    );
  }
}
