// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    required this.id,
    required this.roleId,
    required this.name,
    required this.password,
    required this.active,
  });

  int id;
  int roleId;
  String name;
  String password;
  bool active;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    roleId: json["role_id"],
    name: json["name"],
    password: json["password"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role_id": roleId,
    "name": name,
    "password": password,
    "active": active,
  };
}
