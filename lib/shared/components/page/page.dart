import 'package:flutter/material.dart';
import 'package:taskforme/shared/components/blur/blur_background.dart';
import 'package:taskforme/shared/components/circle/background_circle.dart';

class AppPage extends StatelessWidget {
  final PreferredSizeWidget? header;
  final List<BackgroundCircle>? circles;
  final Color? blurBackgroundColor;
  final Color? backgroundColor;
  final double? blur;
  final Widget body;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics scrollPhysics;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Widget? bottomBar;

  AppPage({
    super.key,
    this.header,
    this.circles,
    this.backgroundColor,
    this.blur,
    this.blurBackgroundColor,
    Widget? body,
    this.padding,
    ScrollPhysics? scrollPhysics,
    bool? extendBody,
    bool? extendBodyBehindAppBar,
    this.bottomBar,
  })  : body = body ?? Container(),
        scrollPhysics = scrollPhysics ??
            const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        extendBody = extendBody ?? false,
        extendBodyBehindAppBar = extendBodyBehindAppBar ?? false;

  @override
  Widget build(BuildContext context) {
    return BlurBackground(
      circles: circles,
      blur: blur,
      backgroundColor: blurBackgroundColor,
      scaffold: Scaffold(
        backgroundColor: backgroundColor ?? Colors.transparent,
        appBar: header,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (_, constraints) {
              return SingleChildScrollView(
                physics: scrollPhysics,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: padding ?? EdgeInsets.zero,
                    child: body,
                  ),
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: bottomBar,
      ),
    );
  }
}
