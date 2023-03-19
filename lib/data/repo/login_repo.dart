import 'dart:convert';

import 'package:mutqen/app/app_pref.dart';
import 'package:mutqen/data/webservice/login_services.dart';

import '../model/user.dart';

class SignInRepo {
  final AuthServices authServices;

  String? token;
  SignInRepo(this.authServices);

  Future<dynamic> signIn(String email, String password) async {
    var body = await authServices.Signin(email, password);

    if(body != "Error") {
      print(body.toString());
      var jsonresponse = json.decode(body);
      token = jsonresponse["jwt"];
      var userr = jsonresponse["user"];
      if(token != null)
      {
        AppPreferences().saveTokenAndUserIdToSharedPrefrences(token!);
        User user = User.fromJson(userr);
        return user;
      }
      else
      {
        String messsge = jsonresponse["message"];
        return messsge;
      }
    }
    else
    {
      String message = "Server Error";
      return message;
    }
  }


  Future<String> register(String name,String email,int age, String password) async {
    var response = await authServices.register(name,email,age,password);

    if(response != null) {
      var jsonresponse = json.decode(response.body);
      if(response.statusCode ==200)
      {
          return "Success";
      }
      else {
        String messsge = jsonresponse["message"];
        print(messsge);
        return messsge;
      }
      }
    else
    {
      String message = "Server Error";
      return message;
    }
  }
}