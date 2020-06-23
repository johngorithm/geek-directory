
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geekdirectory/models/geek.dart';
import 'package:geekdirectory/ui/screens/geek_detail_screen.dart';
import 'package:geekdirectory/ui/screens/get_started.dart';
import 'package:geekdirectory/ui/screens/login_screen.dart';
import 'package:geekdirectory/ui/screens/sign_up_screen.dart';
import 'package:geekdirectory/ui/screens/splash_screen.dart';
import 'package:geekdirectory/ui/screens/tabbed_home.dart';

class AppRoutes {
  static const String start = '/start';
  static const String getStarted = '/getstarted';
  static const String signUp = '/signup';
  static const String login = '/login';
  static const String tabbedHome = '/tabbedHome';
  static const String viewedGeekDetail = '/viewed-geek-detail';

  static Route getRoute(RouteSettings settings) {
    switch(settings.name) {
      case getStarted:
        return _build(settings, GetStartedScreen());
      case signUp:
        return _build(settings, SignUpScreen());
      case login:
        return _build(settings, LoginScreen());
      case tabbedHome:
        return _build(settings, TabbedHome());
      case viewedGeekDetail:
        GeekDetailScreenArgument arg = settings.arguments;
        return _build(settings, GeekDetailScreen(arg.geek), isFullScreen: arg.isFullScreen);
      case start:
      default:
        return _build(settings, SplashScreen());
    }
  }

  static _build(RouteSettings settings, Widget screen, {bool isFullScreen = false}) {
    return MaterialPageRoute(
      builder: (context) => screen,
      fullscreenDialog: isFullScreen,
    );
  }
}

class GeekDetailScreenArgument extends AppRouteBaseArgument {
  final Geek geek;
  bool isFullScreen;

  GeekDetailScreenArgument(this.geek, {this.isFullScreen = false})
      : super(isFullScreenDialog: isFullScreen);
}

class AppRouteBaseArgument {
  bool isFullScreenDialog;

  AppRouteBaseArgument({this.isFullScreenDialog = false});
}
