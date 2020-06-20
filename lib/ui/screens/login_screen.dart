import 'package:flutter/material.dart';
import 'package:geekdirectory/navigation/app_routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        child: Center(
          child: InkWell(
            child: Text('Login Screen'),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.signUp);
            },
          ),
        ),
      ),
    );
  }
}
