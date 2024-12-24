import 'package:flutter/material.dart';
import 'package:taskforme/domain/entities/label.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';
import 'package:taskforme/shared/resources/theme/hex_color.dart';
import 'package:taskforme/shared/resources/theme/set_text_color.dart';

class LabelCard extends StatelessWidget {
  final Label label;
  final bool? selected;
  final ValueChanged<Label>? selectedLabel;

  const LabelCard(
      {super.key, required this.label, this.selected, this.selectedLabel});

  @override
  Widget build(BuildContext context) {
    final height = screenHeight(context);
    return ListTile(
      onTap: () {
        selectedLabel?.call(label);
      },
      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      leading: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: HexColor.fromHex(label.color!),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      tileColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              "${label.name}",
              style: TextStyle(
                fontSize: height / 45,
                color: setTextColor(HexColor.fromHex(label.color!)),
              ),
            ),
          ),
          Visibility(
            visible: selected ?? false,
            child: const Icon(Icons.check_rounded),
          ),
        ],
      ),
      // subtitle: label.description != null
      //     ? Text(
      //         "${label.description}",
      //         style: TextStyle(
      //           fontWeight: FontWeight.w300,
      //           color: setTextColor(HexColor.fromHex(label.color!)),
      //         ),
      //       )
      //     : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      trailing: IconButton(
        visualDensity: VisualDensity.compact,
        icon: const Icon(Icons.edit),
        color: setTextColor(HexColor.fromHex(label.color!)),
        onPressed: () {},
      ),
    );
  }
}
