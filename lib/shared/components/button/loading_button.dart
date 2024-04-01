import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String? label;
  const LoadingButton({super.key, this.onPressed, bool? isLoading, this.label})
      : isLoading = isLoading ?? false;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue[900],
            shape: BoxShape.circle,
          ),
          child: SizedBox(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(
              strokeWidth: 3.5,
              color: Colors.white,
              backgroundColor: Colors.blue[100],
            ),
          ),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        child: Text('$label'),
      );
    }
  }
}
