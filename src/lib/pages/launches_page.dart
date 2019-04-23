import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speis_eks/blocs/launches_bloc.dart';
import 'package:speis_eks/states/launch_state.dart';
import 'package:speis_eks/widgets/launch_tile.dart';

class LaunchesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LaunchesBloc launchesBloc = BlocProvider.of<LaunchesBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Launches"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => launchesBloc.dispatch(LaunchEvent.FETCH),
      ),
      body: BlocBuilder(
        bloc: launchesBloc,
        builder: (context, LaunchState state) {
          if (state is LaunchStateLoaded) {
            if (state.isEmpty) {
              return Center(
                child: Text("No launches found."),
              );
            } else {
              return ListView.builder(
                itemCount: state.launches.length,
                itemBuilder: (ctx, index) => LaunchTile(
                      launch: state.launches[index],
                    ),
              );
            }
          }

          if (state is LaunchStateFailed) {
            return Center(
              child: Text("Failed to load the launches."),
            );
          }

          if (state is LaunchStateUninitialized) {
            launchesBloc.dispatch(LaunchEvent.FETCH);
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: Text("Unexpected state occured."),
          );
        },
      ),
    );
  }
}
