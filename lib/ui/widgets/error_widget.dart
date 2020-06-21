import 'package:flutter/material.dart';
import 'package:geekdirectory/ui/widgets/primary_button.dart';

class ScreenErrorWidget extends StatelessWidget {
  final VoidCallback retryAction;
  final String message;

  ScreenErrorWidget({this.retryAction, this.message});

  @override
  Widget build(BuildContext context) {
    assert(message != null);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            message,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10,),
          retryAction != null ? PrimaryButton(
            height: 35.0,
            width: 100.0,
            buttonConfig: ButtonConfig(
                text: 'RETRY',
                action: retryAction
            ),
          ) : SizedBox(),
        ],
      ),
    );
  }
}
