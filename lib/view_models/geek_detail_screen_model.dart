
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:geekdirectory/exceptions/app_exceptions.dart';
import 'package:geekdirectory/models/geek_detail.dart';
import 'package:geekdirectory/services/service_api.dart';
import 'package:geekdirectory/services/service_locator.dart';
import 'package:geekdirectory/view_models/base_model.dart';

class GeekDetailScreenModel extends BaseModel {
  @visibleForTesting
  ServiceAPI api;

  GeekDetail geekDetail;
  String screenMessage;
  bool isFavorited = false;

  GeekDetailScreenModel({this.api}) {
    api ??= serviceLocator.get<ServiceAPI>();
  }
  
  Future<void> loadGeekProfile(String username) async {
    busy = true;
    screenMessage = null;
    notifyListeners();

    try {
      var data = await api.loadGeekProfile(username);
      if (data == null) {
        screenMessage = 'Unable to load data';
      } else {
        geekDetail = data;
        isFavorited = data.isFavorited;
      }
    }  on GitHubStatusException catch(e) {
      screenMessage = e.message;
    } on SocketException catch(_) {
      screenMessage = 'It looks like you don\'t have a network connection.'
          'Mind checking and trying again?';
    } catch(e) {
      screenMessage = 'Oops!. Something went wrong';
      api.logger.severe('Exception while loading geeks: ${e.toString()}');
    } finally {
      busy = false;
      notifyListeners();
    }
  }

  void actionFavorite() async {
    isFavorited = !isFavorited;

    geekDetail.isFavorited = isFavorited;
    int updateCount = await api.favoriteGeek(geekDetail);
    if (updateCount < 1) {
      // todo: show a snackbar with a message
      return;
    }

    notifyListeners();
  }

  Future<void> shareGeekProfile(String username) async {
    String text = 'Checkout this awesome developer '
        '(@$username) at https://github.com/$username';
    String subject = '@$username\'s Profile';

    await api.shareGeekProfile(text, subject: subject);
  }
}