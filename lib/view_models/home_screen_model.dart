import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:geekdirectory/exceptions/app_exceptions.dart';
import 'package:geekdirectory/models/geek.dart';
import 'package:geekdirectory/navigation/home_routes.dart';
import 'package:geekdirectory/services/service_api.dart';
import 'package:geekdirectory/services/service_locator.dart';
import 'package:geekdirectory/view_models/base_model.dart';
import 'package:simple_logger/simple_logger.dart';

class HomeScreenModel extends BaseModel {
  SimpleLogger _logger = SimpleLogger();

  @visibleForTesting
  ServiceAPI api;

  List<Geek> geeks = [];
  String screenMessage;


  HomeScreenModel({this.api}) {
    api ??= serviceLocator.get<ServiceAPI>();
  }

  Future<void> loadGeeks() async {
    screenMessage = null;
    busy = true;
    notifyListeners();

    try {
      var _geeks = await api.loadGeeks();

      if (_geeks != null && _geeks.isNotEmpty) {
        geeks = _geeks;
      } else {
        screenMessage = 'Unable to load data!';
      }

    } on GitHubStatusException catch(e) {
      screenMessage = e.message;
    } on SocketException catch(_) {
      screenMessage = 'It looks like you don\'t have a network connection.'
          'Mind checking and trying again?';
    } catch(e) {
      screenMessage = 'Oops!. Something went wrong';
      _logger.severe('Exception while loading geeks: ${e.toString()}');
    } finally {
      busy = false;
      notifyListeners();
    }
  }


  void actionSelectGeek(Geek geek) {
    var screenArg = GeekDetailScreenArgument(geek);
    router.pushNamed(HomeRoutes.geekDetail, arguments: screenArg);
  }

}

