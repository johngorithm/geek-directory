import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';

class GeekImageWidget extends StatelessWidget {
  final String imageUrl;
  final String username;

  GeekImageWidget({this.username, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Palette.white,
            border: Border.all(width: 3.0, color: Colors.white),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: CachedNetworkImageProvider(imageUrl),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          username,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
