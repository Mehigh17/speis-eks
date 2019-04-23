import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String name;
  final String region;
  final double latitude;
  final double longitude;

  Location({
    this.name,
    this.region,
    this.latitude,
    this.longitude,
  }) : super([name, region, latitude, longitude]);

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
        name: json["name"],
        region: json["region"],
        latitude: double.parse(json["latitude"]),
        longitude: double.parse(json["longitude"]));
  }
}
