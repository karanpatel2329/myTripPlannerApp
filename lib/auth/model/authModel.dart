// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  String id;
  String name;
  String email;
  String? password;
  String token;
  int v;

  AuthModel({
    required this.id,
    required this.name,
    required this.email,
    this.password,
    required this.token,
    required this.v,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    password: json["password"]??"",
    token: json["token"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "password": password,
    "token": token,
    "__v": v,
  };
}
