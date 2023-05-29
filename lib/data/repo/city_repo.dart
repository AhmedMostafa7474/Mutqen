import 'package:mutqen/data/model/city.dart';
import 'package:mutqen/data/webservice/city_services.dart';
import 'dart:convert';

class cityRepo
{
  List<dynamic> cites = [];

  final cityServices cityservices;
  cityRepo(this.cityservices);

  Future<List<City>> GetCities(String country)
  async {
   var body = await cityServices().GetCities(country);
   if(body.isNotEmpty )
   {
     var jsondecode = json.decode(body);
     print(body);
     cites = jsondecode as List<dynamic>;
     return cites.map((e) => City.fromJson(e)).toList();
     }
   else
     {
     return [];
     }

  }
}