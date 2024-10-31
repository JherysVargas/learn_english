import 'package:flutter/material.dart';

class ColorsApp {
  static const int _primary = 0xFFF9EB2A;
  static const int _secondary = 0xFF924FF2;

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
}
