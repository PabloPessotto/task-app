import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/presenter/view_model/login/register_view_model.dart';
import 'package:taskforme/shared/components/base/base_view.dart';
import 'package:taskforme/shared/components/blur/blur_background.dart';
import 'package:taskforme/shared/components/button/loading_button.dart';
import 'package:taskforme/shared/components/circle/background_circle.dart';
import 'package:taskforme/shared/components/input/input_field.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';
import 'package:taskforme/shared/resources/assets/app_assets.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final RegisterViewModel _viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    final (height, width) = screenSize(context);
    return BlurBackground(
      blur: 300,
      circles: [
        const BackgroundCircle(
          bottom: -100,
          size: 250,
          colors: [
            Colors.purple,
            Colors.teal,
          ],
        ),
        const BackgroundCircle(
          top: -100,
          right: 0,
          size: 250,
          colors: [
            Colors.cyan,
            Colors.yellowAccent,
          ],
        ),
        BackgroundCircle(
          right: -10,
          bottom: 290,
          size: 200,
          colors: [
            Colors.blue[200]!,
            Colors.blue[900]!,
          ],
        ),
      ],
      scaffold: Scaffold(
        backgroundColor: Colors.transparent,
        body: BaseView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.logo,
                height: height / 15,
              ),
              Text(
                'bem-vindo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: height / 18,
                  fontWeight: FontWeight.w300,
                  height: 0,
                ),
              ),
              SizedBox(height: height / 18),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'CADASTRE-SE',
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
                      hint: "usuário",
                      textInputAction: TextInputAction.next,
                      onChanged: _viewModel.serUsername,
                    ),
                    const SizedBox(height: 12),
                    Obx(() {
                      return InputField(
                        obscureText: _viewModel.obscurePassword,
                        textInputAction: TextInputAction.next,
                        hint: "senha",
                        suffixIcon: IconButton(
                          onPressed: _viewModel.updateObscurePassword,
                          icon: Icon(_viewModel.obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        onChanged: _viewModel.setPassword,
                      );
                    }),
                    const SizedBox(height: 12),
                    Obx(() {
                      return InputField(
                        obscureText: _viewModel.obscurePassword,
                        textInputAction: TextInputAction.done,
                        hint: "confirmar senha",
                        suffixIcon: IconButton(
                          onPressed: _viewModel.updateObscurePassword,
                          icon: Icon(_viewModel.obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        onChanged: _viewModel.setConfirmPassword,
                      );
                    }),
                    SizedBox(height: height / 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const OutlinedButton(
                          onPressed: closeView,
                          child: Text("Voltar"),
                        ),
                        Obx(() {
                          return LoadingButton(
                            isLoading: _viewModel.loading,
                            onPressed: _viewModel.registerUser,
                            label: "Cadastrar",
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
