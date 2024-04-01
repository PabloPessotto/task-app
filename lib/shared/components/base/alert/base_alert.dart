import 'package:flutter/material.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';

class BaseAlert extends StatelessWidget {
  final Color color;
  final List<Widget>? functions;
  final String? title;
  final String? message;
  final bool showCloseButton;
  final Widget? content;

  const BaseAlert(
      {super.key,
      required this.color,
      this.functions,
      this.title,
      this.message,
      bool? showCloseButton,
      this.content})
      : showCloseButton = showCloseButton ?? false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      titlePadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      surfaceTintColor: color.withOpacity(0.1),
      backgroundColor: Colors.white,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 21.0,
      ),
      contentTextStyle: const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 16.5,
        color: Colors.black,
      ),
      title: Container(
        padding: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: color,
              width: 15,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "$title",
                  softWrap: true,
                  maxLines: null,
                ),
              ),
              Visibility(
                visible: showCloseButton,
                child: IconButton(
                  onPressed: closeView,
                  icon: const Icon(Icons.clear_rounded),
                  color: Colors.grey[400],
                  visualDensity: VisualDensity.compact,
                ),
              )
            ],
          ),
        ),
      ),
      content: content ?? Text('$message'),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      actions: functions,
    );
  }
}
