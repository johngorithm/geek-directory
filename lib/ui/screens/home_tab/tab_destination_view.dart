
import 'package:flutter/material.dart';

typedef ScreenRoute = Route<dynamic> Function(RouteSettings settings);

class TabDestinationView extends StatefulWidget {
  final ScreenRoute onGenerateRoute;
  final String initialRoute;

  TabDestinationView({ Key key, this.onGenerateRoute, this.initialRoute}) : super(key: key);

  @override
  _TabDestinationViewState createState() => _TabDestinationViewState();
}


class _TabDestinationViewState extends State<TabDestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: widget.onGenerateRoute,
      initialRoute: widget.initialRoute,
    );
  }

  @override
  void dispose() {
    print('\n\nI am fully disposed\n\n');
    super.dispose();
  }
}
