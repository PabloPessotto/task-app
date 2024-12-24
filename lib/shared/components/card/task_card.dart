import 'package:flutter/material.dart';
import 'package:taskforme/shared/components/blur/blur_container.dart';
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
    return BlurContainer(
      height: 90,
      width: 150,
      color: Colors.white38,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$quantity",
                  style: TextStyle(
                    fontSize: height / 31,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Icon(
                    iconData,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "$state",
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontSize: height / 50,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
