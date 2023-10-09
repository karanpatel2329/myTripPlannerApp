// To parse this JSON data, do
//
//     final attractionSaved = attractionSavedFromJson(jsonString);

import 'dart:convert';

import '../../home/models/destinationModel.dart';

AttractionSaved attractionSavedFromJson(String str) => AttractionSaved.fromJson(json.decode(str));

String attractionSavedToJson(AttractionSaved data) => json.encode(data.toJson());

class AttractionSaved {
  Attraction attraction;
  String destinationId;

  AttractionSaved({
    required this.attraction,
    required this.destinationId,
  });

  factory AttractionSaved.fromJson(Map<String, dynamic> json) => AttractionSaved(
    attraction: Attraction.fromJson(json["attraction"]),
    destinationId: json["destinationId"],
  );

  Map<String, dynamic> toJson() => {
    "attraction": attraction.toJson(),
    "destinationId": destinationId,
  };
}
