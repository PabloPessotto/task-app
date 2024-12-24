import 'package:flutter/material.dart';
import 'package:taskforme/domain/entities/task.dart';
import 'package:taskforme/shared/components/status/color_status.dart';
import 'package:taskforme/shared/constants/task_status.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/resources/routes/routes.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback? onClose;
  final EdgeInsetsGeometry? margin;
  const TaskItem({super.key, required this.task, this.onClose, this.margin});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin ?? EdgeInsets.zero,
      // surfaceTintColor: task.status == TaskStatus.doing
      //     ? statusColor(task.status ?? TaskStatus.opened)
      //     : Colors.white,
      surfaceTintColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              contentPadding: const EdgeInsets.only(right: 16),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                width: 10,
                height: 156,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: statusColor(task.status ?? TaskStatus.opened),
                      width: 10,
                    ),
                  ),
                ),
              ),
              minLeadingWidth: 8,
              title: Text(
                '${task.title}',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 17.5,
                ),
              ),
              onTap: () async {
                await pushView(Routes.taskDetails, arguments: task);
                onClose?.call();
              },
            ),
          ),
          Flexible(
            child: ListTile(
              onTap: () async {
                await pushView(Routes.taskDetails, arguments: task);
                onClose?.call();
              },
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              title: Text(
                "${task.description}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              subtitle: Wrap(
                children: task.labels!.map((e) {
                  return Text(
                    '#${e.name?.toLowerCase()} ',
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
