
import 'package:flutter/material.dart';
import 'package:geekdirectory/navigation/app_routes.dart';
import 'package:geekdirectory/ui/widgets/brand_name.dart';
import 'package:geekdirectory/ui/widgets/paragraph_text.dart';
import 'package:geekdirectory/ui/widgets/primary_button.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    WelcomeImage(),
                    BrandName('GeekApp'),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 58.0),
                      child: ParagraphTextWidget('Welcome to Flutter day SSA'),
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                margin: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0, top: 10.0),
                buttonConfig: ButtonConfig(
                  text: 'Get Started',
                  action: () {
                    Navigator.of(context).pushNamed(AppRoutes.signUp);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeImage extends StatelessWidget {
  static const String imageUri = 'assets/for_geek_directory2.jpg';
  static const double imageHeight = 177.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25.0),
      height: imageHeight,
      width: double.infinity,
      child: Image.asset(
        imageUri,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
