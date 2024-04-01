import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final Widget child;
  final ScrollPhysics scrollPhysics;
  final bool safeAreaBottom;
  final bool safeAreaTop;
  final EdgeInsetsGeometry? margin;

  const BaseView(
      {super.key,
      Widget? child,
      ScrollPhysics? scrollPhysics,
      bool? safeAreaBottom,
      bool? safeAreaTop,
      this.margin})
      : child = child ?? const Column(),
        scrollPhysics = scrollPhysics ??
            const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        safeAreaBottom = safeAreaBottom ?? true,
        safeAreaTop = safeAreaTop ?? true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: safeAreaBottom,
      top: safeAreaTop,
      child: Container(
        margin: margin ?? EdgeInsets.zero,
        child: LayoutBuilder(
          builder: (_, constraints) {
            return SingleChildScrollView(
              physics: scrollPhysics,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }
}
