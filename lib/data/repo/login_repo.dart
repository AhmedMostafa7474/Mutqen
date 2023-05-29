import 'dart:convert';

import 'package:mutqen/app/app_pref.dart';
import 'package:mutqen/data/webservice/login_services.dart';

import '../model/user.dart';

class SignInRepo {
  final AuthServices authServices;

  String? token;

  SignInRepo(this.authServices);

  Future<dynamic> signIn(String email, String password) async {
    var response = await authServices.Signin(email, password);

    if (response != null) {
      var jsonresponse = json.decode(response.body);
      if (response.statusCode == 200) {
        token = jsonresponse["data"]["access"];
        var userr = jsonresponse["data"]["user"];
          AppPreferences().saveTokenAndUserIdToSharedPrefrences(token!);
          User user = User.fromJson(userr);
          return user;
      }
      else if (response.statusCode == 401){
        String messsge = jsonresponse["detail"];
        return messsge;
      }
      else {
        String message = "Server Error";
        return message;
      }
    }
    else {
      String message = "Server Error";
      return message;
    }
  }


  Future<String> register(String name, String email, String city, String password,
      String gender, String phone, String date,String country) async {
    var response = await authServices.register(
        name,
        email,
        city,
        password,
        gender,
        phone,
        date,
    country);
    if (response != null) {
      if (response.statusCode == 201) {
        return "Success";
      }
      else if (response.statusCode == 400) {
        var jsonresponse = json.decode(utf8.decode(response.bodyBytes));
        String messsge = jsonresponse["message"];
        return messsge;
      }
      else {
        String message = "Server Error";
        return message;
      }
    }
    else {
      String message = "Server Error";
      return message;
    }
  }
}