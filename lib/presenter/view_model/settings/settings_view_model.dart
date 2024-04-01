import 'package:get/get.dart';
import 'package:taskforme/domain/usecase/user/logout_usecase.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/resources/routes/routes.dart';

class SettingsViewModel extends GetxController {
  final LogoutUseCase _logoutUseCase;

  SettingsViewModel(this._logoutUseCase);

  Future<void> logout() async {
    final isLogout = await _logoutUseCase.execute();
    if (isLogout) pushUntilView(Routes.login);
  }
}
