import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/presenter/view_model/task/task_details_view_model.dart';
import 'package:taskforme/shared/components/base/base_view.dart';
import 'package:taskforme/shared/components/blur/blur_background.dart';
import 'package:taskforme/shared/components/blur/blur_container.dart';
import 'package:taskforme/shared/components/button/drop_button.dart';
import 'package:taskforme/shared/components/circle/background_circle.dart';
import 'package:taskforme/shared/components/status/color_status.dart';
import 'package:taskforme/shared/components/status/status_name.dart';
import 'package:taskforme/shared/components/task/label/label_chip.dart';
import 'package:taskforme/shared/functions/date/date_formatter.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';
import 'package:taskforme/shared/resources/routes/routes.dart';
import 'package:taskforme/shared/resources/theme/set_text_color.dart';

class TaskDetailsView extends StatelessWidget {
  TaskDetailsView({super.key});

  final TaskDetailsViewModel _viewModel = Get.find();

  final List<String> _status = [
    'pendente',
    'em andamento',
    'concluída',
    'cancelada'
  ];

  @override
  Widget build(BuildContext context) {
    final (height, width) = screenSize(context);
    return BlurBackground(
      blur: 500,
      circles: [
        BackgroundCircle(
          right: -120,
          size: 350,
          colors: [
            Colors.purpleAccent.withOpacity(.6),
            Colors.blue[400]!.withOpacity(.6),
          ],
        ),
      ],
      scaffold: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(.2),
        body: BaseView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
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
                        Icons.arrow_back_ios_new_rounded,
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
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: setTextColor(
                              statusColor(_viewModel.statusTask),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
                const SizedBox(height: 20),
                Obx(() {
                  return Text(
                    '${_viewModel.task.title}',
                    style: TextStyle(
                      fontSize: height / 34,
                      fontWeight: FontWeight.w700,
                    ),
                  );
                }),
                const SizedBox(height: 5),
                Text(
                  weekdayDayMonth(_viewModel.task.date!),
                  style: TextStyle(
                    fontSize: height / 60,
                  ),
                ),
                const SizedBox(height: 10),
                Obx(() {
                  return Text(
                    '${_viewModel.task.description}',
                    style: TextStyle(
                      fontSize: height / 50,
                      fontWeight: FontWeight.w300,
                    ),
                  );
                }),
                const SizedBox(height: 20),
                BlurContainer(
                  blur: 50,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Alterar status"),
                      Flexible(
                        child: Obx(() {
                          return DropButton(
                            hint: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: statusColor(_viewModel.statusTask),
                              ),
                              child: Text(
                                statusName(_viewModel.statusTask),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: setTextColor(
                                    statusColor(_viewModel.statusTask),
                                  ),
                                ),
                              ),
                            ),
                            items: _status,
                            onChanged: (value) {
                              print('ssss $value');
                              _viewModel.updateTaskStatus(status(value!));
                            },
                            value: statusName(_viewModel.statusTask),
                            itemDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: statusColor(_viewModel.statusTask),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                BlurContainer(
                  blur: 50,
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    leading: const Icon(Icons.tag_rounded),
                    title: Obx(() {
                      return Wrap(
                        runSpacing: 2,
                        spacing: 2,
                        children: _viewModel.task.labels?.map((e) {
                              return LabelChip(label: e);
                            }).toList() ??
                            [],
                      );
                    }),
                  ),
                ),

                /*const SizedBox(height: 12),
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
              ),*/
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
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  final taskUpdated = await pushView(Routes.registerTask,
                      arguments: _viewModel.task);
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
      ),
    );
  }
}
