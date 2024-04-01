import 'package:flutter/material.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';

class TaskCard extends StatelessWidget {
  final Color? color;
  final String? state;
  final String? quantity;
  final IconData? iconData;
  const TaskCard({super.key, this.color, this.state, this.quantity, this.iconData});

  @override
  Widget build(BuildContext context) {
    final height = screenHeight(context);
    return Card(
      color: color?.withOpacity(.84),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              padding: const EdgeInsets.all(3.5),
              margin: const EdgeInsets.only(right: 6),
              child: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$state",
                    style: TextStyle(
                      fontSize: height / 47,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "$quantity tarefas",
                    style: TextStyle(
                      fontSize: height / 46,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
