import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speis_eks/blocs/missions_bloc.dart';
import 'package:speis_eks/states/mission_state.dart';
import 'package:speis_eks/widgets/mission_tile.dart';

class MissionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MissionsBloc _missionsBloc = BlocProvider.of<MissionsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Missions"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => _missionsBloc.dispatch(MissionEvent.FETCH),
      ),
      body: BlocBuilder(
        bloc: _missionsBloc,
        builder: (context, MissionState state) {
          if (state is MissionStateLoaded) {
            if (state.isEmpty) {
              return Center(
                child: Text("No missions found."),
              );
            } else {
              return ListView.builder(
                itemCount: state.missions.length,
                itemBuilder: (ctx, index) => MissionTile(
                      mission: state.missions[index],
                    ),
              );
            }
          }

          if (state is MissionStateFailed) {
            return Center(
              child: Text("Couldn't fetch the missions."),
            );
          }

          if (state is MissionStateUninitialized) {
            _missionsBloc.dispatch(MissionEvent.FETCH);
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: Text("Unexpected error. Please restart the application."),
          );
        },
      ),
    );
  }
}
