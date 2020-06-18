import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/models/geek.dart';
import 'package:geekdirectory/view_models/home_screen_model.dart';
import 'package:provider/provider.dart';



class GeekCard extends StatelessWidget {
  final Geek geek;

  GeekCard(this.geek);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Palette.primary,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          )),
      child: Material(
        color: Palette.transparent,
        child: InkWell(
          onTap: () {
            var homeModel = Provider.of<HomeScreenModel>(context, listen: false);
            homeModel.actionSelectGeek(geek);
          },
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.white,
                        width: 2.0
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(geek.avatarUrl),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  '${geek.username}',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
