import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geekdirectory/models/geek.dart';
import 'package:geekdirectory/ui/screens/geek_detail_screen.dart';
import 'package:geekdirectory/ui/screens/home_screen.dart';

class HomeRoutes {
  static const String root = '/';
  static const String geekDetail = '/geek-detail';

  static route(RouteSettings settings) {
    switch(settings.name) {
      case geekDetail:
        GeekDetailScreenArgument arg = settings.arguments;
        return _buildRoute(settings, GeekDetailScreen(arg.geek));
      case root:
      default:
        return _buildRoute(settings, HomeScreen());
    }
  }

  static _buildRoute(RouteSettings settings, Widget screen) {
    return MaterialPageRoute(builder: (context) {
      return screen;
    });
  }
}


class GeekDetailScreenArgument {
  final Geek geek;

  GeekDetailScreenArgument(this.geek);
}
