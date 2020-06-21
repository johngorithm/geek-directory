import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/models/geek_detail.dart';
import 'package:geekdirectory/ui/widgets/social_metrics_widget.dart';

import 'image_caption_widget.dart';

class FavCard extends StatelessWidget {
  final GeekDetail geekDetail;

  FavCard(this.geekDetail);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
          color: Palette.white, borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ImageCaptionWidget(
              username: geekDetail.username,
              imageUrl: geekDetail.avatarUrl,
              imageSize: 70.0,
              textStyle: TextStyle(
                color: Palette.black,
                fontSize: 15.0,
              ),
            ),
          ),
          SocialMetricsCard(
            value: '${geekDetail.followersCount}',
            field: 'Followers',
            fieldStyle: TextStyle(color: Palette.textSemiDarkGrey),
          ),
          SizedBox(
            width: 10.0,
          ),
          SocialMetricsCard(
            value: '${geekDetail.followingCount}',
            field: 'Following',
            fieldStyle: TextStyle(color: Palette.textSemiDarkGrey),
          )
        ],
      ),
    );
  }
}
