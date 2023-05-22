import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  int id;
  User user;
  String name;
  dynamic firstName;
  dynamic lastName;
  String gender;
  DateTime birthDate;
  dynamic jobTitle;
  dynamic academicYear;
  dynamic brief;
  dynamic bio;
  dynamic profilePicture;
  DateTime createdAt;
  DateTime updatedAt;
  int country;
  int city;
  dynamic university;
  dynamic college;

  Profile({
    required this.id,
    required this.user,
    required this.name,
    this.firstName,
    this.lastName,
    required this.gender,
    required this.birthDate,
    this.jobTitle,
    this.academicYear,
    this.brief,
    this.bio,
    this.profilePicture,
    required this.createdAt,
    required this.updatedAt,
    required this.country,
    required this.city,
    this.university,
    this.college,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    user: User.fromJson(json["user"]),
    name: json["name"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: json["gender"],
    birthDate: DateTime.parse(json["birthDate"]),
    jobTitle: json["job_title"],
    academicYear: json["academic_year"],
    brief: json["brief"],
    bio: json["bio"],
    profilePicture: json["profile_picture"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    country: json["country"],
    city: json["city"],
    university: json["university"],
    college: json["college"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user.toJson(),
    "name": name,
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
    "birthDate": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
    "job_title": jobTitle,
    "academic_year": academicYear,
    "brief": brief,
    "bio": bio,
    "profile_picture": profilePicture,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "country": country,
    "city": city,
    "university": university,
    "college": college,
  };
}

class User {
  int id;
  String email;
  String phone;
  bool activated;

  User({
    required this.id,
    required this.email,
    required this.phone,
    required this.activated,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    phone: json["phone"],
    activated: json["activated"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "phone": phone,
    "activated": activated,
  };
}
