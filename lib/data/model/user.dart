class User {
  int? id;
  String? name;
  String? email;
  bool? activated;

  User({this.id, this.name, this.email, this.activated});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    activated = json['activated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['activated'] = this.activated;
    return data;
  }
}