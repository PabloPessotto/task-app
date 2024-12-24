import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskforme/shared/resources/theme/app_color.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Nunito Sans',
  colorSchemeSeed: Colors.blue[900],
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    // backgroundColor: Color(0xFFF3F3F3),
    backgroundColor: AppColor.white98,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
  // scaffoldBackgroundColor: const Color(0xFFF3F3F3),
  scaffoldBackgroundColor: AppColor.white98,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    errorStyle: const TextStyle(
      height: .0,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.red[900]!,
        width: 1.5,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.red[900]!,
        width: 1.5,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue[900],
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.blue[900],
      backgroundColor: Colors.transparent,
      side: BorderSide(
        color: Colors.blue[900]!,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  ),
  cardTheme: CardTheme(
    clipBehavior: Clip.antiAlias,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    shape: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(12),
    ),
    insetPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  ),
  searchBarTheme: SearchBarThemeData(
    backgroundColor: MaterialStateProperty.resolveWith(
      (states) => const Color(0xFFF3F3F3),
    ),
  ),
);
