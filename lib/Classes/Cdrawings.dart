// To parse this JSON data, do
//
//     final getDrawings = getDrawingsFromJson(jsonString);

import 'dart:convert';

List<GetDrawings> getDrawingsFromJson(String str) => List<GetDrawings>.from(json.decode(str).map((x) => GetDrawings.fromJson(x)));

String getDrawingsToJson(List<GetDrawings> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetDrawings {
  GetDrawings({
    required this.drawingId,
    required this.clientId,
    required this.clientName,
    required this.clientNumber,
    required this.drawingNumber,
    required this.description,
    required this.image,
  });

  int drawingId;
  int clientId;
  String clientName;
  int clientNumber;
  int drawingNumber;
  String description;
  String image;

  factory GetDrawings.fromJson(Map<String, dynamic> json) => GetDrawings(
    drawingId: json["drawing_id"],
    clientId: json["client_id"],
    clientName: json["client_name"],
    clientNumber: json["client_number"],
    drawingNumber: json["drawing_number"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "drawing_id": drawingId,
    "client_id": clientId,
    "client_name": clientName,
    "client_number": clientNumber,
    "drawing_number": drawingNumber,
    "description": description,
    "image": image,
  };
}
