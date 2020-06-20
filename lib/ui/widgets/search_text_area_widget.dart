import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;


  SearchTextField({this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.backgroundLightGrey,
        borderRadius: BorderRadius.circular(25.0),
      ),
      margin: EdgeInsets.only(left: 10, right: 20),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            size: 25.0,
            color: Palette.primary,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 20, top: 15, bottom: 12),
          hintText: hintText,
          hintMaxLines: 1,
          hintStyle: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}
