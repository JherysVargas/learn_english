import 'package:flutter/material.dart';
import 'package:learn_english_flutter/core/theme/colors.dart';

class AppTheme {
  static final ThemeData theme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      primary: ColorsApp.primary,
      seedColor: ColorsApp.primary,
      secondary: ColorsApp.secondary,
      tertiary: ColorsApp.tertiary,
    ),
  );
}
