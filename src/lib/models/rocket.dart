import 'package:equatable/equatable.dart';

class Rocket extends Equatable {
  final String id;
  final String name;
  final String type;

  Rocket({
    this.id,
    this.name,
    this.type,
  }) : super([id]);

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
        id: json["rocket_id"],
        name: json["rocket_name"],
        type: json["rocket_type"]);
  }
}
