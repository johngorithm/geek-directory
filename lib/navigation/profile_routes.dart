import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geekdirectory/ui/screens/profile_screen.dart';

class ProfileRoutes {
  static const String root = '/';

  static route(RouteSettings settings) {
    switch(settings.name) {
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

