import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:taskforme/shared/resources/theme/app_color.dart';

class BlurBackground extends StatelessWidget {
  final Scaffold scaffold;
  final List<Widget> circles;
  final Color? backgroundColor;
  final double? blur;

  BlurBackground({
    super.key,
    List<Widget>? circles,
    required this.scaffold,
    this.backgroundColor,
    this.blur,
  }) : circles = circles ?? <Widget>[];

  @override
  Widget build(BuildContext context) {
    final listCircleIsEmpty = circles.isEmpty;

    return Container(
      color: backgroundColor ?? AppColor.white96,
      child: Stack(
        children: circles.map((e) => e).toList()
          ..insert(
            listCircleIsEmpty ? 0 : circles.length,
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur ?? 20, sigmaY: blur ?? 20),
              child: scaffold,
            ),
          ),
      ),
    );
  }
}
