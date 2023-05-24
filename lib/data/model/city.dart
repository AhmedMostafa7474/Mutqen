// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

import 'dart:convert';

List<City> cityFromJson(String str) => List<City>.from(json.decode(str).map((x) => City.fromJson(x)));

String cityToJson(List<City> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class City {
  int? countryId;
  String name;
  int? id;

  City({
    this.countryId,
    required this.name,
    this.id,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    countryId: json["country_id"],
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "country_id": countryId,
    "name": name,
    "id": id,
  };
}
