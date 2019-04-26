import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speis_eks/blocs/payloads_bloc.dart';
import 'package:speis_eks/models/mission.dart';
import 'package:speis_eks/states/payload_state.dart';
import 'package:speis_eks/widgets/payload_tile.dart';

class MissionDetailPage extends StatelessWidget {
  final Mission mission;

  const MissionDetailPage({
    Key key,
    @required this.mission,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final missionsBloc = BlocProvider.of<PayloadsBloc>(context);

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
        ),
      ],
    );

    var payloadDetails = Column(
      children: <Widget>[
        Text(
          "Payloads",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.title,
        ),
        BlocBuilder(
          bloc: missionsBloc,
          builder: (ctx, state) {
            if (state is PayloadLoaded) {
              if (state.payloads.length == 0) {
                return Text("No payloads found.");
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context2, index) =>
                        PayloadTile(payload: state.payloads[index]),
                    itemCount: state.payloads.length,
                    scrollDirection: Axis.vertical,
                  ),
                );
              }
            } else if (state is PayloadUninitialized) {
              missionsBloc.dispatch(FetchPayloadsEvent(
                payloadsId: mission.payloadIds,
              ));

              return CircularProgressIndicator();
            } else if (state is PayloadFailed) {
              return Center(
                child: Text("Failed to fetch the payloads. ${state.message}"),
              );
            } else {
              return Center(
                child: Text("Unhandled state: ${state.toString()}"),
              );
            }
          },
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(mission.name),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            child: header,
          ),
          Expanded(
            child: payloadDetails,
          ),
        ],
      ),
    );
  }
}
