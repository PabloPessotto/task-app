import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:taskforme/presenter/view_model/home/home_view_model.dart';
import 'package:taskforme/shared/components/card/task_card.dart';
import 'package:taskforme/shared/components/circle/background_circle.dart';
import 'package:taskforme/shared/components/header/header.dart';
import 'package:taskforme/shared/components/page/page.dart';
import 'package:taskforme/shared/components/task/empty_task_item.dart';
import 'package:taskforme/shared/components/task/task_item.dart';
import 'package:taskforme/shared/constants/task_status.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';
import 'package:taskforme/shared/resources/routes/routes.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeViewModel _viewModel = Get.find();

  final _backgroundCircles = [
    const BackgroundCircle(
      right: -70,
      colors: [
        Colors.tealAccent,
        Colors.purple,
      ],
    ),
    BackgroundCircle(
      left: -50,
      top: -60,
      size: 150,
      colors: [
        Colors.orangeAccent,
        Colors.red[900]!,
      ],
    ),
    BackgroundCircle(
      left: -80,
      top: 260,
      size: 200,
      colors: [
        Colors.green[900]!,
        Colors.limeAccent,
      ],
    ),
    BackgroundCircle(
      bottom: -130,
      left: -130,
      colors: [
        Colors.purple,
        Colors.blue[600]!,
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final (height, width) = screenSize(context);
    return AppPage(
      blur: 300,
      circles: _backgroundCircles,
      header: Header(
        child: Row(
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
              mainAxisAlignment: MainAxisAlignment.center,
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
            const Spacer(),
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.2),
                padding: const EdgeInsets.all(8),
              ),
              icon: const Icon(Icons.settings),
              onPressed: () {
                pushView(Routes.settings);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 90,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 6),
              shrinkWrap: true,
              children: [
                const SizedBox(width: 15),
                Obx(() {
                  return TaskCard(
                    color: Colors.blue[700],
                    iconData: Icons.fiber_new_outlined,
                    state: "pendente",
                    quantity:
                        '${_viewModel.quantityByStatus(TaskStatus.opened).value + _viewModel.quantityByStatus(TaskStatus.pending).value}',
                  );
                }),
                const SizedBox(width: 10),
                Obx(() {
                  return TaskCard(
                    color: Colors.yellow[700],
                    iconData: Icons.watch_later_outlined,
                    state: "em andamento",
                    quantity:
                        '${_viewModel.quantityByStatus(TaskStatus.doing).value + _viewModel.quantityByStatus(TaskStatus.inProgress).value}',
                  );
                }),
                const SizedBox(width: 10),
                Obx(() {
                  return TaskCard(
                    color: Colors.green[700],
                    iconData: Icons.check_circle_outline_rounded,
                    state: "concluída",
                    quantity: '${_viewModel.quantityByStatus(TaskStatus.completed)}',
                  );
                }),
                const SizedBox(width: 10),
                Obx(() {
                  return TaskCard(
                    color: Colors.red[700],
                    iconData: Icons.cancel_outlined,
                    state: "cancelada",
                    quantity: '${_viewModel.quantityByStatus(TaskStatus.canceled)}',
                  );
                }),
                const SizedBox(width: 15),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Obx(() {
            final doingTasks = _viewModel.tasksInternal
                .where((task) =>
                    task.status == TaskStatus.doing ||
                    task.status == TaskStatus.inProgress)
                .toList();

            if (doingTasks.isEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'Em andamento',
                      style: TextStyle(
                        fontSize: height / 40,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(height: height / 5),
                  Text(
                    "Sem tarefas!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: height / 34,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Você não possui nenhuma\ntarefa em andamento no momento.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: height / 55,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Em andamento',
                          style: TextStyle(
                            fontSize: height / 40,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            visualDensity: VisualDensity.compact,
                          ),
                          onPressed: () async {
                            await pushView(Routes.taskList);
                            _viewModel.loadListOfTasks();
                          },
                          child: Text(
                            "Ver todas",
                            style: TextStyle(
                              fontSize: height / 50,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 50),
                    Obx(() {
                      return StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        children: _viewModel.tasks.map((e) {
                          return SizedBox(
                            width: width / 2.15,
                            child: TaskItem(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              task: e,
                              onClose: () {
                                _viewModel.loadListOfTasks();
                              },
                            ),
                          );
                        }).toList()
                          ..insert(
                            doingTasks.length,
                            SizedBox(
                              width: width / 2.15,
                              height: 110,
                              child: EmptyTaskItem(
                                onClose: () {
                                  _viewModel.loadListOfTasks();
                                },
                              ),
                            ),
                          ),
                      );
                    }),
                  ],
                ),
              );
            }
          }),
        ],
      ),
      bottomBar: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: width / 30).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 15,
        ),
        padding: EdgeInsets.symmetric(horizontal: width / 70),
        decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () async {
                await pushView(Routes.taskList);
                _viewModel.loadListOfTasks();
              },
              icon: const Icon(Icons.fact_check_rounded),
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
                pushView(Routes.listLabels);
              },
              icon: const Icon(Icons.tag_rounded),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
