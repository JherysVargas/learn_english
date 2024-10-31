import 'package:flutter/material.dart';
import 'package:memory_cards_flutter/config/colors.dart';

class AppTheme {
  static final ThemeData theme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      primary: ColorsApp.primary,
      seedColor: ColorsApp.primary,
      secondary: ColorsApp.secondary,
    ),
  );
}
