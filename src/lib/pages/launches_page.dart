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
      body: BlocBuilder(
        bloc: launchesBloc,
        builder: (context, LaunchState state) {
          if (state is LaunchStateLoaded) {
            if (state.isEmpty) {
              return Center(
                child: Text("No launches found."),
              );
            } else {
              return ListView.separated(
                itemCount: state.launches.length,
                itemBuilder: (ctx, index) {
                  return LaunchTile(
                    launch: state.launches[index],
                  );
                },
                separatorBuilder: (ctx, index) => Divider(height: 2, color: Colors.black,),
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
