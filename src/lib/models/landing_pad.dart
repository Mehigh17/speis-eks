import 'package:equatable/equatable.dart';

import 'location.dart';

class LandingPad extends Equatable {
  final String id;
  final String fullName;
  final String status;
  final String landingType;
  final int attemptedLandings;
  final int successfulLandings;
  final Location location;
  final String wikipediaUrl;
  final String details;

  LandingPad({
    this.id,
    this.fullName,
    this.status,
    this.landingType,
    this.attemptedLandings,
    this.successfulLandings,
    this.location,
    this.wikipediaUrl,
    this.details,
  }) : super([id]);

  factory LandingPad.fromJson(Map<String, dynamic> json) {
    return LandingPad(
        id: json["id"],
        fullName: json["full_name"],
        status: json["status"],
        landingType: json["landing_type"],
        attemptedLandings: json["attempted_landings"],
        successfulLandings: json["successful_landings"],
        location: Location.fromJson(json["location"]),
        wikipediaUrl: json["wikipedia"],
        details: json["details"]);
  }
}
