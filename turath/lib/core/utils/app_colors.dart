import 'package:flutter/material.dart';

abstract class AppColors {
  //Primary Colors
  static Color primaryColor = const Color.fromARGB(255, 200, 135, 107);
  static Color secondaryColor = const Color.fromARGB(255, 237, 228, 221);
  static Color accentColor = const Color(0xffEF6969);

  // Text Colors
  static Color textColorPrimary = const Color.fromARGB(255, 237, 228, 221);
  static Color textColorSecondary = const Color.fromARGB(255, 200, 135, 107);
  static Color textColorHint = const Color(0xffC4C4C4);

  // Background Colors
  static Color bgColor = const Color.fromARGB(255, 25, 25, 25);

  static LinearGradient cardBgColor = const LinearGradient(
    colors: [
      Color.fromARGB(255, 43, 42, 42),
      Color.fromARGB(255, 129, 127, 127)
    ],
    begin: Alignment.centerLeft,
    end: Alignment.topRight,
  );

  // Helper Colors
  static Color successColor = const Color(0xff4CAF50);
  static Color errorColor = const Color(0xffF44336);
  static Color warningColor = const Color(0xffFF9800);

  // Border Colors
  static Color borderColor = const Color(0xffE0E0E0);
  static Color dividerColor = const Color(0xffBDBDBD);
}
