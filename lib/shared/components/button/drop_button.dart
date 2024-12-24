import 'package:flutter/material.dart';
import 'package:taskforme/shared/components/status/color_status.dart';
import 'package:taskforme/shared/components/status/status_name.dart';
import 'package:taskforme/shared/resources/theme/set_text_color.dart';

class DropButton extends StatelessWidget {
  final String? value;
  final ValueChanged<String?>? onChanged;
  final List<String> items;
  final Widget? hint;
  final Icon? icon;
  final Decoration? itemDecoration;
  final bool? isExpanded;

  const DropButton(
      {super.key,
      this.value,
      this.onChanged,
      required this.items,
      this.hint,
      this.icon,
      this.itemDecoration,
      this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Visibility(
            visible: icon != null,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12,
                top: 10,
                bottom: 0,
              ),
              child: icon,
            ),
          ),
          Flexible(
            child: DropdownButton<String>(
              hint: hint,
              value: value,
              underline: Container(),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              onChanged: onChanged,
              isExpanded: isExpanded ?? false,
              items: items.map((e) {
                return DropdownMenuItem<String>(
                  value: e,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: statusColor(status(e)),
                    ),
                    child: Text(
                      e,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                        color: setTextColor(statusColor(status(e))),
                      ),
                    ),
                  ),
                );
              }).toList(),
              borderRadius: BorderRadius.circular(12),
              selectedItemBuilder: (context) => items.map((e) {
                return Container(
                  alignment: Alignment.centerLeft,
                  decoration: itemDecoration,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    e,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                      color: setTextColor(statusColor(status(e))),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
