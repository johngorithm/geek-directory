import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/models/geek_detail.dart';
import 'package:geekdirectory/ui/widgets/busy_indicator.dart';
import 'package:geekdirectory/ui/widgets/image_caption_widget.dart';
import 'package:geekdirectory/ui/widgets/onboard_page_title.dart';
import 'package:geekdirectory/ui/widgets/social_metrics_widget.dart';
import 'package:geekdirectory/view_models/fav_screen_model.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatefulWidget {
  final FavScreenModel model;

  FavScreen({this.model});

  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  FavScreenModel _favScreenModel;

  @override
  void initState() {
    _favScreenModel = widget.model ?? FavScreenModel();
    _favScreenModel.getFavoritedGeeks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<FavScreenModel>(
        create: (_) => _favScreenModel,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Consumer<FavScreenModel>(
            builder: (context, model, child) {
              if (model.busy) {
                return BusyIndicator();
              }

              if (model.screenMessage != null) {
                return Center(
                  child: Text(model.screenMessage),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 60, bottom: 20),
                    child: PageTitleWiget(
                      text: 'Favorites',
                      color: Palette.black,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: model.favoritedGeeks.length,
                      padding: EdgeInsets.only(bottom: 100.0),
                      itemBuilder: (context, index) {
                        GeekDetail geekDetail =
                            model.favoritedGeeks.elementAt(index);
                        return FavCard(geekDetail);
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _favScreenModel.dispose();
    super.dispose();
  }
}

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
            field: 'Follower',
            valueStyle: TextStyle(
                fontSize: 27.0,
                fontWeight: FontWeight.bold,
                color: Palette.black),
            fieldStyle: TextStyle(color: Palette.textSemiDarkGrey),
          ),
          SizedBox(
            width: 10.0,
          ),
          SocialMetricsCard(
            value: '${geekDetail.followingCount}',
            field: 'Following',
            valueStyle: TextStyle(
                fontSize: 27.0,
                fontWeight: FontWeight.bold,
                color: Palette.black),
            fieldStyle: TextStyle(color: Palette.textSemiDarkGrey),
          )
        ],
      ),
    );
  }
}
