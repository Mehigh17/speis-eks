import 'package:equatable/equatable.dart';

import 'orbit_params.dart';

class Payload extends Equatable {
  final String id;
  final bool reused;
  final List<String> customers;
  final String nationality;
  final String manufacturer;

  /// Payload Type. (ex: "Satellite")
  final String type;

  /// Payload weight in kilograms.
  final double massKg;

  /// Payload weight in pounds.
  final double massLbs;

  final String orbit;

  final OrbitParams orbitParams;

  Payload({
    this.id,
    this.reused,
    this.customers,
    this.nationality,
    this.manufacturer,
    this.type,
    this.massKg,
    this.massLbs,
    this.orbit,
    this.orbitParams,
  }) : super([id]);

  factory Payload.fromJson(Map<String, dynamic> json) {
    return Payload(
        id: json["payload_id"],
        reused: json["reused"],
        customers: List<String>.from(json["customers"]),
        nationality: json["nationality"],
        manufacturer: json["manufacturer"],
        type: json["payload_type"],
        massKg: json["payload_mass_kg"],
        massLbs: json["payload_mass_lbs"],
        orbit: json["orbit"],
        orbitParams: OrbitParams.fromJson(json["orbit_params"]));
  }
}
