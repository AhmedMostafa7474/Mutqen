import 'package:mutqen/data/model/city.dart';
import 'package:mutqen/data/model/college.dart';
import 'package:mutqen/data/webservice/city_services.dart';
import 'dart:convert';

import '../webservice/college_services.dart';

class collegeRepo
{
  List<dynamic> univs = [];
  List<dynamic> colleges = [];

  final collegeServices collegeservices;
  collegeRepo(this.collegeservices);

  Future<List<College>> GetUniv()
  async {
    var body = await collegeServices().GetUni();
    if(body.isNotEmpty )
    {
      var jsondecode = json.decode(body);
      print(body);
      univs = jsondecode as List<dynamic>;
      return univs.map((e) => College.fromJson(e)).toList();
    }
    else
    {
      return [];
    }
  }

  Future<List<College>> GetColleges(String uni)
  async {
    var body = await collegeServices().GetCollege(uni);
    print("yessss");
    print(body);
    if(body.isNotEmpty )
    {
      var jsondecode = json.decode(body);
      print(body);
      colleges = jsondecode as List<dynamic>;
      return colleges.map((e) => College.fromJson(e)).toList();
    }
    else
    {
      return [];
    }
  }
}