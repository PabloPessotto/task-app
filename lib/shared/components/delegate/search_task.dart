import 'package:flutter/material.dart';
import 'package:taskforme/domain/entities/task.dart';
import 'package:taskforme/shared/components/status/color_status.dart';
import 'package:taskforme/shared/constants/task_status.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/resources/routes/routes.dart';

class SearchTask extends SearchDelegate<String> {
  final List<Task> tasks;

  SearchTask({required this.tasks}) : super(searchFieldLabel: "Buscar tarefa");

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
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
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final result = tasks.where((task) {
      final title = task.title ?? '';
      final description = task.description ?? '';
      final label =
          task.label?.map((e) => e.toLowerCase()).contains(query.toLowerCase()) ??
              false;
      return title.toLowerCase().contains(query.toLowerCase()) ||
          label ||
          description.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      children: result.map((e) {
        return Card(
          margin: const EdgeInsets.only(top: 5),
          child: Column(
            children: [
              ListTile(
                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                contentPadding: const EdgeInsets.only(right: 16),
                leading: Container(
                  clipBehavior: Clip.antiAlias,
                  width: 10,
                  height: 156,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: statusColor(e.status ?? TaskStatus.opened),
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
                },
              ),
              ListTile(
                onTap: () async {
                  await pushView(Routes.taskDetails, arguments: e);
                },
                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
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
        ;
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length >= 3) {
      final result = tasks.where((task) {
        final title = task.title ?? '';
        final description = task.description ?? '';
        final label =
            task.label?.map((e) => e.toLowerCase()).contains(query.toLowerCase()) ??
                false;
        return title.toLowerCase().contains(query.toLowerCase()) ||
            label ||
            description.toLowerCase().contains(query.toLowerCase());
      }).toList();

      return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: result.map((e) {
          return Card(
            margin: const EdgeInsets.only(top: 5),
            child: Column(
              children: [
                ListTile(
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                  contentPadding: const EdgeInsets.only(right: 16),
                  leading: Container(
                    clipBehavior: Clip.antiAlias,
                    width: 10,
                    height: 156,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: statusColor(e.status ?? TaskStatus.opened),
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
                  },
                ),
                ListTile(
                  onTap: () async {
                    await pushView(Routes.taskDetails, arguments: e);
                  },
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
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
          ;
        }).toList(),
      );
    } else {
      return Container();
    }
  }
}
