import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/models/geek_detail.dart';
import 'package:geekdirectory/ui/widgets/busy_indicator.dart';
import 'package:geekdirectory/ui/widgets/fav_card.dart';
import 'package:geekdirectory/ui/widgets/onboard_page_title.dart';
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: ListView.builder(
                        itemCount: model.favoritedGeeks.length,
                        padding: EdgeInsets.only(bottom: 100.0),
                        itemBuilder: (context, index) {
                          GeekDetail geekDetail =
                              model.favoritedGeeks.elementAt(index);
                          return FavCard(geekDetail);
                        },
                      ),
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

