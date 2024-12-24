import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final double headerHeight;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Widget? child;
  const Header(
      {super.key,
      double? headerHeight,
      this.padding,
      this.backgroundColor,
      this.child})
      : headerHeight = headerHeight ?? 70.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: padding ?? const EdgeInsets.fromLTRB(15, 10, 15, 6),
      child: SafeArea(
        bottom: false,
        child: child ?? Container(),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(headerHeight);
}
