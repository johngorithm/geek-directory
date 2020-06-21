import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geekdirectory/models/geek.dart';
import 'package:geekdirectory/ui/screens/geek_detail_screen.dart';
import 'package:geekdirectory/ui/screens/profile_screen.dart';

class ProfileRoutes {
  static const String root = '/';
  static const String viewedGeekDetail = '/viewed-geek-detail';

  static route(RouteSettings settings) {
    switch(settings.name) {
      case viewedGeekDetail:
        GeekDetailScreenArgument arg = settings.arguments;
        return _build(settings, GeekDetailScreen(arg.geek));
      case root:
      default:
        return _build(settings, ProfileScreen());
    }
  }

  static _build(RouteSettings settings, Widget screen) {
    return MaterialPageRoute(builder: (context) {
      return screen;
    });
  }
}

class GeekDetailScreenArgument {
  final Geek geek;

  GeekDetailScreenArgument(this.geek);
}
