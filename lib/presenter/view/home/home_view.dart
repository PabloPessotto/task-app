import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskforme/presenter/view_model/home/home_view_model.dart';
import 'package:taskforme/shared/components/base/base_view.dart';
import 'package:taskforme/shared/components/card/task_card.dart';
import 'package:taskforme/shared/components/delegate/search_task.dart';
import 'package:taskforme/shared/components/status/color_status.dart';
import 'package:taskforme/shared/components/status/status_name.dart';
import 'package:taskforme/shared/constants/task_status.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';
import 'package:taskforme/shared/resources/routes/routes.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeViewModel _viewModel = Get.find();

  final List<String> _status = [
    'todas',
    'aberta',
    'fazendo',
    'completa',
    'cancelada'
  ];

  @override
  Widget build(BuildContext context) {
    final (height, width) = screenSize(context);
    return Scaffold(
      body: BaseView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      size: height / 25,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tenha um ótimo dia',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: height / 70,
                          height: .1,
                        ),
                      ),
                      Obx(() {
                        return Text(
                          _viewModel.username,
                          style: TextStyle(
                            fontSize: height / 35,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: const InputDecoration(
                  hintText: "Buscar tarefa",
                  prefixIcon: Icon(Icons.search),
                ),
                readOnly: true,
                onTap: () async {
                  await showSearch<String>(
                    query: '',
                    context: context,
                    delegate: SearchTask(
                      tasks: _viewModel.tasksInternal,
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Obx(() {
                            return TaskCard(
                              color: Colors.blue[700],
                              iconData: Icons.restart_alt_rounded,
                              state: "aberta",
                              quantity:
                                  '${_viewModel.quantityByStatus(TaskStatus.opened)}',
                            );
                          }),
                        ),
                        const SizedBox(width: 15),
                        Flexible(
                          child: Obx(() {
                            return TaskCard(
                              color: Colors.yellow[700],
                              iconData: Icons.access_time_rounded,
                              state: "fazendo",
                              quantity:
                                  '${_viewModel.quantityByStatus(TaskStatus.doing)}',
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Flexible(
                          child: Obx(() {
                            return TaskCard(
                              color: Colors.green[700],
                              iconData: Icons.restart_alt_rounded,
                              state: "completa",
                              quantity:
                                  '${_viewModel.quantityByStatus(TaskStatus.completed)}',
                            );
                          }),
                        ),
                        const SizedBox(width: 15),
                        Flexible(
                          child: Obx(() {
                            return TaskCard(
                              color: Colors.red[700],
                              iconData: Icons.access_time_rounded,
                              state: "cancelada",
                              quantity:
                                  '${_viewModel.quantityByStatus(TaskStatus.canceled)}',
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                'Minhas tarefas',
                style: TextStyle(
                  fontSize: height / 40,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Obx(() {
                return Wrap(
                  spacing: 8,
                  children: _status.map((e) {
                    final selected = _viewModel.statusTask == e;

                    return ChoiceChip(
                      label: Text(e),
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 3),
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      selected: selected,
                      selectedColor: statusColor(status(_viewModel.statusTask)),
                      showCheckmark: false,
                      onSelected: (value) {
                        _viewModel.filerTasks(e);
                        print('skjadls - ${_viewModel.statusTask}');
                        print('dsfdsfsd- ${e}');
                      },
                    );
                  }).toList(),
                );
              }),
              const SizedBox(height: 10),
              Obx(() {
                return Wrap(
                  runSpacing: 8,
                  children: _viewModel.tasks.map((e) {
                    return Card(
                      margin: EdgeInsets.zero,
                      child: Column(
                        children: [
                          ListTile(
                            visualDensity:
                                const VisualDensity(horizontal: -4, vertical: -4),
                            contentPadding: const EdgeInsets.only(right: 16),
                            leading: Container(
                              clipBehavior: Clip.antiAlias,
                              width: 10,
                              height: 156,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color:
                                        statusColor(e.status ?? TaskStatus.opened),
                                    width: 10,
                                  ),
                                ),
                              ),
                              // padding: const EdgeInsets.only(left: 5),
                            ),
                            minLeadingWidth: 8,
                            title: Text(
                              '${e.title}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 17.5,
                              ),
                            ),
                            onTap: () async {
                              await pushView(Routes.taskDetails, arguments: e);
                              _viewModel.loadListOfTasks();
                            },
                          ),
                          ListTile(
                            onTap: () async {
                              await pushView(Routes.taskDetails, arguments: e);
                              _viewModel.loadListOfTasks();
                            },
                            visualDensity:
                                const VisualDensity(horizontal: -4, vertical: -4),
                            title: Text(
                              "${e.description}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            subtitle: Wrap(
                              children: e.label!.map((e) {
                                return Text(
                                  '#${e.toLowerCase()} ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: width / 15).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 15,
        ),
        padding: EdgeInsets.symmetric(horizontal: width / 20),
        decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const IconButton(
              onPressed: null,
              icon: Icon(Icons.fact_check_rounded),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () async {
                await pushView(Routes.registerTask);
                _viewModel.loadListOfTasks();
              },
              icon: const Icon(Icons.add),
              color: Colors.white,
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue[900],
              ),
            ),
            IconButton(
              onPressed: () {
                pushView(Routes.settings);
              },
              icon: const Icon(Icons.settings_applications),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
