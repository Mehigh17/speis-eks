import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:speis_eks/models/mission.dart';

class MissionDetailPage extends StatelessWidget {
  final Mission mission;

  const MissionDetailPage({
    Key key,
    @required this.mission,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var header = Column(
      children: <Widget>[
        Text(
          mission.name,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.title,
        ),
        Text(
          mission.description,          
          style: Theme.of(context).textTheme.body1,
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(mission.name),
      ),
      body: Column(
        children: <Widget>[
          header
        ],
      ),
    );
  }
}
