import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tractian_test/settings/style/app_style_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Roboto',
    useMaterial3: true,
    scaffoldBackgroundColor: AppStyleColors.backgroundColorLight,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppStyleColors.blueDark,
      actionsIconTheme:
          const IconThemeData(color: AppStyleColors.onPrimaryLight),
      iconTheme: const IconThemeData(color: AppStyleColors.onPrimaryLight),
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppStyleColors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppStyleColors.brandPrimaryDefault,
      onPrimary: AppStyleColors.onPrimaryLight,
      secondary: AppStyleColors.brandSecondaryDefault,
      onSecondary: AppStyleColors.onPrimaryLight,
      error: AppStyleColors.error,
      onError: AppStyleColors.onPrimaryLight,
      background: AppStyleColors.backgroundColorLight,
      onBackground: AppStyleColors.onPrimaryLight,
      surface: AppStyleColors.surfaceLight,
      onSurface: AppStyleColors.onPrimaryLight,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Roboto',
    useMaterial3: true,
    scaffoldBackgroundColor: AppStyleColors.backgroundColorDark,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppStyleColors.transparent,
      actionsIconTheme:
          const IconThemeData(color: AppStyleColors.onPrimaryDark),
      iconTheme: const IconThemeData(color: AppStyleColors.onPrimaryDark),
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppStyleColors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppStyleColors.brandPrimaryDefault,
      onPrimary: AppStyleColors.onPrimaryDark,
      secondary: AppStyleColors.brandSecondaryDefault,
      onSecondary: AppStyleColors.onPrimaryDark,
      error: AppStyleColors.error,
      onError: AppStyleColors.onPrimaryDark,
      background: AppStyleColors.backgroundColorDark,
      onBackground: AppStyleColors.onPrimaryDark,
      surface: AppStyleColors.surfaceDark,
      onSurface: AppStyleColors.onPrimaryDark,
    ),
  );
}
