
import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';

class PrimaryButton extends StatelessWidget {
  final ButtonConfig buttonConfig;
  final double height;
  final EdgeInsets margin;
  final double width;

  PrimaryButton(
      {@required this.buttonConfig,
        this.height = 50.0,
        this.margin,
        this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin ?? EdgeInsets.all(0),
      decoration: BoxDecoration(
        gradient: Palette.appGradient,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: buttonConfig.action,
          borderRadius: BorderRadius.circular(5.0),
          splashColor: Palette.secondary,
          highlightColor: Palette.secondary,
          child: Center(
            child: Text(
              buttonConfig.text?.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 12.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonConfig {
  final String text;
  final VoidCallback action;

  ButtonConfig({@required this.text, @required this.action});
}
