import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseCardForm extends StatelessWidget {
  final Widget child;
  final double? height;
  final EdgeInsetsGeometry padding;

  BaseCardForm({super.key, Widget? child, this.height, EdgeInsetsGeometry? padding})
      : child = child ?? Container(),
        padding = padding ?? const EdgeInsets.all(30).copyWith(bottom: 25);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final heightQuery = switch (mediaQuery.orientation) {
      Orientation.portrait => mediaQuery.size.height * 0.55,
      Orientation.landscape => mediaQuery.size.width * 0.5
    };
    return Container(
      width: double.maxFinite,
      height: height ?? heightQuery,
      decoration: BoxDecoration(
        color: Get.theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0.45,
            offset: const Offset(0, 6),
            blurRadius: 16,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      padding: padding,
      child: child,
    );
  }
}
