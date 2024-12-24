import 'dart:math' as math;

import 'package:flutter/material.dart';

Color setTextColor(Color backgroundColor) {
  // Convert the background color to HSV format (alternative approach)
  final red = backgroundColor.red / 255;
  final green = backgroundColor.green / 255;
  final blue = backgroundColor.blue / 255;

  final maxColor = math.max(red, math.max(green, blue));
  final minColor = math.min(red, math.min(green, blue));

  // Calculate hue
  final delta = maxColor - minColor;
  var hue = 0.0;
  if (delta == 0) {
    hue = 0.0; // Achromatic case
  } else if (maxColor == red) {
    hue = (green - blue) / delta + (green < blue ? 6 : 0);
  } else if (maxColor == green) {
    hue = (blue - red) / delta + 2;
  } else {
    hue = (red - green) / delta + 4;
  }

  hue = hue % 6;

  // Calculate lightness
  final lightness = (maxColor + minColor) / 2;

  // Determine text color based on lightness
  return lightness < 0.5 ? Colors.white : Colors.black;
}
