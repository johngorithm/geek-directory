import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';


class Styles {
  static const kDetailValueTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16.0,
  );

  static const kDetailFieldTextStyle = TextStyle(
    color: Palette.secondaryLight,
    fontSize: 16.0,
  );

  static const kPrimaryDivider = Divider(
    height: 1.0,
    color: Palette.secondaryLight,
  );

  static const kCardBoxShadow = [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 2.0,
      spreadRadius: 2.0,
      offset: Offset(0, 2.0),
    ),
  ];
}
