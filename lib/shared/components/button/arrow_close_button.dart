import 'package:flutter/material.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';

class ArrowCloseButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const ArrowCloseButton({super.key, this.onPressed});

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
        Icons.arrow_back_ios_new_rounded,
        size: 28,
      ),
    );
  }
}
