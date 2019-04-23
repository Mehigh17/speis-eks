import 'dart:core';

import 'package:equatable/equatable.dart';

class Mission extends Equatable {
  final String name;
  final String id;
  final List<String> manufacturers;
  final List<String> payloadIds;
  final String wikipediaUrl;
  final String websiteUrl;
  final String twitterUrl;
  final String description;

  Mission({
    this.name,
    this.id,
    this.manufacturers,
    this.payloadIds,
    this.wikipediaUrl,
    this.websiteUrl,
    this.twitterUrl,
    this.description,
  }) : super([id]);

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
        name: json["mission_name"],
        id: json["id"],
        manufacturers: List<String>.from(json["manufacturers"]),
        payloadIds: List<String>.from(json["payload_ids"]),
        wikipediaUrl: json["wikipedia"],
        websiteUrl: json["website"],
        twitterUrl: json["twitter"],
        description: json["description"]);
  }
}
