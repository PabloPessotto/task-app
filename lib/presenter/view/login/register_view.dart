import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/presenter/view_model/login/register_view_model.dart';
import 'package:taskforme/shared/components/base/base_view.dart';
import 'package:taskforme/shared/components/button/loading_button.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final RegisterViewModel _viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    final (height, width) = screenSize(context);
    return Scaffold(
      body: BaseView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                size: height / 12,
              ),
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
              padding: EdgeInsets.symmetric(horizontal: width / 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'CADASTRE-SE',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      height: 0,
                      fontSize: height / 50,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(hintText: "usuário"),
                    textInputAction: TextInputAction.next,
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    onChanged: _viewModel.serUsername,
                  ),
                  const SizedBox(height: 12),
                  Obx(() {
                    return TextField(
                      obscureText: _viewModel.obscurePassword,
                      textInputAction: TextInputAction.next,
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
                    );
                  }),
                  const SizedBox(height: 12),
                  Obx(() {
                    return TextField(
                      obscureText: _viewModel.obscurePassword,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: "confirmar senha",
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
    );
  }
}
