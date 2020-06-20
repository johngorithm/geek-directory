import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/ui/widgets/action_text.dart';
import 'package:geekdirectory/ui/widgets/input_error_widget.dart';
import 'package:geekdirectory/ui/widgets/onboard_page_title.dart';
import 'package:geekdirectory/ui/widgets/one_action_top_bar_widgets.dart';
import 'package:geekdirectory/ui/widgets/paragraph_text.dart';
import 'package:geekdirectory/ui/widgets/primary_button.dart';
import 'package:geekdirectory/ui/widgets/text_area_widget.dart';
import 'package:geekdirectory/utils/context_util.dart';
import 'package:geekdirectory/view_models/login_screen_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final LoginScreenModel model;

  LoginScreen({this.model});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String pagePara = 'Please log in with your username and password';
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  LoginScreenModel _loginModel;

  @override
  void initState() {
    _loginModel = widget.model ?? LoginScreenModel();
    _usernameFocusNode.addListener(_usernameFocusChangeListener);
    _passwordFocusNode.addListener(_passwordFocusChangeListener);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _loginModel.navigator = Navigator.of(context);
    super.didChangeDependencies();
  }

  void _usernameFocusChangeListener() {
    if (_usernameFocusNode.hasFocus) {
      _loginModel.clearUsernameErrors();
    }
  }

  void _passwordFocusChangeListener() {
    if (_passwordFocusNode.hasFocus) {
      _loginModel.clearPasswordErrors();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<LoginScreenModel>(
        create: (_) => _loginModel,
        child: Consumer<LoginScreenModel>(
          builder: (context, model, child) {
            return SafeArea(
              child: Column(
                children: <Widget>[
                  //APP BAR
                  OneActionAppBar(iconData: Icons.arrow_back),
                  // Expanded/ Single child scrollable widget
                  Expanded(
                    child: GestureDetector(
                      onTap: _closeKeyboard,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 28.0),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: OnboardingPageTitle(text: 'Login'),
                            ),
                            SizedBox(height: 12.0),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: ParagraphTextWidget(
                                pagePara,
                                textAlign: TextAlign.left,
                                color: Palette.lightGrey858585,
                              ),
                            ),
                            SizedBox(height: 25.0),
                            TextAreaWidget(
                              controller: _usernameController,
                              hintText: "Enter username",
                              label: 'USERNAME',
                              focusNode: _usernameFocusNode,
                            ),
                            Visibility(
                              visible: model.usernameError != null,
                              child: ErrorTextWidget(model.usernameError),
                              replacement: SizedBox(),
                            ),

                            SizedBox(height: 10.0,),

                            TextAreaWidget(
                              controller: _passwordController,
                              hintText: "Enter password",
                              label: 'PASSWORD',
                              focusNode: _passwordFocusNode,
                            ),
                            Visibility(
                              visible: model.passwordError != null,
                              child: ErrorTextWidget(model.passwordError),
                              replacement: SizedBox(),
                            ),

                            SizedBox(height: 24.0,),

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: <Widget>[
                                  ParagraphTextWidget(
                                    'Don\'t have an account?',
                                  ),

                                  ActionText(
                                    onTap: _loginModel.routeToRegister,
                                    text: 'Register',
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // primary CTA
                  PrimaryButton(
                    margin: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0, top: 10.0),
                    buttonConfig: ButtonConfig(
                      action: _onNext,
                      text: 'NEXT',
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _closeKeyboard() {
    ContextUtil.closeKeyboard(context);
  }

  void _onNext() {
    _loginModel.actionSubmit(
      _usernameController.text,
      _passwordController.text,
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.removeListener(_usernameFocusChangeListener);
    _passwordFocusNode.removeListener(_passwordFocusChangeListener);
    _usernameFocusNode.dispose();
    super.dispose();
  }
}
