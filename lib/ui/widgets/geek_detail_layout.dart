
import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/constants.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/models/geek_detail.dart';
import 'package:geekdirectory/ui/widgets/bio_widget.dart';
import 'package:geekdirectory/ui/widgets/detail_cell.dart';
import 'package:geekdirectory/ui/widgets/image_caption_widget.dart';
import 'package:geekdirectory/ui/widgets/item_card.dart';
import 'package:geekdirectory/ui/widgets/repo_gist_widget.dart';
import 'package:geekdirectory/ui/widgets/social_metrics_widget.dart';

class GeekDetailLayout extends StatelessWidget {
  final GeekDetail data;

  GeekDetailLayout(this.data);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 0, bottom: 130.0, right: 0, left: 0),
      children: <Widget>[
        Container(
          height: 180.0,
          padding: EdgeInsets.only(top: 35.0),
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/for_geek_directory2.jpg',
              ),
            ),
          ),
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                height: 100.0,
                left: 30.0,
                right: 30.0,
                bottom: -45.0,
                child: Container(
                  padding: EdgeInsets.only(right: 15.0),
                  decoration: BoxDecoration(
                      color: Palette.primary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x25000000),
                          blurRadius: 10.0,
                          spreadRadius: 6,
                          offset: Offset(0, 5.0),
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SocialMetricsCard(
                        value: '${data.followersCount}',
                        field: 'Follower',
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      SocialMetricsCard(
                        value: '${data.followingCount}',
                        field: 'Following',
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 40.0,
                bottom: -30.0,
                child: GeekImageWidget(
                  username: data.username,
                  imageUrl: data.avatarUrl,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 70.0,
        ),
        /**
         * End of top user caption.
         * Beginning of user details
         */
        ItemsCard(
          margin: EdgeInsets.only(left: 15.0, right: 15.0),
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: <Widget>[
              DetailCell(
                field: 'Name',
                value: data.name ?? Constants.kNotProvided,
              ),
              Constants.kPrimaryDivider,
              DetailCell(
                field: 'Company',
                value: data.company ?? Constants.kNotProvided,
              ),
              Constants.kPrimaryDivider,
              DetailCell(
                field: 'Location',
                value: data.location ?? Constants.kNotProvided,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        /**
         * End of Details.
         * Beginning of repoGist data.
         */
        RepoGistWidget(
          repoCount: '${data.publicRepoCount}',
          gistCount: '${data.publicGistCount}',
        ),
        SizedBox(
          height: 15,
        ),
        /**
         * End of user repoGist.
         * Beginning of bio.
         */
        BioWidget(bio: data.bio),
      ],
    );
  }
}
