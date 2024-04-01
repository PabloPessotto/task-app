import 'package:get/get.dart';
import 'package:taskforme/domain/repository/user_repository.dart';
import 'package:taskforme/domain/usecase/user/register_user_usecase.dart';
import 'package:taskforme/presenter/view_model/login/register_view_model.dart';

class RegisterUserModule implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterUserUseCase>(
      () => RegisterUserUseCase(
        Get.find<UserRepository>(),
      ),
    );

    Get.lazyPut<RegisterViewModel>(
      () => RegisterViewModel(
        Get.find<RegisterUserUseCase>(),
      ),
    );
  }
}
