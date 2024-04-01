import 'package:flutter/material.dart';

class LowAlertButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? label;
  const LowAlertButton({super.key, this.onTap, this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(foregroundColor: Colors.black),
      child: Text(
        "$label",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
