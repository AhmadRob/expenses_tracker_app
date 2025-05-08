import 'package:flutter/material.dart';

import 'Colors/app_colors.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: PrimaryColors.primaryPaige,
    primary: PrimaryColors.primaryBlue,
    secondary: PrimaryColors.primaryGreen,
    tertiary: PrimaryColors.lightPurple,
    inversePrimary: PrimaryColors.veryLightPurple,
    inverseSurface: PrimaryColors.darkGrey,
  ),
);