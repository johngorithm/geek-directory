import 'package:flutter/material.dart';
import 'package:geekdirectory/navigation/app_routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushNamed(AppRoutes.tabbedHome);
    });
    super.didChangeDependencies();
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
