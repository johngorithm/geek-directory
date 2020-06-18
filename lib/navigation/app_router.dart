

import 'package:flutter/material.dart';

class AppRouter {
  NavigatorState _navigatorState;

  set navigator(NavigatorState value) {
    _navigatorState = value;
  }

  bool canPop() {
    return _navigatorState.canPop();
  }

  void pop<T extends Object>([T result]) {
    _navigatorState.pop<T>(result);
  }

  Future<T> popAndPushNamed<T extends Object, TO extends Object>(String routeName, {TO result, Object arguments}) {
    return _navigatorState.popAndPushNamed<T, TO>(routeName, result: result, arguments: arguments);
  }

  void popUntil(String routeName) {
    _navigatorState.popUntil((Route route) {
      return route.settings.name == routeName;
    });
  }

  Future<T> pushNamed<T extends Object>(String routeName, {Object arguments}) {
    return _navigatorState.pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T> pushNamedAndRemoveUntil<T extends Object>(String newRouteName, predicate, {Object arguments}) {
    return _navigatorState.pushNamedAndRemoveUntil<T>(newRouteName, predicate, arguments: arguments);
  }

  Future<T> pushNamedAndRemoveAllBehind<T extends Object>(String newRouteName, {Object arguments}) {
    return _navigatorState.pushNamedAndRemoveUntil<T>(newRouteName, (Route route) => false, arguments: arguments);
  }

  Future<T> pushReplacementNamed<T extends Object, TO extends Object>(String routeName, {TO result, Object arguments}) {
    return _navigatorState.pushReplacementNamed<T, TO>(routeName, result: result, arguments: arguments);
  }
}
