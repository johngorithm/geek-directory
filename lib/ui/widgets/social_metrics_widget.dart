import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';

class SocialMetricsCard extends StatelessWidget {
  final String value;
  final String field;

  SocialMetricsCard({this.value, this.field});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            value,
            style: TextStyle(
              fontSize: 27.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            field,
            style: TextStyle(
              fontSize: 14.0,
              color: Palette.secondaryLight,
            ),
          )
        ],
      ),
    );
  }
}
