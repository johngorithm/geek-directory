
import 'package:geekdirectory/models/user.dart';
import 'package:geekdirectory/navigation/app_routes.dart';
import 'package:geekdirectory/services/service_api.dart';
import 'package:geekdirectory/services/service_locator.dart';
import 'package:geekdirectory/view_models/base_model.dart';

class SignUpScreenModel extends BaseModel {
  ServiceAPI api;

  SignUpScreenModel({this.api}) {
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
      User newUser = await api.registerUser(_username, _password);

      if (newUser != null) {
        router.pushNamed(
            AppRoutes.tabbedHome
        );
      }

      // todo: snackbar here
    } catch(e) {
      // todo: snackbar here
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
    } else if (password.length < 6) {
      passwordError = 'Password must not be less than 6 characters';
      _isValid = false;
    }



    return _isValid;
  }

  void routeToLogin() {
    router.pushNamed(AppRoutes.login);
  }
}