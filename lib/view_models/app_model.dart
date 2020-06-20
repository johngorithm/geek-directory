
import 'package:geekdirectory/navigation/app_routes.dart';
import 'package:geekdirectory/services/service_api.dart';
import 'package:geekdirectory/services/service_locator.dart';
import 'package:geekdirectory/view_models/base_model.dart';
import 'package:simple_logger/simple_logger.dart';

class AppModel extends BaseModel {
  ServiceAPI api;


  AppModel({this.api}) {
    api ??= serviceLocator.get<ServiceAPI>();
  }


  Future<void> initDatabase() async {
    await Future.delayed(Duration(seconds: 3));
    api.initDb().then(onDatabaseLoaded);
  }

  Future<void> onDatabaseLoaded(void _) async {
    api.logger.setLevel(Level.FINE, includeCallerInfo: true);
    api.logger.info('Database is loaded');

    continueAppLaunch();
  }

  void continueAppLaunch() async {
    var user = await api.authenticatedUser;
    if (user != null) {
      router.pushNamedAndRemoveAllBehind(AppRoutes.tabbedHome);
      return;
    }

    router.pushNamedAndRemoveAllBehind(AppRoutes.getStarted);
  }

}