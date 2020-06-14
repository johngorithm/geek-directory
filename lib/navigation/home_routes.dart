import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geekdirectory/ui/screens/home_screen.dart';

class HomeRoutes {
  static const String root = '/';
  static const String favDetails = '/home-fav-details';

  static route(RouteSettings settings) {
    switch(settings.name) {
      case root:
      default:
        return _build(settings, HomeScreen());
    }
  }

  static _build(RouteSettings settings, Widget screen) {
    return MaterialPageRoute(builder: (context) {
      return screen;
    });
  }
}
