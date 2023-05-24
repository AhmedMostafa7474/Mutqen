import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api_links.dart';
class AuthServices
{
  Future<http.Response?> Signin (String username , String password)async
  {
    print(username+ " "+password);
    http.Response response;
    try{
       response = await http.post(Uri.parse(EndPoints().loginLink),
           headers: <String,String>{"Content-Type": "application/json"}
      ,body: jsonEncode(
              <String, String>{
                "email":  username,
                "password":   password
              }));
      print(response.statusCode);
      return response;
    }
    catch(e)
    {
      print(e);
      return null;
    }
  }
  Future<http.Response?> register (String name,String email,String city, String password ,String gender,String phone,
      String date , String country)async
  {
    http.Response response;
    try{
      response = await http.post(Uri.parse(EndPoints().registerLink),
          headers: <String,String>{"Content-Type": "application/json"}
          ,body: jsonEncode(
              <String, dynamic>{
                "user_data":{
                  "email": email,
                  "phone": phone,
                  "password": password
                },
                "profile":{
                  "name": name,
                  "gender": gender,
                  "birthDate": date,
                  "country":country,
                  "city": city
                }
              }));
      print(response.statusCode);
      print(response.body);
      return response;
    }
    catch(e)
    {
      print(e);
      return null;
    }
  }
}