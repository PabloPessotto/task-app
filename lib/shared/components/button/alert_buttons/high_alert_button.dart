import 'package:flutter/material.dart';

class HighAlertButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? label;
  const HighAlertButton({super.key, this.onTap, this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
      child: Text(
        "$label",
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
