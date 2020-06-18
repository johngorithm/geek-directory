
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:geekdirectory/navigation/app_router.dart';

class BaseModel extends ChangeNotifier {
  bool busy = false;
  AppRouter router;

  set navigator(NavigatorState value) {
    router = AppRouter();
    router.navigator = value;
  }
}