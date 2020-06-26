
import 'package:flutter/material.dart';

class ParagraphTextWidget extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color color;
  final double fontSize;

  ParagraphTextWidget(this.text,
      {this.textAlign = TextAlign.center,
        this.color,
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
          color: color ?? Theme.of(context).textTheme.caption.color,
        ),
      ),
    );
  }
}

