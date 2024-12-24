import 'dart:core';

import 'package:flutter/material.dart';

String getHexColor(Color color) {
  String hexRed = color.red.toRadixString(16).padLeft(2, '0');
  String hexGreen = color.green.toRadixString(16).padLeft(2, '0');
  String hexBlue = color.blue.toRadixString(16).padLeft(2, '0');

  String hexColor = hexRed + hexGreen + hexBlue;
  return hexColor;
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    print('hexColor: $hexColorString');
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
