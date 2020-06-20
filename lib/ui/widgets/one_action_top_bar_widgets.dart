import 'package:flutter/material.dart';
import 'package:geekdirectory/commons/palette.dart';
import 'package:geekdirectory/ui/widgets/search_text_area_widget.dart';

class OneActionAppBar extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onActionPress;
  final String title;
  final double height;
  final bool hasBackBtnShadow;

  OneActionAppBar(
      {this.iconData = Icons.arrow_back,
        this.onActionPress,
        this.title,
        this.height = 56,
        this.hasBackBtnShadow = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: Colors.white,
      padding: EdgeInsets.only(left: 0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          List<Widget> children = [
            BackButton(
              iconData: iconData,
              onBackPress: onActionPress,
              hasShadow: hasBackBtnShadow,
            )
          ];

          if (title != null && title.isNotEmpty) {
            children.add(Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  title,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: TextStyle(
                      color: Palette.semiDarkGrey,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ));

            children.add(SizedBox(
              width: 67,
            ));
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          );
        },
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onBackPress;
  final bool hasShadow;


  BackButton({this.iconData, this.onBackPress, this.hasShadow = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: hasShadow ? [Palette.buttonShadow] : null,
      ),
      margin: EdgeInsets.only(left: 15.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: CircleBorder(),
          splashColor: Palette.secondary,
          onTap: onBackPress ?? () {
            if (Navigator.canPop(context)) {
              Navigator.of(context).pop();
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Icon(
              iconData ?? Icons.arrow_back,
              size: 28,
              color: Palette.primary,
            ),
          ),
        ),
      ),
    );
  }
}

class TopBarWithSearch extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;


  TopBarWithSearch({this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BackButton(hasShadow: false,),

          Expanded(
            child: SearchTextField(
              controller: controller,
              hintText: hintText,
            ),
          )
        ],
      ),
    );
  }
}
