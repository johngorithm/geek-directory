
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geekdirectory/ui/screens/splash_screen.dart';
import 'package:geekdirectory/ui/screens/tabbed_home.dart';

class AppRoutes {
  static const String start = '/start';
  static const String getStarted = '/getstarted';
  static const String signUp = '/signup';
  static const String login = '/login';
  static const String tabbedHome = '/tabbedHome';

  static Route getRoute(RouteSettings settings) {
    switch(settings.name) {
      case tabbedHome:
        return _build(settings, TabbedHome());
      case start:
      default:
        return _build(settings, SplashScreen());
    }
  }

  static _build(RouteSettings settings, Widget screen) {
    return MaterialPageRoute(builder: (context) {
      return screen;
    });
  }
}

