import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';

class ActionText extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  ActionText({@required this.onTap, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6),
          child: Text(
            '$text',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Palette.primary,
            ),
          ),
        ),
      ),
    );
  }
}
