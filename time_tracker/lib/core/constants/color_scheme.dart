import 'package:flutter/material.dart';

class AppColorScheme {
  final Color primary;
  final Color blue; // Work
  final Color lightRed; // Play
  final Color softBlue; // Study
  final Color limeGreen; // Exercise
  final Color violet; // Social
  final Color softOrange; // Self-care

  final Color veryDarkBlue;
  final Color darkBlue;
  final Color desaturatedBlue;
  final Color paleBlue;

  AppColorScheme({
    required this.primary,
    required this.blue,
    required this.lightRed,
    required this.softBlue,
    required this.limeGreen,
    required this.violet,
    required this.softOrange,
    required this.veryDarkBlue,
    required this.darkBlue,
    required this.desaturatedBlue,
    required this.paleBlue,
  });



  ColorScheme toColorScheme() {
    return ColorScheme(
      primary: primary,
      secondary: blue,
      background: darkBlue,
      surface: darkBlue,
      brightness: Brightness.light, 
      onBackground: Colors.black, 
      onSurface: Colors.black, 
      onSecondary: blue, 
      error: Colors.red, 
      onError: Colors.red, 
      onPrimary: primary,
    );
  }
}

class AppTheme {
  static final dark = AppColorScheme(
    primary: const HSLColor.fromAHSL(1.0, 246, 0.8, 0.6).toColor(),
    blue: const HSLColor.fromAHSL(1.0, 246, 0.8, 0.6).toColor(),
    lightRed: const HSLColor.fromAHSL(1.0, 15, 1.0, 0.7).toColor(),
    softBlue: const HSLColor.fromAHSL(1.0, 195, 0.74, 0.62).toColor(),
    limeGreen: const HSLColor.fromAHSL(1.0, 145, 0.58, 0.55).toColor(),
    violet: const HSLColor.fromAHSL(1.0, 264, 0.64, 0.52).toColor(),
    softOrange: const HSLColor.fromAHSL(1.0, 43, 0.84, 0.65).toColor(),
    veryDarkBlue: const HSLColor.fromAHSL(1.0, 226, 0.43, 0.1).toColor(),
    darkBlue: const HSLColor.fromAHSL(1.0, 235, 0.46, 0.2).toColor(),
    desaturatedBlue: const HSLColor.fromAHSL(1.0, 235, 0.45, 0.61).toColor(),
    paleBlue: const HSLColor.fromAHSL(1.0, 236, 1.0, 0.87).toColor(),
  );


  static final light = AppColorScheme(
    primary: const HSLColor.fromAHSL(1.0, 246, 0.8, 0.6).toColor(),
    blue: const HSLColor.fromAHSL(1.0, 246, 0.8, 0.6).toColor(),
    lightRed: const HSLColor.fromAHSL(1.0, 15, 1.0, 0.7).toColor(),
    softBlue: const HSLColor.fromAHSL(1.0, 195, 0.74, 0.62).toColor(),
    limeGreen: const HSLColor.fromAHSL(1.0, 145, 0.58, 0.55).toColor(),
    violet: const HSLColor.fromAHSL(1.0, 264, 0.64, 0.52).toColor(),
    softOrange: const HSLColor.fromAHSL(1.0, 43, 0.84, 0.65).toColor(),
    veryDarkBlue: const HSLColor.fromAHSL(1.0, 226, 0.43, 0.1).toColor(),
    darkBlue: const HSLColor.fromAHSL(1.0, 235, 0.46, 0.2).toColor(),
    desaturatedBlue: const HSLColor.fromAHSL(1.0, 235, 0.45, 0.61).toColor(),
    paleBlue: const HSLColor.fromAHSL(1.0, 236, 1.0, 0.87).toColor(),
  );

 
}
