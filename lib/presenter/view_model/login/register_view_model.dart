import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/core/result.dart';
import 'package:taskforme/domain/usecase/user/register_user_usecase.dart';
import 'package:taskforme/shared/components/base/alert/base_alert.dart';
import 'package:taskforme/shared/components/button/alert_buttons/high_alert_button.dart';
import 'package:taskforme/shared/components/button/alert_buttons/low_alert_button.dart';
import 'package:taskforme/shared/functions/dialog/dialog_functions.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';

class RegisterViewModel extends GetxController {
  final RegisterUserUseCase _registerUserUseCase;

  RegisterViewModel(this._registerUserUseCase);

  String? _username;
  String? _password;
  String? _confirmPassword;

  final RxBool _obscurePassword = true.obs;
  final RxBool _loading = false.obs;

  bool get obscurePassword => _obscurePassword.value;

  bool get loading => _loading.value;

  void serUsername(String username) {
    _username = username;
  }

  void setPassword(String password) {
    _password = password;
  }

  void setConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
  }

  void _updateLogin() {
    _loading.value = !loading;
  }

  void updateObscurePassword() {
    _obscurePassword.value = !obscurePassword;
  }

  Future<void> registerUser() async {
    FocusScope.of(Get.context!).unfocus();
    if ((_username?.isEmpty ?? true) ||
        (_password?.isEmpty ?? true) ||
        (_confirmPassword?.isEmpty ?? true)) {
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
    } else {
      if (_password! != _confirmPassword!) {
        openAlert(
          const BaseAlert(
            color: Colors.red,
            title: "Senhas divergentes!",
            message:
                "Por favor, revise e certifique-se de que as senhas digitadas nos campos correspondentes são idênticas. ",
            functions: [
              HighAlertButton(
                label: "Alterar",
                onTap: closeView,
              ),
            ],
          ),
        );
      } else {
        _updateLogin();
        final result = await _registerUserUseCase.execute(_username!, _password!);
        switch (result) {
          case Success():
            openAlert(
              BaseAlert(
                color: Colors.green,
                title: "Usuário criado!",
                message: "Usuário criado com sucesso. Deseja realizar login?",
                functions: [
                  const LowAlertButton(
                    label: 'Não, fechar',
                    onTap: closeView,
                  ),
                  HighAlertButton(
                    label: "Ir para login",
                    onTap: () {
                      closeView();
                      closeView();
                    },
                  ),
                ],
              ),
            );
            _updateLogin();
          case Failure(value: final message):
            print('message - $message');
            _updateLogin();
            if (message == "User exists.") {
              openAlert(
                const BaseAlert(
                  color: Colors.red,
                  title: "Falha na requisição",
                  message: "Usuário já cadastrado. Deseja fazer login? ",
                  functions: [
                    LowAlertButton(
                      label: "Alterar",
                      onTap: closeView,
                    ),
                    HighAlertButton(
                      label: "Sim, ir para login",
                      onTap: closeView,
                    ),
                  ],
                ),
              );
            }
        }
      }
    }
  }
}
