
import 'package:flutter/material.dart';

class Palette {

  static const primary = Color(0xFF2D239F);
  static const secondary = Color(0xFF313EBB);
  static const accentColor = Colors.lightBlue;
  static const white = Colors.white;
  static const black = Colors.black;
  static const transparent = Colors.transparent;
  static const secondaryLight = Colors.blueAccent;

  /// Text colors
  static const semiLightGrey = Color(0xFFBDBDBD);
  static const semiDarkGrey = Color(0xFF4F4F4F);
  static const hintLightGrey = Color(0xFFE0E0E0);
  static const textSemiDarkGrey = Color(0xFF828282);
  static const borderLightGrey = Color(0xFFF5F5F5);
  static const largeTextDarkGrey = Color(0xFF333333);
  static const lightGrey858585 = Color(0xFF858585);

  static const appGradient = LinearGradient(
      colors: [Palette.primary, Palette.secondary],
      stops: [0.5, 1.0],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft
  );
}