import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static FlexScheme get _scheme => FlexScheme.outerSpace;
  static FlexAppBarStyle get _appBarStyle => FlexAppBarStyle.scaffoldBackground;
  static Color get _surfaceTint => Colors.transparent;
  static String get _fontFamily => "Handlee";


  static ThemeData get lightThemeData => FlexColorScheme.light(
    scheme: _scheme,
    useMaterial3: true,
    appBarStyle: _appBarStyle,
    surfaceTint: _surfaceTint,
    fontFamily: _fontFamily,
  ).toTheme;

  static ThemeData get darkThemeData => FlexColorScheme.dark(
    scheme: _scheme,
    useMaterial3: true,
    appBarStyle: _appBarStyle,
    surfaceTint: _surfaceTint,
    fontFamily: _fontFamily,

  ).toTheme;

}