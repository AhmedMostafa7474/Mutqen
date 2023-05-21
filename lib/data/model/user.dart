// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  UserData userData;
  Profile profile;

  User({
    required this.userData,
    required this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userData: UserData.fromJson(json["user_data"]),
    profile: Profile.fromJson(json["profile"]),
  );

  Map<String, dynamic> toJson() => {
    "user_data": userData.toJson(),
    "profile": profile.toJson(),
  };
}

class Profile {
  String name;
  String gender;
  DateTime birthDate;
  int country;
  int city;

  Profile({
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.country,
    required this.city,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    name: json["name"],
    gender: json["gender"],
    birthDate: DateTime.parse(json["birthDate"]),
    country: json["country"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "gender": gender,
    "birthDate": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
    "country": country,
    "city": city,
  };
}

class UserData {
  String email;
  String phone;
  String password;

  UserData({
    required this.email,
    required this.phone,
    required this.password,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "phone": phone,
    "password": password,
  };
}
User user = User(userData: UserData(email: "Omar@gmail.com", phone: "011111", password: "12345678"),
    profile: Profile(name: "omar", gender: "male", birthDate: DateTime.now(),
        country: 65, city: 1000));