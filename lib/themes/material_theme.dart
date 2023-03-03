import 'package:flutter/material.dart';

ThemeData _themeLight = ThemeData.light();
ThemeData _themeDark = ThemeData.dark();

ThemeData themeDark = _themeDark.copyWith(
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 24,
      letterSpacing: -0.32,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headline2: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 22,
      letterSpacing: -0.32,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline3: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 14,
      letterSpacing: -0.32,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    button: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16,
      letterSpacing: -0.32,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyText1: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 14,
      letterSpacing: -0.32,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 10,
      height: 0.2,
      letterSpacing: -0.32,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  ),
  colorScheme: const ColorScheme.dark(
    background: Colors.black,
    primary: Colors.white,
    scrim: Color(0xffC4C4C4),
    secondary: Color(0xffE6FE52),
    tertiary: Color(0xff74A5AA),
  ),
);

ThemeData themeLight = _themeLight.copyWith(
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 24,
      letterSpacing: -0.32,
      fontWeight: FontWeight.w500,
      color: Color(0xff2B2B2F),
    ),
    headline2: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 22,
      letterSpacing: -0.32,
      fontWeight: FontWeight.w600,
      color: Color(0xff2B2B2F),
    ),
    headline3: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 14,
      letterSpacing: -0.32,
      fontWeight: FontWeight.w700,
      color: Color(0xff2B2B2F),
    ),
    button: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16,
      letterSpacing: -0.32,
      fontWeight: FontWeight.w500,
      color: Color(0xff2B2B2F),
    ),
    bodyText1: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 14,
      letterSpacing: -0.32,
      fontWeight: FontWeight.w500,
      color: Color(0xff2B2B2F),
    ),
    bodyText2: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 10,
      height: 0.2,
      letterSpacing: -0.32,
      fontWeight: FontWeight.w500,
      color: Color(0xff2B2B2F),
    ),
  ),
  colorScheme: const ColorScheme.light(
    background: Color(0xffC4C4C4),
    primary: Colors.white,
    primaryContainer: Color(0xFFE2E2E2),
    scrim: Colors.black,
    secondary: Color(0xffE6FE52),
    tertiary: Color(0xff74A5AA),
    secondaryContainer: Color(0xffEEEEEE),
    shadow: Color(0xff757575),
    surface: Color(0xff9C9C9C),
  ),
);
