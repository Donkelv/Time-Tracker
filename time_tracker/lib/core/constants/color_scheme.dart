import 'package:flutter/material.dart';

class AppColorScheme {
  final Color primary;
  final Color blue; // Work
  final Color lightRed; // Play
  final Color lightRed2;
  final Color softBlue; // Study
  final Color limeGreen; // Exercise
  final Color violet; // Social
  final Color softOrange; // Self-care

  final Color veryDarkBlue;
  final Color darkBlue;
  final Color desaturatedBlue;
  final Color paleBlue;
  final Color blackColor10;
  final Color neutral;

  AppColorScheme({
    required this.primary,
    required this.blue,
    required this.lightRed,
    required this.lightRed2,
    required this.softBlue,
    required this.limeGreen,
    required this.violet,
    required this.softOrange,
    required this.veryDarkBlue,
    required this.darkBlue,
    required this.desaturatedBlue,
    required this.paleBlue,
    required this.blackColor10,
    required this.neutral,
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
    lightRed2: const HSLColor.fromAHSL(1.0, 348, 1.0, 0.68).toColor(),
    softBlue: const HSLColor.fromAHSL(1.0, 195, 0.74, 0.62).toColor(),
    limeGreen: const HSLColor.fromAHSL(1.0, 145, 0.58, 0.55).toColor(),
    violet: const HSLColor.fromAHSL(1.0, 264, 0.64, 0.52).toColor(),
    softOrange: const HSLColor.fromAHSL(1.0, 43, 0.84, 0.65).toColor(),
    veryDarkBlue: const HSLColor.fromAHSL(1.0, 226, 0.43, 0.1).toColor(),
    darkBlue: const HSLColor.fromAHSL(1.0, 235, 0.46, 0.2).toColor(),
    desaturatedBlue: const HSLColor.fromAHSL(1.0, 235, 0.45, 0.61).toColor(),
    paleBlue: const HSLColor.fromAHSL(1.0, 236, 1.0, 0.87).toColor(),
    blackColor10: const HSLColor.fromAHSL(1.0, 226, 0.43, 0.05).toColor(),
    neutral: Colors.white
  );

  static final light = AppColorScheme(
    primary: const HSLColor.fromAHSL(1.0, 246, 0.8, 0.6).toColor(),
    blue: const HSLColor.fromAHSL(1.0, 246, 0.8, 0.6).toColor(),
    lightRed: const HSLColor.fromAHSL(1.0, 15, 1.0, 0.7).toColor(),
    lightRed2: const HSLColor.fromAHSL(1.0, 348, 1.0, 0.68).toColor(),
    softBlue: const HSLColor.fromAHSL(1.0, 195, 0.74, 0.62).toColor(),
    limeGreen: const HSLColor.fromAHSL(1.0, 145, 0.58, 0.55).toColor(),
    violet: const HSLColor.fromAHSL(1.0, 264, 0.64, 0.52).toColor(),
    softOrange: const HSLColor.fromAHSL(1.0, 43, 0.84, 0.65).toColor(),
    veryDarkBlue:
        Colors.white, //const HSLColor.fromAHSL(1.0, 236, 1.0, 0.87).toColor(),
    darkBlue: const HSLColor.fromAHSL(1.0, 235, 0.46, 0.7).toColor(),
    desaturatedBlue: const HSLColor.fromAHSL(1.0, 235, 0.45, 0.61).toColor(),
    paleBlue:
        Colors.white, //const HSLColor.fromAHSL(1.0, 236, 1.0, 0.87).toColor(),
    blackColor10: const Color(0xFFE7E8EA),
    neutral: const HSLColor.fromAHSL(1.0, 235, 0.46, 0.2).toColor(),
  );

  static Color getColorByName(String colorName, {bool isDarkMode = false}) {
    final AppColorScheme scheme = isDarkMode ? dark : light;

    switch (colorName.toLowerCase()) {
      case 'play':
        return scheme.softBlue;
      case 'work':
        return scheme.lightRed;
      case 'study':
        return scheme.lightRed2;
      case 'exercise':
        return scheme.limeGreen;
      case 'social':
        return scheme.violet;
      case 'self care':
        return scheme.softOrange;

      default:
        throw ArgumentError('Invalid color name: $colorName');
    }
  }
}
