
import 'package:flutter/cupertino.dart';
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

}