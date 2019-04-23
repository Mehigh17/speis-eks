import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:speis_eks/models/launch.dart';

class LaunchDetailPage extends StatelessWidget {
  final Launch launch;

  LaunchDetailPage({
    @required this.launch,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> mainWidgets = <Widget>[];

    // Mission Patch Image
    if (launch.links.missionPatch != null) {
      mainWidgets.add(SizedBox(
        height: 200,
        child: Image.network(launch.links.missionPatch),
      ));
    }

    // Mission Title
    mainWidgets.add(
      Text(
        "${launch.missionName} #${launch.flightNumber}",
        style: Theme.of(context).textTheme.headline,
        textAlign: TextAlign.center,
      ),
    );

    // Launch description
    if (launch.details != null) {
      mainWidgets.add(
        Text(
          launch.details,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.body1,
        ),
      );
    } else {
      mainWidgets.add(
        Text(
          "This launch has no additional information.",
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.body1,
        ),
      );
    }

    // Contains meta information, such as launch date and location
    var metadata = <Widget>[];

    // Launch Date
    if (launch.launchDate != null) {
      metadata.add(
        Row(
          children: <Widget>[
            Text(
              "Launch date: ${launch.launchDate.toLocal()}",
              style: Theme.of(context).textTheme.body1,
            )
          ],
        ),
      );
    }

    // Launch Success
    if (launch.launchSuccess != null) {
      metadata.add(
        Text(
          "Mission successful: ${launch.launchSuccess ? 'Yes' : 'No'}",
          style: Theme.of(context).textTheme.body1,
        ),
      );
    }

    // Add the metadata container to the main widget
    mainWidgets.add(
      Container(
        color: Colors.black12,
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        padding: EdgeInsets.all(3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: metadata,
        ),
      ),
    );

    if (launch.ships != null && launch.ships.isNotEmpty) {
      metadata.add(
        Text(
          "Ships used: ${launch.ships.join(', ')}",
          textAlign: TextAlign.start,
        ),
      );
    }

    // Flickr Images list
    if (launch.links != null && launch.links.flickrImages.isNotEmpty) {
      metadata.add(
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: launch.links.flickrImages.length,
            itemBuilder: (ctx, index) {
              return Container(
                padding: EdgeInsets.all(10),
                height: 180,
                child: Image.network(launch.links.flickrImages[index]),
              );
            },
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(launch.missionName),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: mainWidgets,
          ),
        ),
      ),
    );
  }
}
