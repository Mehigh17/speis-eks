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
          children: <Widget>[
            Text(
              payload.id,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
            _evenRow(Text("Made by ${payload.manufacturer}")),
            _oddRow(
                Text("Weight: ${payload.massKg}kg (${payload.massLbs}lbs)")),
            _evenRow(Text("Is reused: ${payload.reused ? 'Yes' : 'No'}")),
            _oddRow(Text("Payload type: ${payload.type}")),
            _evenRow(Text("Nationality: ${payload.nationality}")),
            _oddRow(Text("Customers: ${payload.customers.join(', ')}")),
            _evenRow(
                Text("Orbit lifespan: ${payload.orbitParams.lifespan} years")),
            _oddRow(
                Text("Orbit period: ${payload.orbitParams.period} minutes")),
            _evenRow(Text("Orbit regime: ${payload.orbitParams.regime}"))
          ],
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
