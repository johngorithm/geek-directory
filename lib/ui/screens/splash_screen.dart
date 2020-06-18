import 'package:flutter/material.dart';
import 'package:geekdirectory/view_models/app_model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    AppModel appModel = Provider.of<AppModel>(context, listen: false);

    /// The splash screen is the first screen the app to receive a navigation
    /// capable context. Hence, a good point to set a navigator to our appModel
    appModel.navigator = Navigator.of(context);
    appModel.initDatabase();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
