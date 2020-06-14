import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/models/geek_response.dart';



class GeekCard extends StatelessWidget {
  final Geek geek;

  GeekCard(this.geek);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Palette.primary,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          )),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.white,
                    width: 2.0
                ),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(geek.avatarUrl),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              '${geek.username}',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
