import 'package:flutter/material.dart';

class ColorsApp {
  static const int _primary = 0xFFF9EB2A;
  static const int _secondary = 0xFF924FF2;
  static const int _tertiary = 0xFFD5BFF2;

  static const MaterialColor primary = MaterialColor(_primary, <int, Color>{
    50: Color(0xFFFEFDE6),
    100: Color(0xFFFDF9C2),
    200: Color(0xFFFCF599),
    300: Color(0xFFFAF16F),
    400: Color(0xFFF7EC4C),
    500: Color(_primary),
    600: Color(0xFFF8D822),
    700: Color(0xFFF7C017),
    800: Color(0xFFF7A709),
    900: Color(0xFFF57D00),
  });

  static const MaterialColor secondary = MaterialColor(_secondary, <int, Color>{
    50: Color(0xFFF3EBFE),
    100: Color(0xFFE0CEFD),
    200: Color(0xFFCCACFD),
    300: Color(0xFFB688FC),
    400: Color(0xFFA46AF9),
    500: Color(_secondary),
    600: Color(0xFF8749EB),
    700: Color(0xFF7940E1),
    800: Color(0xFF6C39D8),
    900: Color(0xFF582DCA),
  });

  static const MaterialColor tertiary = MaterialColor(_tertiary, <int, Color>{
    50: Color(0xFFF6F2FC),
    100: Color(0xFFEEE5F9),
    200: Color(0xFFE5D8F7),
    300: Color(0xFFDDCBF4),
    400: Color(_tertiary),
    500: Color(0xFFAA98C1),
    600: Color(0xFF7F7291),
    700: Color(0xFF554C60),
    800: Color(0xFF2A2630),
    900: Color(0xFF000000),
  });
}
