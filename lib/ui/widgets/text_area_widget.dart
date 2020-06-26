
import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';


class TextAreaWidget extends StatelessWidget {
  final String hintText;
  final String label;
  final double marginBottom;
  final TextInputType inputType;
  final TextEditingController controller;
  final double horizontalMargin;
  final FocusNode focusNode;
  final bool obscureText;

  TextAreaWidget(
      {@required this.controller,
        this.horizontalMargin = 20.0,
        this.hintText,
        this.obscureText = false,
        @required this.label,
        this.marginBottom, this.focusNode,
        this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: horizontalMargin,
          right: horizontalMargin,
          bottom: marginBottom ?? 0),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Palette.primary),
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: EdgeInsets.only(top: 9, bottom: 5),
            child: TextField(
              controller: controller,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
              focusNode: focusNode,
              textAlignVertical: TextAlignVertical.top,
              keyboardType: inputType,
              obscureText: obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10, top: 12, bottom: 12),
                hintText: hintText ?? 'Enter $label',
                hintMaxLines: 1,
                hintStyle: TextStyle(
                  color: Palette.hintLightGrey,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.only(left: 20),
            child: Text(
              label?.toUpperCase() ?? "",
              style: TextStyle(fontSize: 11.0, color: Palette.primary),
            ),
          )
        ],
      ),
    );
  }
}
