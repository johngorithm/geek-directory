import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/models/geek.dart';
import 'package:geekdirectory/models/geek_detail.dart';
import 'package:geekdirectory/ui/widgets/busy_indicator.dart';
import 'package:geekdirectory/ui/widgets/geek_detail_layout.dart';
import 'package:geekdirectory/view_models/geek_detail_screen_model.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';


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
    return ChangeNotifierProvider<GeekDetailScreenModel>(
      create: (_) => _screenModel,
      child: Scaffold(
        body: Selector<GeekDetailScreenModel, Tuple3<bool, String, GeekDetail>>(
          selector: (_, model) => Tuple3(model.busy, model.screenMessage, model.geekDetail),
          builder: (context, data, child) {
            if (data.item1) {
              return BusyIndicator();
            }

            if (data.item2 != null) {
              return Text(data.item2);
            }

            return GeekDetailLayout(data.item3, _screenModel);
          },
        ),
      ),
    );
  }
}
