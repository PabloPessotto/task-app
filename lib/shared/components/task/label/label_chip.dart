import 'package:flutter/material.dart';
import 'package:taskforme/domain/entities/label.dart';
import 'package:taskforme/shared/resources/theme/hex_color.dart';
import 'package:taskforme/shared/resources/theme/set_text_color.dart';

class LabelChip extends StatelessWidget {
  final Label label;
  const LabelChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Chip(
        label: Text("${label.name}"),
        visualDensity: VisualDensity.compact,
        backgroundColor: HexColor.fromHex(label.color!),
        side: BorderSide.none,
        labelPadding: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        labelStyle: TextStyle(
          color: setTextColor(
            HexColor.fromHex(label.color!),
          ),
        ),
      ),
    );
  }
}
