import 'dart:convert';
import 'package:mutqen/data/webservice/profile_services.dart';
import '../model/profile.dart';

class ProfileRepo {
  final profileServices ProfileServices;
  ProfileRepo(this.ProfileServices);



  Future<Profile?> Getprofile() async {
    var response = await ProfileServices.GetProfile();
    try{
      if (response!.statusCode == 200) {
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
    catch(e) {
      String message = "Server Error";
      return null;
    }
  }

  Future<List<dynamic>> changePassword(String oldpassword, String newpassword) async {
    var response = await ProfileServices.changePassword(oldpassword,newpassword);
    List<dynamic> messege = [];
    try {
      var jsonresponse = json.decode(utf8.decode(response!.bodyBytes));
      if (response.statusCode == 200) {
        messege.add(jsonresponse["message"]);
        messege.add("1");
        return messege;
      }
      else if (response.statusCode == 400){
        try {
          messege = jsonresponse["old_password"];
        }catch(e)
        {
          messege = jsonresponse["new_password2"];
        }
        return messege;
      }
      else {
        messege.add("Server Error");
        return messege;
      }
    }
    catch(e) {
      messege.add("Server Error");
      return messege;
    }
  }


  Future<void> updateProfile(String phone, String country,String city, String secondemail ,
      {String imagepath = ""}) async {
    var response = await ProfileServices.updateprofile(phone, country, city,secondemail,imagepath);
  }

}