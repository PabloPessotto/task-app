import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/presenter/view_model/task/register_task_view_model.dart';
import 'package:taskforme/shared/components/base/base_view.dart';
import 'package:taskforme/shared/components/blur/blur_background.dart';
import 'package:taskforme/shared/components/blur/blur_container.dart';
import 'package:taskforme/shared/components/button/loading_button.dart';
import 'package:taskforme/shared/components/button/x_close_button.dart';
import 'package:taskforme/shared/components/card/label_card.dart';
import 'package:taskforme/shared/components/circle/background_circle.dart';
import 'package:taskforme/shared/components/header/header.dart';
import 'package:taskforme/shared/components/input/input_field.dart';
import 'package:taskforme/shared/components/page/page.dart';
import 'package:taskforme/shared/components/task/label/label_chip.dart';
import 'package:taskforme/shared/functions/date/date_formatter.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';
import 'package:taskforme/shared/resources/routes/routes.dart';

class RegisterTaskView extends StatelessWidget {
  RegisterTaskView({super.key});

  final RegisterTaskViewModel _viewModel = Get.find();

  final _backgroundCircles = [
    BackgroundCircle(
      top: 100,
      left: -150,
      size: 250,
      colors: [
        Colors.purple,
        Colors.blue[600]!,
      ],
    ),
    BackgroundCircle(
      right: 5,
      bottom: 10,
      size: 160,
      colors: [
        Colors.blue[600]!,
        Colors.purple,
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final height = screenHeight(context);
    return AppPage(
      blur: 300,
      circles: _backgroundCircles,
      header: Header(
        headerHeight: 110,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const XCloseButton(),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                Get.arguments == null ? 'Nova tarefa' : "Editar tarefa",
                style: TextStyle(
                  fontSize: height / 34,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputField(
                  controller: _viewModel.titleController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  hint: "Título da tarefa",
                  onChanged: _viewModel.setTitle,
                ),
                const SizedBox(height: 12),
                Column(
                  children: [
                    InputField(
                      controller: _viewModel.descriptionController,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      hint: "Adicione a descrição da tarefa",
                      onChanged: _viewModel.setDescription,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: null,
                          icon: Icon(Icons.grid_view_rounded),
                        ),
                        IconButton(
                          onPressed: null,
                          icon: Icon(Icons.format_color_text_rounded),
                        ),
                        IconButton(
                          onPressed: null,
                          icon: Icon(Icons.attach_file_rounded),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                BlurContainer(
                  blur: 50,
                  color: Colors.white,
                  child: ListTile(
                    onTap: _viewModel.selectTaskDate,
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    leading: const Icon(Icons.edit_calendar_rounded),
                    title: Obx(() {
                      return Text(
                        weekdayDayMonth(_viewModel.date),
                        style: TextStyle(
                          fontSize: height / 50,
                          fontWeight: FontWeight.w700,
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 10),
                BlurContainer(
                  blur: 50,
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        useSafeArea: true,
                        barrierColor: Colors.transparent,
                        builder: (context) {
                          return BlurBackground(
                            circles: const [],
                            blur: 5,
                            scaffold: Scaffold(
                              backgroundColor: Colors.white,
                              body: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const TextButton(
                                        onPressed: closeView,
                                        child: Text("Salvar"),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await pushView(Routes.registerLabel);
                                          _viewModel.loadLabels();
                                        },
                                        child: const Text("Nova etiqueta"),
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    child: BaseView(
                                      child: Obx(() {
                                        return Column(
                                          children:
                                              _viewModel.listLabel.map((label) {
                                            return LabelCard(
                                              label: label,
                                              selected: _viewModel.listLabelSelected
                                                  .contains(label),
                                              selectedLabel: (value) {
                                                _viewModel.addLabel(value);
                                              },
                                            );
                                          }).toList(),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    leading: const Icon(Icons.tag_rounded),
                    title: Obx(() {
                      if (_viewModel.listLabelSelected.isEmpty) {
                        return Text(
                          'Adicionar Etiquetas...',
                          style: TextStyle(
                            fontSize: height / 50,
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      } else {
                        return Wrap(
                          runSpacing: 2,
                          spacing: 2,
                          children: _viewModel.listLabelSelected.map((e) {
                            return LabelChip(label: e);
                          }).toList(),
                        );
                      }
                    }),
                  ),
                ),
                const SizedBox(height: 200),
              ],
            ),
          ),
        ],
      ),
      bottomBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25)
            .copyWith(bottom: MediaQuery.paddingOf(context).bottom + 20),
        child: Obx(() {
          return LoadingButton(
            isLoading: _viewModel.loading,
            label: Get.arguments == null ? 'Criar tarefa' : 'Editar',
            onPressed: Get.arguments == null
                ? _viewModel.createTask
                : _viewModel.updateTask,
          );
        }),
      ),
    );
  }
}
