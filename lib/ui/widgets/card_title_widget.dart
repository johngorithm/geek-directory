import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String title;

  CardTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${title?.toUpperCase()}',
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
