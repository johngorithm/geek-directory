import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/constants.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/ui/widgets/item_card.dart';

class BioWidget extends StatelessWidget {
  final String bio;

  BioWidget({this.bio});

  @override
  Widget build(BuildContext context) {
    return ItemsCard(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'BIO',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            bio != null ? bio.trim() : Constants.kNotProvided,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14.0,
              color: Palette.textSemiDarkGrey,
            ),
          )
        ],
      ),
    );
  }
}
