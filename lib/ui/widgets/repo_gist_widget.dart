
import 'package:flutter/material.dart';
import 'package:geekdirectory/ui/widgets/item_card.dart';
import 'package:geekdirectory/ui/widgets/social_metrics_widget.dart';

class RepoGistWidget extends StatelessWidget {
  final String repoCount;
  final String gistCount;

  RepoGistWidget({this.gistCount, this.repoCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: ItemsCard(
              padding: EdgeInsets.symmetric(
                vertical: 30.0,
              ),
              child: SocialMetricsCard(
                field: 'Repos',
                value: repoCount,
              )
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: ItemsCard(
              padding: EdgeInsets.symmetric(
                vertical: 30.0,
              ),
              child: SocialMetricsCard(
                field: 'Gists',
                value: gistCount,
              )
          ),
        )
      ],
    );
  }
}
