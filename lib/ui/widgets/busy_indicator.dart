import 'package:flutter/material.dart';


class BusyIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      width: 30.0,
      child: CircularProgressIndicator(),
    );
  }
}
