import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/presenter/view_model/login/login_view_model.dart';
import 'package:taskforme/shared/components/base/alert/base_alert.dart';
import 'package:taskforme/shared/components/base/base_view.dart';
import 'package:taskforme/shared/components/blur/blur_background.dart';
import 'package:taskforme/shared/components/button/alert_buttons/high_alert_button.dart';
import 'package:taskforme/shared/components/button/loading_button.dart';
import 'package:taskforme/shared/components/circle/background_circle.dart';
import 'package:taskforme/shared/components/input/input_field.dart';
import 'package:taskforme/shared/functions/dialog/dialog_functions.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';
import 'package:taskforme/shared/resources/assets/app_assets.dart';
import 'package:taskforme/shared/resources/routes/routes.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginViewModel _viewModel = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final (height, width) = screenSize(context);
    return BlurBackground(
      blur: 300,
      circles: const [
        BackgroundCircle(
          left: -50,
          top: -50,
          size: 230,
          colors: [
            Color(0xFF0D96A1),
            Color(0xFF1F314C),
          ],
        ),
        BackgroundCircle(
          right: -110,
          bottom: 50,
          size: 200,
          colors: [
            Colors.orange,
            Colors.red,
          ],
        ),
        BackgroundCircle(
          right: -50,
          top: 200,
          size: 350,
          colors: [
            Colors.purpleAccent,
            Colors.tealAccent,
          ],
        ),
        BackgroundCircle(
          left: -90,
          bottom: -110,
          colors: [
            Colors.green,
            Colors.limeAccent,
          ],
        ),
      ],
      scaffold: Scaffold(
        backgroundColor: Colors.transparent,
        body: BaseView(
          safeAreaTop: false,
          safeAreaBottom: false,
          child: SizedBox(
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.logo,
                  height: height / 8,
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 17),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'LOGIN',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                height: 0,
                                fontSize: height / 50,
                                color: Colors.black54,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 10),
                            InputField(
                              controller: _viewModel.usernameController,
                              hint: "usuário",
                              onChanged: _viewModel.setUsername,
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return "";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 12),
                            InputField(
                              controller: _viewModel.passwordController,
                              obscureText: _viewModel.obscurePassword,
                              hint: "senha",
                              suffixIcon: Obx(() {
                                return IconButton(
                                  onPressed: _viewModel.updateObscurePassword,
                                  icon: Icon(_viewModel.obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                );
                              }),
                              onChanged: _viewModel.setPassword,
                              onSubmitted: (value) {
                                FocusScope.of(context).unfocus();
                                _viewModel.login();
                              },
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return "";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: width / 17, vertical: height / 18),
                      width: double.maxFinite,
                      child: Obx(() {
                        return LoadingButton(
                          label: 'Entrar',
                          isLoading: _viewModel.loading,
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState?.validate() ?? false) {
                              _viewModel.login();
                            } else {
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
                            }
                          },
                        );
                      }),
                    ),
                    InkWell(
                      child: RichText(
                        text: TextSpan(
                          text: 'Não possui conta?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: height / 55,
                            fontWeight: FontWeight.w300,
                          ),
                          children: [
                            TextSpan(
                              text: " Cadastre-se",
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        pushView(Routes.register);
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
