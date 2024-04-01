import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/presenter/view_model/task/task_details_view_model.dart';
import 'package:taskforme/shared/components/base/base_view.dart';
import 'package:taskforme/shared/components/status/color_status.dart';
import 'package:taskforme/shared/components/status/status_name.dart';
import 'package:taskforme/shared/constants/task_labels.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';
import 'package:taskforme/shared/resources/routes/routes.dart';

class TaskDetailsView extends StatelessWidget {
  TaskDetailsView({super.key});

  final TaskDetailsViewModel _viewModel = Get.find();

  final List<String> _status = ['aberta', 'fazendo', 'completa', 'cancelada'];

  @override
  Widget build(BuildContext context) {
    final (height, width) = screenSize(context);
    return Scaffold(
      body: BaseView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Icons.arrow_back_ios_new_outlined,
                      size: 28,
                    ),
                  ),
                  Obx(() {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: statusColor(_viewModel.statusTask),
                      ),
                      child: Text(
                        statusName(_viewModel.statusTask),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                ],
              ),
              const SizedBox(height: 30),
              Obx(() {
                return Text(
                  '${_viewModel.task.title}',
                  style: TextStyle(
                    fontSize: height / 34,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }),
              const SizedBox(height: 8),
              Obx(() {
                return Text(
                  '${_viewModel.task.description}',
                  style: TextStyle(
                    fontSize: height / 55,
                    fontWeight: FontWeight.w300,
                  ),
                );
              }),
              const SizedBox(height: 12),
              Obx(() {
                return Wrap(
                  spacing: 3.5,
                  children: (_viewModel.task.label)!.map((e) {
                    return ChoiceChip(
                      label: Text(e),
                      selected: true,
                      onSelected: (value) {},
                      selectedColor: contextLabels.contains(e)
                          ? Colors.yellow[600]
                          : priorityLabels.contains(e)
                              ? Colors.purpleAccent
                              : typeLabels.contains(e)
                                  ? Colors.teal
                                  : Colors.lightGreen,
                      showCheckmark: false,
                      visualDensity: VisualDensity.compact,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 2),
                    );
                  }).toList(),
                );
              }),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[350],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.calendar_month_outlined),
                      const SizedBox(width: 5),
                      Text(
                        "${_viewModel.task.date?.replaceAll('-', '/')}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Alterar status',
                style: TextStyle(
                  fontSize: height / 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                children: _status.map((e) {
                  return Obx(() {
                    final selected = statusName(_viewModel.statusTask) == e;
                    return ChoiceChip(
                      label: Text(e),
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      selected: selected,
                      selectedColor: statusColor(_viewModel.statusTask),
                      showCheckmark: false,
                      onSelected: (value) {
                        _viewModel.updateTaskStatus(status(e));
                      },
                    );
                  });
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: width / 15).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton.icon(
              onPressed: _viewModel.deleteTask,
              icon: const Icon(
                Icons.delete_rounded,
                color: Colors.red,
              ),
              label: const Text(
                'Deletar',
                style: TextStyle(color: Colors.red),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                final taskUpdated =
                    await pushView(Routes.registerTask, arguments: _viewModel.task);
                if (taskUpdated != null) {
                  _viewModel.updateTask(taskUpdated);
                }
              },
              icon: const Icon(Icons.edit_rounded),
              label: const Text('Editar'),
            )
          ],
        ),
      ),
    );
  }
}
