import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';

class SocialMetricsCard extends StatelessWidget {
  final String value;
  final String field;
  final TextStyle valueStyle;
  final TextStyle fieldStyle;

  SocialMetricsCard({this.value, this.field, this.valueStyle, this.fieldStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            value,
            style: valueStyle ??
                TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                  color: Palette.black,
                ),
          ),
          Text(
            field,
            style: fieldStyle ??
                TextStyle(
                  fontSize: 14.0,
                  color: Palette.textSemiDarkGrey,
                ),
          )
        ],
      ),
    );
  }
}
