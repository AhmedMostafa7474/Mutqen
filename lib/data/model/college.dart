import 'dart:convert';

List<College> collegeFromJson(String str) => List<College>.from(json.decode(str).map((x) => College.fromJson(x)));

String collegeToJson(List<College> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class College {
  int? universityId;
  String name;
  int? id;

  College({
    this.universityId,
    required this.name,
    this.id,
  });

  factory College.fromJson(Map<String, dynamic> json) => College(
    universityId: json["university_id"],
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "university_id": universityId,
    "name": name,
    "id": id,
  };
}
