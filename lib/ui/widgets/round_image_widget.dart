import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';

class RoundImage extends StatelessWidget {
  final String avatarUrl;
  final double size;
  final double borderWidth;

  RoundImage(this.avatarUrl, {this.size = 95.0, this.borderWidth = 6.0});

  @override
  Widget build(BuildContext context) {
    assert(size != null);
    double _radius = size / 2.0;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Palette.white,
          border: Border.all(
              color: Palette.white,
              width: 5.0
          ),
          boxShadow: [Palette.imageBorderShadow]
      ),
      child: CircleAvatar(
        radius: _radius,
        backgroundColor: Palette.secondary.withOpacity(0.4),
        backgroundImage: CachedNetworkImageProvider(avatarUrl),
      ),
    );
  }
}
