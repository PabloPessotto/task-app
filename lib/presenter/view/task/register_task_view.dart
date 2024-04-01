import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/presenter/view_model/task/register_task_view_model.dart';
import 'package:taskforme/shared/components/base/base_view.dart';
import 'package:taskforme/shared/components/button/loading_button.dart';
import 'package:taskforme/shared/constants/task_labels.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';

class RegisterTaskView extends StatelessWidget {
  RegisterTaskView({super.key});

  final RegisterTaskViewModel _viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    final height = screenHeight(context);
    return Scaffold(
      body: BaseView(
        safeAreaBottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey[350],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: closeView,
                icon: const Icon(
                  Icons.close_rounded,
                  size: 28,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                Get.arguments == null ? 'Nova tarefa' : "Editar tarefa",
                style: TextStyle(
                  fontSize: height / 34,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _viewModel.titleController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: "Título da tarefa"),
                onChanged: _viewModel.setTitle,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
              ),
              const SizedBox(height: 12),
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: _viewModel.selectTaskDate,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDEDFE8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.edit_calendar_rounded),
                      const SizedBox(width: 5),
                      Text(
                        "Data",
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Obx(() {
                        return Text(
                          _viewModel.date.replaceAll('-', '/'),
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Column(
                children: [
                  TextField(
                    controller: _viewModel.descriptionController,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    decoration: const InputDecoration(
                      hintText: "Adicione a descrição da tarefa",
                    ),
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
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
              const SizedBox(height: 15),
              Text(
                'Label',
                style: TextStyle(
                  fontSize: height / 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Prioridade'),
                  Wrap(
                    spacing: 3.5,
                    children: priorityLabels.map((e) {
                      return Obx(() {
                        return ChoiceChip(
                          label: Text(e),
                          selected: _viewModel.taskLabel.contains(e),
                          onSelected: (value) {
                            _viewModel.addLabel(e);
                          },
                          selectedColor: Colors.deepPurpleAccent,
                          showCheckmark: false,
                          visualDensity: VisualDensity.compact,
                          padding:
                              const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                          labelPadding: const EdgeInsets.symmetric(horizontal: 2),
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Categoria'),
                  Wrap(
                    spacing: 3.5,
                    children: contextLabels.map((e) {
                      return Obx(() {
                        return ChoiceChip(
                          label: Text(e),
                          selected: _viewModel.taskLabel.contains(e),
                          onSelected: (value) {
                            _viewModel.addLabel(e);
                          },
                          selectedColor: Colors.yellow[600],
                          showCheckmark: false,
                          visualDensity: VisualDensity.compact,
                          padding:
                              const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                          labelPadding: const EdgeInsets.symmetric(horizontal: 2),
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Tipo'),
                  Wrap(
                    spacing: 3.5,
                    children: typeLabels.map((e) {
                      return Obx(() {
                        return ChoiceChip(
                          label: Text(e),
                          selected: _viewModel.taskLabel.contains(e),
                          onSelected: (value) {
                            _viewModel.addLabel(e);
                          },
                          selectedColor: Colors.teal,
                          showCheckmark: false,
                          visualDensity: VisualDensity.compact,
                          padding:
                              const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                          labelPadding: const EdgeInsets.symmetric(horizontal: 2),
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Outras'),
                  Wrap(
                    spacing: 3.5,
                    children: otherLabels.map((e) {
                      return Obx(() {
                        return ChoiceChip(
                          label: Text(e),
                          selected: _viewModel.taskLabel.contains(e),
                          onSelected: (value) {
                            _viewModel.addLabel(e);
                          },
                          selectedColor: Colors.lightGreen,
                          showCheckmark: false,
                          visualDensity: VisualDensity.compact,
                          padding:
                              const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                          labelPadding: const EdgeInsets.symmetric(horizontal: 2),
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 200),
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
