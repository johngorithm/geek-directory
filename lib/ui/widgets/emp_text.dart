import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';

class EmphasisText extends StatelessWidget {
  final text;

  EmphasisText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text ?? '',
      style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 20.0,
          color: Palette.textSemiDarkGrey
      ),);
  }
}
