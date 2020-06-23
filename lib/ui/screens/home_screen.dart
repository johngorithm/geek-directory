import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/ui/widgets/busy_indicator.dart';
import 'package:geekdirectory/ui/widgets/geek_grid_widget.dart';
import 'package:geekdirectory/ui/widgets/onboard_page_title.dart';
import 'package:geekdirectory/ui/widgets/error_widget.dart';
import 'package:geekdirectory/view_models/home_screen_model.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatefulWidget {
  final HomeScreenModel model;

  HomeScreen({this.model});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenModel _homeModel;

  @override
  void initState() {
    _homeModel = widget.model ?? HomeScreenModel();
    _homeModel.loadGeeks();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _homeModel.navigator = Navigator.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenModel>(
      create: (_) => _homeModel,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Consumer<HomeScreenModel>(
            builder: (context, model, child) {
              if (model.busy) {
                return BusyIndicator();
              }

              if (model.screenMessage != null) {
                return ScreenErrorWidget(
                  message: model.screenMessage,
                  retryAction: _homeModel.loadGeeks,
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 60, bottom: 10),
                    child: PageTitleWidget(
                      text: 'Home </>',
                      color: Palette.black,
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: GeeksGrid(model.geeks),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _homeModel.dispose();
    super.dispose();
  }
}
