import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:speis_eks/models/launch.dart';

class LaunchTile extends StatelessWidget {
  final Launch launch;

  const LaunchTile({Key key, @required this.launch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10.0),
      leading: SizedBox(
        child: launch.links.missionPatch != null
            ? Image.network(launch.links.missionPatch)
            : Icon(Icons.texture),
        width: 50.0,
      ),
      title: Text(
        launch.missionName,
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Text(
        launch.details ?? "No mission details.",
        style: Theme.of(context).textTheme.body1,
        maxLines: 3,
      ),
      trailing: Icon(Icons.arrow_forward),
      isThreeLine: true,
    );
  }
}
