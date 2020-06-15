
import 'package:flutter/material.dart';
import 'package:geekdirectory/models/geek.dart';
import 'package:geekdirectory/ui/widgets/geek_card_widget.dart';

class UsersGrid extends StatelessWidget {
  final List<Geek> geeks;

  UsersGrid(this.geeks);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
