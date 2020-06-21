
import 'package:flutter/cupertino.dart';
import 'package:geekdirectory/database/geek_store.dart';
import 'package:geekdirectory/models/geek_detail.dart';
import 'package:geekdirectory/models/user.dart';
import 'package:geekdirectory/navigation/profile_routes.dart';
import 'package:geekdirectory/services/service_api.dart';
import 'package:geekdirectory/services/service_locator.dart';
import 'package:geekdirectory/view_models/base_model.dart';

class ProfileScreenModel extends BaseModel {
  @visibleForTesting
  ServiceAPI api;

  String screenMessage;
  User user;
  List<GeekDetail> viewedGeeks;
  bool isDarkModeSelected = false;
  int favCount = 0;

  ProfileScreenModel({this.api}) {
    api ??= serviceLocator.get<ServiceAPI>();
    serviceLocator.get<GeekStore>()
        .addListener(geekStoreDataChangeListener);
  }

  void geekStoreDataChangeListener() async {
    getViewedGeeks();
  }

  Future<void> getProfileData() async {
    busy = true;
    screenMessage = null;
    notifyListeners();

    try {
      user = await api.getUserProfile();
      viewedGeeks = await api.getViewedGeeks();
      if (viewedGeeks != null || viewedGeeks.isNotEmpty) {
        favCount = viewedGeeks.where((item) => item.isFavorited).length;
      }
    } catch(e) {
      screenMessage = 'Something went wrong, mind trying again';
      api.logger.severe('An error occured while fetching user profile');
    } finally {
      busy = false;
      notifyListeners();
    }
  }

  Future<void> getViewedGeeks() async {
    try {
      viewedGeeks = await api.getViewedGeeks();
      if (viewedGeeks != null || viewedGeeks.isNotEmpty) {
        favCount = viewedGeeks.where((item) => item.isFavorited).length;
      }
      notifyListeners();
    } catch(e) {
      // Fail silently
      api.logger.severe('An error occured while fetching viewed geeks');
    }
  }

  void toggleDarkMode(bool value) {
    if (isDarkModeSelected == value) {
      return;
    }

    isDarkModeSelected = value;
    notifyListeners();
  }


  void actionSelectGeek(GeekDetail geek) {
    var screenArg = GeekDetailScreenArgument(geek);
    router.pushNamed(ProfileRoutes.viewedGeekDetail, arguments: screenArg);
  }

  @override
  void dispose() {
    serviceLocator.get<GeekStore>()
        .removeListener(geekStoreDataChangeListener);
    super.dispose();
  }

}