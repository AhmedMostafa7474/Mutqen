import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api_links.dart';
class AuthServices
{
  Future<String> Signin (String username , String password)async
  {
    print(username+ " "+password);
    http.Response response;
    try{
       response = await http.post(Uri.parse(EndPoints().loginLink),headers: <String,String>{"Content-Type": "application/json"}
      ,body: jsonEncode(
              <String, String>{
                "username":  username,
                "password":   password
              }));
      print(response.statusCode);
      return response.body;
    }
    catch(e)
    {
      print(e);
      return "Error";
    }
  }
  Future<http.Response?> register (String username , String email , int age , String password)async
  {
    http.Response response;
    try{
      response = await http.post(Uri.parse(EndPoints().registerLink),headers: <String,String>{"Content-Type": "application/json"}
          ,body: jsonEncode(
              <String, dynamic>{
                "name":  username,
                "email":email,
                "age": age,
                "password": password
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
}