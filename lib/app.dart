import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/navigation/app_routes.dart';
import 'package:geekdirectory/view_models/app_model.dart';
import 'package:provider/provider.dart';


class App extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppModel(),
      child: Selector<AppModel, ThemeMode>(
        selector: (_, model) => model.themeMode,
        builder: (context, _themeMode, child) {
          return MaterialApp(
            title: 'Geek Directory',
            theme: ThemeData(
                primaryColor: Palette.primary,
                scaffoldBackgroundColor: Palette.backgroundGrey,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                canvasColor: Palette.black,
                cardColor: Palette.white,
                brightness: Brightness.light,
                dividerColor: Palette.semiLightGrey,
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    color: Palette.black,
                    fontSize: 16.0,
                  ),
                  caption: TextStyle(
                    fontSize: 15.0,
                    color: Palette.textSemiDarkGrey,
                  ),
                )
            ),
            darkTheme: ThemeData(
                scaffoldBackgroundColor: Palette.darkModelBackground,
                cardColor: Palette.darkModeForeground,
                brightness: Brightness.dark,
                canvasColor: Palette.white,
                dividerColor: Palette.white,
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    color: Palette.white,
                    fontSize: 15.0,
                  ),
                  caption: TextStyle(
                    fontSize: 15.0,
                    color: Palette.white,
                  ),
                )
            ),
            themeMode: _themeMode ?? ThemeMode.system,
            initialRoute: '/',
            onGenerateRoute: AppRoutes.getRoute,
          );
        },
      )
    );
  }
}
