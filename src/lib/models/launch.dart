import 'package:equatable/equatable.dart';
import 'package:speis_eks/models/links.dart';

class Launch extends Equatable {
  final int flightNumber;
  final String missionName;
  final List<String> missionIds;

  /// Launch date in UTC
  final DateTime launchDate;

  final List<String> ships;
  final bool launchSuccess;
  final String details;
  final Links links;

  Launch({
    this.flightNumber,
    this.missionName,
    this.missionIds,
    this.launchDate,
    this.ships,
    this.launchSuccess,
    this.details,
    this.links,
  }) : super([flightNumber]);

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
        flightNumber: int.parse(json["flight_number"].toString()),
        missionName: json["mission_name"],
        missionIds: List<String>.from(json["mission_id"]),
        launchDate: DateTime.parse(json["launch_date_utc"]),
        ships: List<String>.from(json["ships"]),
        launchSuccess: json["launch_success"],
        details: json["details"],
        links: Links.fromJson(json["links"]));
  }
}
