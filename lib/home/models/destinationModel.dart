// To parse this JSON data, do
//
//     final destinationModel = destinationModelFromJson(jsonString);

import 'dart:convert';

DestinationModel destinationModelFromJson(String str) => DestinationModel.fromJson(json.decode(str));

String destinationModelToJson(DestinationModel data) => json.encode(data.toJson());

class DestinationModel {
  String id;
  String name;
  String description;
  List<String> images;
  List<Attraction> attractions;
  int v;

  DestinationModel({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.attractions,
    required this.v,
  });

  factory DestinationModel.fromJson(Map<String, dynamic> json) => DestinationModel(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    attractions: List<Attraction>.from(json["attractions"].map((x) => Attraction.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x)),
    "attractions": List<dynamic>.from(attractions.map((x) => x.toJson())),
    "__v": v,
  };
}

class Attraction {
  String name;
  String description;
  List<String> images;
  List<String> bookmarkedBy;
  String id;

  Attraction({
    required this.name,
    required this.description,
    required this.images,
    required this.bookmarkedBy,
    required this.id,
  });

  factory Attraction.fromJson(Map<String, dynamic> json) => Attraction(
    name: json["name"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    bookmarkedBy: List<String>.from(json["bookmarked_by"].map((x) => x)),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x)),
    "bookmarked_by": List<dynamic>.from(bookmarkedBy.map((x) => x)),
    "_id": id,
  };
}
