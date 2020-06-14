import 'package:flutter/material.dart';
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
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF2D239F),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      initialRoute: '/',
      onGenerateRoute: AppRoutes.getRoute,
    );
  }
}
