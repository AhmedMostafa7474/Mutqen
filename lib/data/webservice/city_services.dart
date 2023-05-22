import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

import '../api_links.dart';

class cityServices
{
  Future<String> GetCities (String country)
  async {
    http.Response response;
    try
    {
      response = await http.get(Uri.parse(EndPoints().cityLink +country),
          headers: <String,String>{"Content-Type": "application/json"});
      return response.body;
    }catch(e)
    {
      return "Error";
    }
  }


}