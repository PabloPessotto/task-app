import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/presenter/view_model/login/login_view_model.dart';
import 'package:taskforme/shared/components/base/base_card_form.dart';
import 'package:taskforme/shared/components/base/base_view.dart';
import 'package:taskforme/shared/components/button/loading_button.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';
import 'package:taskforme/shared/resources/routes/routes.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginViewModel _viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    final (height, width) = screenSize(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.blue[50]!,
              Colors.blue[100]!,
              Colors.blue[100]!,
              Colors.blue[300]!,
              Colors.blue[400]!,
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: BaseView(
          safeAreaTop: false,
          safeAreaBottom: false,
          child: SizedBox(
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: width / 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) => LinearGradient(
                          colors: [
                            Colors.blue[600]!,
                            Colors.blue[800]!,
                            Colors.blue[900]!,
                          ],
                        ).createShader(bounds),
                        child: Icon(
                          Icons.check_box_rounded,
                          size: height / 8,
                        ),
                      ),
                      Text(
                        'tarefas',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: height / 15,
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                      Text(
                        'for me.',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          height: 0,
                          fontSize: height / 50,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: height / 17),
                    ],
                  ),
                ),
                BaseCardForm(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'LOGIN',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                height: 0,
                                fontSize: height / 50,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: _viewModel.usernameController,
                              decoration: const InputDecoration(hintText: "usuário"),
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus();
                              },
                              onChanged: _viewModel.setUsername,
                            ),
                            const SizedBox(height: 12),
                            Obx(() {
                              return TextField(
                                obscureText: _viewModel.obscurePassword,
                                decoration: InputDecoration(
                                  hintText: "senha",
                                  suffixIcon: IconButton(
                                    onPressed: _viewModel.updateObscurePassword,
                                    icon: Icon(_viewModel.obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                ),
                                onTapOutside: (event) {
                                  FocusScope.of(context).unfocus();
                                },
                                onChanged: _viewModel.setPassword,
                                onSubmitted: (value) {
                                  _viewModel.login();
                                },
                              );
                            }),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width / 10, vertical: height / 18),
                        width: double.maxFinite,
                        child: Obx(() {
                          return LoadingButton(
                            label: 'Entrar',
                            isLoading: _viewModel.loading,
                            onPressed: _viewModel.login,
                          );
                        }),
                      ),
                      InkWell(
                        child: RichText(
                          text: TextSpan(
                            text: 'Não possui conta?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: height / 50,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
