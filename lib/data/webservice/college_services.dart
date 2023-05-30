import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

import '../api_links.dart';

class collegeServices
{
  Future<String> GetUni ()
  async {
    http.Response response;
    try
    {
      response = await http.get(Uri.parse(EndPoints().uniLink),
          headers: <String,String>{"Content-Type": "application/json"});
      return response.body;
    }catch(e)
    {
      return "Error";
    }
  }
  Future<String> GetCollege (String uni)
  async {
    http.Response response;
    try
    {
      response = await http.get(Uri.parse(EndPoints().collegeLink +uni),
          headers: <String,String>{"Content-Type": "application/json"});
      return response.body;
    }catch(e)
    {
      return "Error";
    }
  }
}