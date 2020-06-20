
import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';

class BrandName extends StatelessWidget {
  final String name;
  final double fontSize;

  BrandName(this.name, {this.fontSize = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Text(
        name,
        style: TextStyle(
          color: Palette.secondary,
          fontWeight: FontWeight.w300,
          fontSize: fontSize,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

