import 'package:flutter/material.dart';

class ErrorTextWidget extends StatefulWidget {
  final String errorMessage;
  final double sidePadding;
  final double fontSize;

  ErrorTextWidget(this.errorMessage, {this.sidePadding = 20.0, this.fontSize = 12.0});

  @override
  _ErrorTextWidgetState createState() => _ErrorTextWidgetState();
}

class _ErrorTextWidgetState extends State<ErrorTextWidget> {
  double _opacity = 0;

  @override
  void initState() {
    animate();
    super.initState();
  }

  void animate() async {
    await Future.delayed(Duration.zero);
    setState(() {
      _opacity = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 200),
      opacity: _opacity,
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(horizontal: widget.sidePadding),
        child: Text(
          widget.errorMessage,
          style: TextStyle(
            color: Colors.deepOrange,
            fontSize: widget.fontSize,
          ),
        ),
      ),
    );
  }
}

