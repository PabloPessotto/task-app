import 'package:flutter/material.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';

class XCloseButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const XCloseButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: Colors.grey[350],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed ?? closeView,
      icon: const Icon(
        Icons.close_rounded,
        size: 28,
      ),
    );
  }
}
