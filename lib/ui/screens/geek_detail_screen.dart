import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/models/geek.dart';
import 'package:geekdirectory/models/geek_detail.dart';
import 'package:geekdirectory/ui/widgets/busy_indicator.dart';
import 'package:geekdirectory/ui/widgets/geek_detail_layout.dart';
import 'package:geekdirectory/view_models/geek_detail_screen_model.dart';
import 'package:provider/provider.dart';


class GeekDetailScreen extends StatefulWidget {
  final Geek geek;
  final GeekDetailScreenModel model;

  GeekDetailScreen(this.geek, {this.model});

  @override
  _GeekDetailScreenState createState() => _GeekDetailScreenState();
}

class _GeekDetailScreenState extends State<GeekDetailScreen> {
  GeekDetailScreenModel _screenModel;

  @override
  void initState() {
    _screenModel ??= GeekDetailScreenModel();
    _screenModel.loadGeekProfile(widget.geek.username);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Palette.white),
        title: Text('${widget.geek.username}'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => _screenModel,
        child: Consumer<GeekDetailScreenModel>(
          builder: (context, model, child) {
            if (model.busy) {
              return BusyIndicator();
            }

            if (model.screenMessage != null) {
              return Text(model.screenMessage);
            }


            return GeekDetailLayout(model.geekDetail);
          },
        ),
      ),
    );
  }
}
