import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/presenter/view_model/label/register_label_view_model.dart';
import 'package:taskforme/shared/components/base/base_view.dart';
import 'package:taskforme/shared/components/blur/blur_background.dart';
import 'package:taskforme/shared/components/button/loading_button.dart';
import 'package:taskforme/shared/components/button/x_close_button.dart';
import 'package:taskforme/shared/components/circle/background_circle.dart';
import 'package:taskforme/shared/components/input/input_field.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';
import 'package:taskforme/shared/resources/theme/hex_color.dart';

class RegisterLabelView extends StatelessWidget {
  RegisterLabelView({super.key});

  final RegisterLabelViewModel _viewModel = Get.find();

  final _colors = [
    Colors.deepPurpleAccent,
    Colors.teal,
    Colors.yellow[600],
    Colors.lightGreen,
    Colors.red,
    Colors.green,
    Colors.pink,
    Colors.grey,
    Colors.grey[200],
    Colors.grey[350],
    Colors.deepOrange,
    Colors.indigo,
    Colors.blueAccent,
    Colors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    final (height, width) = screenSize(context);
    return BlurBackground(
      blur: 200,
      circles: [
        BackgroundCircle(
          right: -50,
          top: -100,
          size: 270,
          colors: [
            Colors.red[800]!,
            Colors.orange[400]!,
          ],
        ),
        const BackgroundCircle(
          left: -70,
          bottom: 20,
          colors: [
            Colors.tealAccent,
            Colors.purple,
          ],
        ),
      ],
      scaffold: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(.5),
        body: BaseView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const XCloseButton(),
                const SizedBox(height: 20),
                Text(
                  'Nova etiqueta',
                  style: TextStyle(
                    fontSize: height / 34,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 12),
                InputField(
                  controller: _viewModel.labelNameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  hint: "Nome da etiqueta",
                  onChanged: _viewModel.setLabelName,
                ),
                const SizedBox(height: 12),
                InputField(
                  controller: _viewModel.labelDescriptionController,
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  hint: "Descrição (opcional)",
                  onChanged: _viewModel.setLabelDescription,
                ),
                const SizedBox(height: 12),
                const Text('Cor de fundo'),
                Row(
                  children: [
                    Obx(() {
                      return Container(
                        decoration: BoxDecoration(
                          color: _viewModel.labelColor.isEmpty ||
                                  _viewModel.labelColor == "#"
                              ? Colors.white
                              : HexColor.fromHex(_viewModel.labelColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 47,
                        width: 47,
                      );
                    }),
                    const SizedBox(width: 5),
                    Flexible(
                      child: InputField(
                        controller: _viewModel.labelColorController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onChanged: _viewModel.setLabelColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text('Selecione uma cor abaixo ou insira o hexadecimal.'),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    runSpacing: 5,
                    spacing: 10,
                    runAlignment: WrapAlignment.center,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: _colors.map((e) {
                      return InkWell(
                        onTap: () {
                          _viewModel.changeColor("#${getHexColor(e!)}");
                          print('hjkdadhsjahd - #${getHexColor(e)}');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: e,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 40,
                          width: 40,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        extendBody: true,
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25)
              .copyWith(bottom: MediaQuery.paddingOf(context).bottom + 20),
          child: Obx(() {
            return LoadingButton(
              label: 'Criar etiqueta',
              isLoading: _viewModel.loading,
              onPressed: _viewModel.createLabel,
            );
          }),
        ),
      ),
    );
  }
}
