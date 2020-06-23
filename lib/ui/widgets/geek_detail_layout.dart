
import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/constants.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/models/geek_detail.dart';
import 'package:geekdirectory/ui/widgets/bio_widget.dart';
import 'package:geekdirectory/ui/widgets/card_title_widget.dart';
import 'package:geekdirectory/ui/widgets/detail_cell.dart';
import 'package:geekdirectory/ui/widgets/emp_text.dart';
import 'package:geekdirectory/ui/widgets/item_card.dart';
import 'package:geekdirectory/ui/widgets/one_action_top_bar_widgets.dart';
import 'package:geekdirectory/ui/widgets/primary_button.dart';
import 'package:geekdirectory/ui/widgets/repo_gist_widget.dart';
import 'package:geekdirectory/ui/widgets/round_image_widget.dart';
import 'package:geekdirectory/ui/widgets/social_metrics_widget.dart';
import 'package:geekdirectory/view_models/geek_detail_screen_model.dart';
import 'package:provider/provider.dart';

class GeekDetailLayout extends StatelessWidget {
  final GeekDetail data;
  final GeekDetailScreenModel geekDetailModel;

  GeekDetailLayout(this.data, this.geekDetailModel);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 180.0),
          child: ListView(
            padding: EdgeInsets.only(top: 0, bottom: 130.0, right: 0, left: 0),
            children: <Widget>[
              SizedBox(height: 45.0),
              socialMetricsLayout,
              infoLayout,
              repoGistLayout,
              bioLayout,
              ctaLayout,
            ],
          ),
        ),

        headerLayout
      ],
    );
  }

  Widget get ctaLayout => Container(
    margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
    child: Row(
      children: <Widget>[
        Expanded(
          child: PrimaryButton(
            width: null,
            buttonConfig: ButtonConfig(
              text: 'VIEW ON GITHUB',
              action: () {}
            ),
          ),
        ),
        SizedBox(width: 10.0,),
        Expanded(
          child: PrimaryButton(
            width: null,
            buttonConfig: ButtonConfig(
                text: 'SHARE',
                action: () {
                  geekDetailModel.shareGeekProfile(data.username);
                }
            ),
          ),
        )
      ],
    ),
  );

  Widget get bioLayout => BioWidget(bio: data.bio);

  Widget get socialMetricsLayout {
    return ItemsCard(
      margin: EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SocialMetricsCard(
            field: 'Followers',
            value: '${data.followersCount}',
          ),
          SocialMetricsCard(
              field: 'Following',
              value: '${data.followingCount}'
          )
        ],
      ),
    );
  }

  Widget get headerLayout {
    return Container(
        height: 180.0,
        padding: EdgeInsets.only(top: 35.0),
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/geek_banner.jpg',
            ),
          ),
        ),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            left: 10.0,
            bottom: -30.0,
            right: 10,
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  RoundImage(data.avatarUrl),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 95.0,
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Palette.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                        boxShadow: [Palette.imageBorderShadow]
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                CardTitle('${data.name ?? 'username'}'),
                                SizedBox(height: 5.0,),
                                EmphasisText('@${data.username}')
                              ],
                            ),
                          ),

                          Selector<GeekDetailScreenModel, bool>(
                            selector: (_, model) => model.isFavorited,
                            builder: (context, data, child) {
                              IconData iconData = Icons.favorite_border;
                              if (data) {
                                iconData = Icons.favorite;
                              }
                              return IconButton(
                                splashColor: Palette.secondary,
                                icon: Icon(
                                  iconData,
                                  color: Palette.primary,
                                ),
                                onPressed: geekDetailModel.actionFavorite,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: OneActionAppBar(),
          )
        ],
      ),
    );
  }

  Widget get infoLayout {
    return ItemsCard(
      margin: EdgeInsets.only(left: 10.0, right: 10, bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          DetailCell(
            field: 'Company',
            value: data.company ?? Constants.kNotProvided,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Constants.kPrimaryDivider,
          ),
          DetailCell(
            field: 'Location',
            value: data.location ?? Constants.kNotProvided,
          ),
        ],
      ),
    );
  }

  Widget get repoGistLayout {
    return Container(
      margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
      child: RepoGistWidget(
        repoCount: '${data.publicRepoCount}',
        gistCount: '${data.publicGistCount}',
      ),
    );
  }
}
