import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';

class GeekImageWidget extends StatelessWidget {
  final String imageUrl;
  final String username;
  final TextStyle textStyle;

  GeekImageWidget({this.username, this.imageUrl, this.textStyle});

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
          style: textStyle ?? TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class ImageCaptionWidget extends StatelessWidget {
  final String imageUrl;
  final String username;
  final TextStyle textStyle;
  final double imageSize;

  ImageCaptionWidget({this.username, this.imageUrl, this.textStyle, this.imageSize = 100.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                height: imageSize,
                width: imageSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Palette.white,
                  border: Border.all(width: 3.0, color: Colors.white),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: CachedNetworkImageProvider(imageUrl),
                  ),
                ),
              ),
              Positioned(
                bottom: -2,
                right: -4,
                child: Container(
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Palette.white,
                    shape: BoxShape.circle
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Palette.primary,
                    size: 16,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          username,
          style: textStyle ?? TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
