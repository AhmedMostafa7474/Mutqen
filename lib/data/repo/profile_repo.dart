import 'dart:convert';
import 'package:mutqen/data/webservice/profile_services.dart';
import '../model/profile.dart';

class ProfileRepo {
  final profileServices ProfileServices;
  ProfileRepo(this.ProfileServices);



  Future<Profile?> Getprofile() async {
    var response = await ProfileServices.GetProfile();
    if (response != null) {
      if (response.statusCode == 200) {
        var jsonresponse = json.decode(utf8.decode(response.bodyBytes));
         var profilee = jsonresponse["data"]  ;
        Profile profile = Profile.fromJson(profilee);
        return profile ;
      }
      else if (response.statusCode == 403) {
        var jsonresponse = json.decode(response.body);
        String messsge = jsonresponse["code"];
        return null;
      }
      else {
        String message = "Server Error";
        return null;
      }
    }
    else {
      String message = "Server Error";
      return null;
    }
  }
}