import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/styles.dart';

class DetailCell extends StatelessWidget {
  final String field;
  final String value;

  DetailCell({this.field, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 20.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              field,
              style: Styles.kDetailFieldTextStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: Styles.kDetailValueTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
