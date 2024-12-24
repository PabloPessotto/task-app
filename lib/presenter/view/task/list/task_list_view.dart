import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskforme/presenter/view_model/task/list/task_list_view_model.dart';
import 'package:taskforme/shared/components/base/base_view.dart';
import 'package:taskforme/shared/components/button/arrow_close_button.dart';
import 'package:taskforme/shared/components/status/color_status.dart';
import 'package:taskforme/shared/components/status/status_name.dart';
import 'package:taskforme/shared/components/task/task_item.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';

class TaskListView extends StatelessWidget {
  TaskListView({super.key});

  final List<int> _dateWeekdays = [
    DateTime.sunday,
    DateTime.monday,
    DateTime.tuesday,
    DateTime.wednesday,
    DateTime.thursday,
    DateTime.friday,
    DateTime.saturday,
  ];

  final List<String> _status = [
    'todas',
    'aberta',
    'fazendo',
    'completa',
    'cancelada'
  ];

  final TaskListViewModel _viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    final (height, width) = screenSize(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ArrowCloseButton(),
                  const SizedBox(height: 15),
                  Text(
                    'Hoje, ${DateFormat('MMMMd', 'pt_Br').format(DateTime.now())}',
                    style: TextStyle(
                      fontSize: height / 34,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              height: 50,
              decoration: BoxDecoration(
                // color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _dateWeekdays.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  DateTime currentDate = DateTime.now();
                  int diaAjustado = index - currentDate.weekday % 7;
                  DateTime dayWeek = currentDate.add(Duration(days: diaAjustado));
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: width / 8,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: currentDate.weekday == index
                            ? Colors.blue[900]
                            : Colors.grey[300],
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: Text(
                        "${DateFormat('E', 'pt_Br').format(
                          dayWeek,
                        )}\n${DateFormat('d').format(dayWeek)}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: currentDate.weekday == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: currentDate.weekday == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Minhas tarefas',
                style: TextStyle(
                  fontSize: height / 40,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Obx(() {
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
                      },
                    );
                  }).toList(),
                );
              }),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BaseView(
                safeAreaTop: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Obx(() {
                        if (_viewModel.tasks.isEmpty) {
                          return Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: height / 10),
                            child: Text(
                              "Comece criando novas tarefas.",
                              style: TextStyle(
                                fontSize: height / 50,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          );
                        } else {
                          return Wrap(
                            runSpacing: 8,
                            children: _viewModel.tasks.map((e) {
                              return TaskItem(
                                task: e,
                                onClose: () {
                                  _viewModel.loadListOfTasks();
                                },
                              );
                            }).toList(),
                          );
                        }
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
