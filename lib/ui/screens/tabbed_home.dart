import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/navigation/fav_routes.dart';
import 'package:geekdirectory/navigation/home_routes.dart';
import 'package:geekdirectory/navigation/profile_routes.dart';
import 'package:geekdirectory/ui/screens/home_tab/tab_destination_view.dart';

class TabbedHome extends StatefulWidget {
  @override
  _TabbedHomeState createState() => _TabbedHomeState();
}

class _TabbedHomeState extends State<TabbedHome> {
  List<TabConfig> get tabs => [_homeTab, _favTab, _profile];
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _confirmExit,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        body: Stack(
          fit: StackFit.expand,
          children: List<Widget>.generate(3, (int index) {
            final bool active = index == _currentTabIndex;

            return Offstage(
              offstage: !active,
              child: Builder(builder: (BuildContext context) {
                return tabBuilder(index);
              }),);
          },),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          notchMargin: 6.0,
          elevation: 10.0,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentTabIndex,
            onTap: handleTabChange,
            elevation: 0.0,
            selectedItemColor: Palette.primary,
            unselectedItemColor: Colors.black54,
            backgroundColor: Colors.transparent,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home')
              ),

              /// Creates space docked FAB
              BottomNavigationBarItem(
                icon: Icon(Icons.do_not_disturb_on, color: Colors.white,),
                title: Text(''),
              ),


              BottomNavigationBarItem(
                  icon: Icon(Icons.person_pin),
                  title: Text('Profile')
              )
            ],
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        floatingActionButton: FloatingActionButton(
          backgroundColor: Palette.accentColor,
          elevation: 4,
          isExtended: true,
          onPressed: onFabClicked,
          child: Icon(
            Icons.favorite,
          ),
        ),
      ),
    );
  }

  void onFabClicked() {
    if (_currentTabIndex != 1) {
      setState(() {
        _currentTabIndex = 1;
      });
    }
  }

  Widget tabBuilder(int index) {
    return tabs[index].tabView;
  }

  void handleTabChange(int index) {
    if (index == 1) return;

    if (index != _currentTabIndex) {
      setState(() {
        _currentTabIndex = index;
      });
    }
  }


  TabConfig get _favTab => TabConfig(
      tabView: TabDestinationView(
        onGenerateRoute: (RouteSettings settings) {
          return FavRoutes.route(settings);
        },
      )
  );

  TabConfig get _homeTab => TabConfig(
      tabView: TabDestinationView(
        onGenerateRoute: (RouteSettings settings) {
          return HomeRoutes.route(settings);
        },
      )
  );

  TabConfig get _profile => TabConfig(
      tabView: TabDestinationView(
        onGenerateRoute: (RouteSettings settings) {
          return ProfileRoutes.route(settings);
        },
      )
  );


  Future<bool> _confirmExit() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('App Exit'),
          content: Text('We hate to see you leave. Was that what you really want to do?'),
          actions: <Widget>[
            FlatButton(
              child: Text('YES'),
              onPressed: () async {
                return Navigator.of(context).pop(true);
              },
            ),

            FlatButton(
              child: Text('NOT YET'),
              onPressed: () async {
                return Navigator.of(context).pop(false);
              },
            )
          ]
        );
      },
    );
  }
}

class TabConfig {
  final Function() onTabSelected;
  final TabDestinationView tabView;

  TabConfig(
      {this.onTabSelected,
        @required this.tabView});
}
