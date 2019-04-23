import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:speis_eks/models/mission.dart';

class MissionTile extends StatelessWidget {
  final Mission mission;

  const MissionTile({Key key, @required this.mission}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.all(10.0),
      color: Theme.of(context).backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            mission.name,
            style: Theme.of(context).textTheme.title,
            textAlign: TextAlign.center,
          ),
          Text(
            mission.description,
            style: Theme.of(context).textTheme.body1,
          ),
        ],
      ),
    );
  }
}
