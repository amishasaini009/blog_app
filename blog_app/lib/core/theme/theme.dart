import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static _border([Color color=AppPallete.borderColor])  => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static final darkThemeMode= ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    chipTheme: ChipThemeData(
      color: WidgetStatePropertyAll(AppPallete.backgroundColor),
      side:BorderSide.none,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: _border(),
      errorBorder: _border(AppPallete.errorColor),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient2),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppPallete.backgroundColor,
    ),
  );

}