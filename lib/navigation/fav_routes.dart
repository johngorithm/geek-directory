import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geekdirectory/ui/screens/fav_screen.dart';

class FavRoutes {
  static const String root = '/';
  static const String favDetails = '/fav-details';

  static route(RouteSettings settings) {
    switch(settings.name) {
      case root:
      default:
        return _build(settings, FavScreen());
    }
  }

  static _build(RouteSettings settings, Widget screen) {
    return MaterialPageRoute(builder: (context) {
      return screen;
    });
  }
}
