import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/usecase/user/get_username_usecase.dart';
import 'package:taskforme/domain/usecase/user/login_usecase.dart';
import 'package:taskforme/shared/components/base/alert/base_alert.dart';
import 'package:taskforme/shared/components/button/alert_buttons/high_alert_button.dart';
import 'package:taskforme/shared/functions/dialog/dialog_functions.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/resources/routes/routes.dart';

class LoginViewModel extends GetxController {
  final LoginUseCase _loginUseCase;
  final GetUsernameUseCase _getUsernameUseCase;

  LoginViewModel(this._loginUseCase, this._getUsernameUseCase);

  final RxBool _obscurePassword = true.obs;
  final RxBool _loading = false.obs;

  bool get obscurePassword => _obscurePassword.value;
  bool get loading => _loading.value;

  String? _username;
  String? _password;

  final TextEditingController usernameController = TextEditingController();

  @override
  void onInit() {
    final username = _getUsernameUseCase.execute();
    setUsername(username);
    usernameController.text = username;
    super.onInit();
  }

  void setUsername(String username) {
    _username = username;
  }

  void setPassword(String password) {
    _password = password;
  }

  void updateObscurePassword() {
    _obscurePassword.value = !obscurePassword;
  }

  void _updateLoading() {
    _loading.value = !loading;
  }

  Future<void> login() async {
    FocusScope.of(Get.context!).unfocus();
    if ((_username?.isEmpty ?? true) || (_password?.isEmpty ?? true)) {
      openAlert(
        const BaseAlert(
          color: Colors.yellow,
          title: "Verifique as informações!",
          message:
              "Verifique se todos os campos estão preenchidos, e tente novamente.",
          functions: [
            HighAlertButton(
              label: "Verificar",
              onTap: closeView,
            ),
          ],
        ),
      );
      return;
    } else {
      _updateLoading();
      final result = await _loginUseCase.execute(_username!, _password!);
      switch (result) {
        case Success(value: final user):
          _updateLoading();
          pushUntilView(Routes.home);
        case Failure(value: final message):
          _updateLoading();
          print('error - $message');
          openAlert(
            BaseAlert(
              color: Colors.red,
              title: "Falha na requisição",
              message: message == "Incorrect password."
                  ? "Verifique a senha informada e tente novamente."
                  : message == "User not found"
                      ? "Usuário não encontrado."
                      : "Não foi possível realizar login. Tente novamente mais tarde.",
              functions: const [
                HighAlertButton(
                  label: "Verificar",
                  onTap: closeView,
                ),
              ],
            ),
          );
      }
    }
  }
}
