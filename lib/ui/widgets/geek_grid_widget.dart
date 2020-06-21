
import 'package:flutter/material.dart';
import 'package:geekdirectory/models/geek.dart';
import 'package:geekdirectory/ui/widgets/geek_card_widget.dart';

class GeeksGrid extends StatelessWidget {
  final List<Geek> geeks;

  GeeksGrid(this.geeks);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.only(top: 10.0, bottom: 130.0, left: 10.0, right: 10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount: geeks.length,
        itemBuilder: (context, index) {
          var _geek = geeks.elementAt(index);
          return GeekCard(_geek);
        });
  }
}
