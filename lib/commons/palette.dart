
import 'package:flutter/material.dart';

class Palette {

  static const primary = secondary;
  static const secondary = Color(0xFFFF5733);

  static const darkModeForeground = Color(0xFF172442);
  static const darkModelBackground = Color(0xFF131A29);


  static const accentColor = Colors.lightBlue;
  static const white = Colors.white;
  static const black = Colors.black;
  static const transparent = Colors.transparent;
  static const secondaryLight = Colors.blueAccent;
  static const lightShadowGrey =  Color.fromRGBO(0, 0, 0, 0.05);
  static const lighterShadowGrey =  Color.fromRGBO(0, 0, 0, 0.03);

  /// Text colors
  static const semiLightGrey = Color(0xFFBDBDBD);
  static const semiDarkGrey = Color(0xFF4F4F4F);
  static const hintLightGrey = Color(0xFFE0E0E0);
  static const textSemiDarkGrey = Color(0xFF828282);
  static const borderLightGrey = Color(0xFFF5F5F5);
  static const largeTextDarkGrey = Color(0xFF333333);
  static const lightGrey858585 = Color(0xFF858585);

  /// Background
  static const backgroundLightGrey = Color(0xFFF9F9F9);
  static const backgroundGrey = Color(0xFFF5F5F5);
  static const backgroundLightSecondary = Color(0xFF56CCF2);

  static const appGradient = LinearGradient(
      colors: [Palette.primary, Palette.secondary],
      stops: [0.5, 1.0],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft
  );
  static const elevatedShadow = Color(0xFFEFEFEF);

  static const buttonShadow = BoxShadow(
    color: lightShadowGrey,
    offset: Offset(0, 2.0),
    blurRadius: 2.0,
  );

  static const imageBorderShadow = BoxShadow(
    color: lightShadowGrey,
    offset: Offset(0, 2.0),
    blurRadius: 4.0,
    spreadRadius: 2
  );
}