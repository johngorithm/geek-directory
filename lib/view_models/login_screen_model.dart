
import 'package:geekdirectory/models/user.dart';
import 'package:geekdirectory/navigation/app_routes.dart';
import 'package:geekdirectory/services/service_api.dart';
import 'package:geekdirectory/services/service_locator.dart';
import 'package:geekdirectory/view_models/base_model.dart';

class LoginScreenModel extends BaseModel {
  ServiceAPI api;

  LoginScreenModel({this.api}) {
    api ??= serviceLocator.get<ServiceAPI>();
  }

  String usernameError;
  String passwordError;

  Future<void> actionSubmit(String username, String password) async {
    String _username = username.trim();
    String _password = password.trim();

    if (!isValidData(_username, _password)) {
      notifyListeners();
      return;
    }

    try {
      User newUser = await api.loginUser(_username, _password);

      router.pushNamed(AppRoutes.tabbedHome);
    } catch(e) {
      api.logger.severe('An error occured while trying to register a new user');
    }
  }

  void clearUsernameErrors() {
    if (usernameError == null) return;

    usernameError = null;
    notifyListeners();
  }

  void clearPasswordErrors() {
    if (passwordError == null) return;

    passwordError = null;
    notifyListeners();
  }

  bool isValidData(String username, String password) {
    bool _isValid = true;

    if (username == null || username.isEmpty) {
      // Invalid input
      usernameError = 'A valid username is required please';
      _isValid = false;
    }

    if (password == null || password.isEmpty) {
      // Invalid input
      passwordError = 'Password is required';
      _isValid = false;
    }

    return _isValid;
  }

  void routeToRegister() {
    router.pop();
  }
}