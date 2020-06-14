import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/ui/widgets/busy_indicator.dart';
import 'package:geekdirectory/ui/widgets/geek_grid_widget.dart';
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
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenModel>(
      create: (_) => _homeModel,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.primary,
          title: Text('Home', style: TextStyle(
            color: Colors.white
          ),),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          bottom: false,
          child: Consumer<HomeScreenModel>(
            builder: (context, model, child) {
              if (model.busy) {
                return BusyIndicator();
              }

              if (model.screenMessage != null) {
                return Text('Unable to load data');
              }

              return UsersGrid(model.geeks);
            },
          ),
        ),
      ),
    );
  }
}
