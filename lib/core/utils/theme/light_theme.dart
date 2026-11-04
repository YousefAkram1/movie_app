import 'package:flutter/material.dart';

import '../values/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.primary,
  fontFamily: "Poppins",
  brightness: Brightness.dark,

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      elevation: WidgetStatePropertyAll(10.0),
      shadowColor: WidgetStatePropertyAll(Colors.black.withValues(alpha: 0.20)),

      backgroundColor: WidgetStatePropertyAll(AppColors.secondary),
    ),
  ),
);
