import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/constants.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/commons/styles.dart';
import 'package:geekdirectory/ui/widgets/item_card.dart';

class BioWidget extends StatelessWidget {
  final String bio;

  BioWidget({this.bio});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ItemsCard(
        margin: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'Bio',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Palette.secondaryLight,
                  fontSize: 20.0,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                bio != null ? bio.trim() : Constants.kNotProvided,
                textAlign: TextAlign.left,
                style: Styles.kDetailValueTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
