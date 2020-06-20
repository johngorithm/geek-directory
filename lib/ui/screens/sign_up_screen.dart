import 'package:flutter/material.dart';
import 'package:geekdirectory/navigation/app_routes.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Us'),
      ),
      body: Container(
        child: Center(
          child: InkWell(
            child: Text('Sign up Screen'),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.tabbedHome);
            },
          ),
        ),
      ),
    );
  }
}
