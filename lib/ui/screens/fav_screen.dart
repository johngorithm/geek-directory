import 'package:flutter/material.dart';
import 'package:geekdirectory/models/geek_detail.dart';
import 'package:geekdirectory/ui/widgets/busy_indicator.dart';
import 'package:geekdirectory/view_models/fav_screen_model.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatefulWidget {
  final FavScreenModel model;


  FavScreen({this.model});

  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  FavScreenModel _favScreenModel;
  
  @override
  void initState() {
    _favScreenModel = widget.model ?? FavScreenModel();
    _favScreenModel.getFavoritedGeeks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<FavScreenModel>(
        create: (_) => _favScreenModel,
        child: Container(
          child: Consumer<FavScreenModel>(
            builder: (context, model, child) {
              if (model.busy) {
                return BusyIndicator();
              }

              if (model.screenMessage != null) {
                return Center(
                  child: Text(model.screenMessage),
                );
              }

              return ListView.builder(
                itemCount: model.favoritedGeeks.length,
                itemBuilder: (context, index) {
                  GeekDetail data = model.favoritedGeeks.elementAt(index);

                  return Card(
                    child: Text('${data.toMap()}'),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _favScreenModel.dispose();
    super.dispose();
  }
}
