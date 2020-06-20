
import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';

class ParagraphTextWidget extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color color;
  final double fontSize;

  ParagraphTextWidget(this.text,
      {this.textAlign = TextAlign.center,
        this.color = Palette.lightGrey858585,
        this.fontSize = 15.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
          color: color,
        ),
      ),
    );
  }
}

