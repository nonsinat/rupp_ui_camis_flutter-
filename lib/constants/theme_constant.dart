// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';

class ThemeConstant {
  static const List<String> fontFamilyFallback = [
    'Manrope',
  ];

  //Light Theme
  static final light = ThemeData(
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: Colors.white,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFEE3436),
      onPrimary: Color(0xFFFFCC00),
      secondary: Color(0xFFE2E2E5),
      onSecondary: Color(0xFF2278F8),
      error: Color(0xFFEF604D),
      onError: Color(0xFFD64F3D),
      background: Colors.white,
      onBackground: Colors.white,
      surface: Color(0xFF10CF7C),
      onSurface: Color(0xFFFF7172),
    ),
    brightness: Brightness.light,
  );

  //Dark Theme
  static final dark = ThemeData(
    scaffoldBackgroundColor: Color(0xFF000000),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: Colors.black,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF3A3A3C),
      onPrimary: Color(0xFFFFBCBD),
      secondary: Color(0xFF6B7588),
      onSecondary: Color(0xFF1C67D7),
      error: Color(0xFFBC2B2D),
      onError: Color(0xFFDCB51A),
      background: Colors.black,
      onBackground: Colors.black,
      surface: Color(0xFF05A660),
      onSurface: Color(0xFFFF7172),
    ),
    brightness: Brightness.dark,
  );

  static const ColorScheme lightScheme = ColorScheme(
    primary: Color(0xFFD30101),
    primaryVariant: Color(0xFF990000),
    secondary: Color(0xFF8B9299),
    secondaryVariant: Color(0xFFBFBFBF),
    background: Color(0xFF161F28),
    surface: Color(0xFF172634),
    error: Color(0xFFB00020),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onBackground: Color(0xFFFFFFFF),
    onSurface: Color(0xFFFFFFFF),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  static TextTheme get textTheme {
    return TextTheme(
      // displayLarge: TextStyle(
      //   fontSize: 48,
      //   fontWeight: FontWeight.w100,
      //     height: 1.3,
      // fontFamilyFallback: fontFamilyFallback,
      // ),
      // displayMedium: TextStyle(
      //   fontSize: 40,
      //   fontWeight: FontWeight.w200,
      // height: 1.3,
      //   fontFamilyFallback: fontFamilyFallback,
      // ),
      headline1: TextStyle(
        fontSize: 44,
        fontWeight: FontWeight.bold,
       height: 1.3,
        fontFamilyFallback: fontFamilyFallback,
      ),
      headline2: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        height: 1.3,
        fontFamilyFallback: fontFamilyFallback,
      ),
      headline3: TextStyle(
        fontSize: 28,height: 1.3,
        fontWeight: FontWeight.bold,
        fontFamilyFallback: fontFamilyFallback,
      ),
      headline4: TextStyle(
        fontSize: 24,height: 1.3,
        fontWeight: FontWeight.bold,
        fontFamilyFallback: fontFamilyFallback,
      ),
      headline5: TextStyle(
        fontSize: 20,height: 1.3,
        fontWeight: FontWeight.bold,
        fontFamilyFallback: fontFamilyFallback,
      ),
      headline6: TextStyle(
        fontSize: 16,height: 1.3,
        fontWeight: FontWeight.bold,
        fontFamilyFallback: fontFamilyFallback,
      ),
      subtitle1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        fontFamilyFallback: fontFamilyFallback,
      ),
      subtitle2: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        fontFamilyFallback: fontFamilyFallback,
      ),
      bodyText1: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
      
        height: 1.7,
        fontFamilyFallback: fontFamilyFallback,
      ),
      bodyText2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        height: 1.7,
        fontFamilyFallback: fontFamilyFallback,
      ),
      button: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        height: 1.7,
        fontFamilyFallback: fontFamilyFallback,
      ),
      caption: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
       height: 1.7,
        fontFamilyFallback: fontFamilyFallback,
      ),
      overline: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.7,
        fontFamilyFallback: fontFamilyFallback,
      ),
    ).apply(
      displayColor: lightScheme.onSurface,
      bodyColor: lightScheme.onSurface,
      decorationColor: lightScheme.onSurface,
    );
  }
}
