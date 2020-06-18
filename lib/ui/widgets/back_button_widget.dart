import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';

class BackBtn extends StatelessWidget {
  final Function onPress;

  BackBtn({this.onPress});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15.0,
      left: 15.0,
      child: GestureDetector(
        onTap: onPress,
        child: Icon(
          Icons.arrow_back,
          color: Palette.primary,
          size: 33.0,
        ),
      ),
    );
  }
}

