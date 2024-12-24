import 'package:flutter/material.dart';
import 'package:taskforme/shared/components/blur/blur_container.dart';
import 'package:taskforme/shared/constants/task_status.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/resources/routes/routes.dart';

class EmptyTaskItem extends StatelessWidget {
  final VoidCallback? onClose;
  final EdgeInsetsGeometry? margin;
  const EmptyTaskItem({super.key, this.onClose, this.margin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await pushView(
          Routes.registerTask,
          parameters: {"status": TaskStatus.doing},
        );
        onClose?.call();
      },
      child: const BlurContainer(
        blur: 20,
        elevation: .1,
        color: Colors.white38,
        child: Center(
          child: Text(
            "Adicionar\ntarefa!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 15,
              color: Colors.black45,
            ),
          ),
        ),
      ),
    );
  }
}
