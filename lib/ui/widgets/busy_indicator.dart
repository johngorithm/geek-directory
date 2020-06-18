import 'package:flutter/material.dart';


class BusyIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 24.0,
        width: 24.0,
        child: CircularProgressIndicator(strokeWidth: 2,),
      ),
    );
  }
}
