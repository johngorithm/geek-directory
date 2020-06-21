

import 'package:flutter/cupertino.dart';
import 'package:geekdirectory/database/geek_store.dart';
import 'package:geekdirectory/models/geek_detail.dart';
import 'package:geekdirectory/services/service_api.dart';
import 'package:geekdirectory/services/service_locator.dart';
import 'package:geekdirectory/view_models/base_model.dart';

class FavScreenModel extends BaseModel {
  @visibleForTesting
  ServiceAPI api;

  List<GeekDetail> favoritedGeeks;
  String screenMessage;

  FavScreenModel({this.api}) {
    api ??= serviceLocator.get<ServiceAPI>();
    serviceLocator.get<GeekStore>().addListener(dataChangeListener);
  }

  void dataChangeListener() {
    getFavoritedGeeks();
  }

  Future<void> getFavoritedGeeks() async {
    busy = true;
    screenMessage = null;
    notifyListeners();

    try {
      var data = await api.getFavoriteGeeks();
      if (data == null) {
        screenMessage = 'You are yet to favorite a geek';
      } else {
        favoritedGeeks = data;
      }
    } catch(e) {
      screenMessage = 'Oops!. Something went wrong';
      api.logger.severe('Exception while loading geeks: ${e.toString()}');
    } finally {
      busy = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    serviceLocator.get<GeekStore>().removeListener(dataChangeListener);
    super.dispose();
  }
}