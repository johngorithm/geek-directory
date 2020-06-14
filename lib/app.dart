import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/navigation/app_routes.dart';


class App extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geek Directory',
      theme: ThemeData.light().copyWith(
        primaryColor: Palette.primary,
        scaffoldBackgroundColor: Palette.secondary,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      initialRoute: '/',
      onGenerateRoute: AppRoutes.getRoute,
    );
  }
}
