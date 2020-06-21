import 'package:flutter/material.dart';


class BusyIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 100.0),
      child: SizedBox(
        height: 24.0,
        width: 24.0,
        child: CircularProgressIndicator(strokeWidth: 2,),
      ),
    );
  }
}
