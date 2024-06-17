import 'package:flutter/material.dart';
import 'package:tractian_test/core/utils/het_to_colors.dart';

abstract class AppStyleColors {
  static const Color brandPrimaryDefault = Color(0xFF2188FF);
  static const Color brandPrimaryLight = Color(0xFF63A9FF);
  static const Color brandPrimaryDark = Color(0xFF005BB5);

  static const Color brandSecondaryDefault = Color(0xFFFF5722);
  static const Color brandSecondaryLight = Color(0xFFFF8A50);
  static const Color brandSecondaryDark = Color(0xFFC41C00);
  static const Color error = Color(0xFFD32F2F);
  static const Color errorLight = Color(0xFFFF6659);
  static const Color errorDark = Color(0xFF9A0007);
  static const Color backgroundColorLight = Color(0xFFFFFFFF);
  static const Color backgroundColorDark = Color(0xFF121212);
  static const Color surfaceLight = Color(0xFFF1F1F1);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color onPrimaryLight = Color(0xFFFFFFFF);
  static const Color onPrimaryDark = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  //Neutral Colors
  static final Color white = HexToColor.toColor('#FFFFFF');
  static final Color gray100 = HexToColor.toColor('#EAEFF3');
  static final Color gray200 = HexToColor.toColor('#D8DFE6');
  static final Color gray500 = HexToColor.toColor('#8E98A3');

  //Shapes
  static final Color platformHeader = HexToColor.toColor('#17192D');
  static final Color divider = HexToColor.toColor('#EAEEF2');

  //Writing
  static final Color bodyText2 = HexToColor.toColor('#77818C');

  //Blue
  static final Color blue4 = HexToColor.toColor('#2188FF');

  //Red
  static final Color red = HexToColor.toColor('#ED3833');

  //Green
  static final Color green = HexToColor.toColor('#52C41A');
}
