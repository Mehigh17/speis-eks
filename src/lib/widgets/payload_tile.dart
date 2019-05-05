import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:speis_eks/models/payload.dart';

class PayloadTile extends StatelessWidget {
  final Payload payload;

  PayloadTile({
    @required this.payload,
  });

  @override
  Widget build(BuildContext context) {
    List<String> payloadInformation = [
      "Made by ${payload.manufacturer}",
      "Weight: ${payload.massKg}kg (${payload.massLbs}lbs)",
      "Is reused: ${payload.reused ? 'Yes' : 'No'}",
      "Payload type: ${payload.type}",
      "Nationality: ${payload.nationality}",
      "Customers: ${payload.customers.join(', ')}",
      "Orbit lifespan: ${payload.orbitParams.lifespan} years",
      "Orbit period: ${payload.orbitParams.period} minutes",
      "Orbit regime: ${payload.orbitParams.regime}",
    ];

    List<Widget> displayWidgets = [
      Text(
        payload.id,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.title,
      ),
    ];

    payloadInformation.asMap().forEach((i, s) {
      displayWidgets.add(i % 2 == 0 ? _evenRow(Text(s)) : _oddRow(Text(s)));
    });

    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(blurRadius: 1.0, color: Colors.black38)
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: displayWidgets,
        ),
      ),
    );
  }

  Widget _evenRow(Widget child) {
    return Container(
      color: Colors.black12,
      padding: EdgeInsets.all(2.5),
      child: child,
    );
  }

  Widget _oddRow(Widget child) {
    return Container(
      padding: EdgeInsets.all(2.5),
      child: child,
    );
  }
}
