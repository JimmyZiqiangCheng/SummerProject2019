import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color.fromRGBO(168, 195, 192, 1.0);
  static const Color primaryDark = Color.fromRGBO(24, 95, 86, 1.0);
  static const Color primaryTint = Color.fromRGBO(24, 95, 86, 0.1);

// Flat Button Color - active
  static const Color flatButtonActiveBackground = primaryDark;
  static const Color flatButtonActiveText = Colors.white;
// Flat Button Color - inactive
  static const Color flatButtonInactiveBackground = primaryTint;
  static const Color flatButtonInatviceText = primaryDark;

  static const Color accentColor = primaryDark;
  static const MaterialColor primaryColor = MaterialColor(
    _primaryColor,
    <int, Color>{
      300: Color(0xFFccdcda),
      400: Color(0xFFb7cdcb),
      500: Color(_primaryColor),
      600: Color(0xFFbbcac8),
      700: Color(0xFFaab7b6),
    },
  );
  static const int _primaryColor = 0xFFA8C3C0;
}