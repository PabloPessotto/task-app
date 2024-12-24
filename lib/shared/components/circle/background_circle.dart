import 'package:flutter/material.dart';

class BackgroundCircle extends StatelessWidget {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double? size;
  final List<Color> colors;
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final double? foregroundOpacity;

  const BackgroundCircle({
    super.key,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.size,
    required this.colors,
    this.begin,
    this.end,
    this.foregroundOpacity,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        height: size ?? 250,
        width: size ?? 250,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: colors,
            begin: begin ?? Alignment.topLeft,
            end: end ?? Alignment.bottomCenter,
          ),
        ),
        foregroundDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context)
              .scaffoldBackgroundColor
              .withOpacity(foregroundOpacity ?? .3),
        ),
      ),
    );
  }
}
