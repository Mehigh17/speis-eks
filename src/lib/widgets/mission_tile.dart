import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speis_eks/blocs/payloads_bloc.dart';
import 'package:speis_eks/models/mission.dart';
import 'package:speis_eks/pages/mission_detail_page.dart';

class MissionTile extends StatelessWidget {
  final Mission mission;

  const MissionTile({Key key, @required this.mission}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) {
                return BlocProvider(
                  child: MissionDetailPage(
                    mission: mission,
                  ),
                  bloc: PayloadsBloc(),
                );
              },
            ),
          ),
      isThreeLine: true,
      contentPadding: EdgeInsets.all(10.0),
      title: Text(
        mission.name,
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Text(
        mission.description,
        style: Theme.of(context).textTheme.body1,
        maxLines: 3,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.keyboard_arrow_right),
        ],
      ),
    );
  }
}
