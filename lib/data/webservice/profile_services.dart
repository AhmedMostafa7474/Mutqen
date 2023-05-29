import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mutqen/app/app_pref.dart';

import '../api_links.dart';

var headers = {
  };


class profileServices
{
  Future<http.Response?> GetProfile ()
  async {
    http.Response response;
    try
    {
      response = await http.get(Uri.parse(EndPoints().profileLink),
          headers: <String,String>{"Content-Type": "application/json",
            'Authorization': 'Bearer ' + await AppPreferences().getLocalToken()
          });
      return response;
    }catch(e)
    {
      return null;
    }
  }

  Future<http.Response?> changePassword (String oldpassword, String newpassword)
  async {
    http.Response response;
    try
    {
      response = await http.post(Uri.parse(EndPoints().passwordchangeLink),
          headers: <String,String>{"Content-Type": "application/json",
            'Authorization': 'Bearer ' + await AppPreferences().getLocalToken()
          },
      body: jsonEncode(
          <String, String>{
            "old_password": oldpassword,
            "new_password1": newpassword,
            "new_password2": newpassword
          }));
      print(response.statusCode);
      return response;
    }catch(e)
    {
      return null;
    }
  }


  Future<http.Response?> updateprofile (String phone,String country,String city)
  async {
    http.Response response;
    try
    {
      response = await http.patch(Uri.parse(EndPoints().updateprofileLink),
          headers: <String,String>{"Content-Type": "application/json",
            'Authorization': 'Bearer ' + await AppPreferences().getLocalToken()
          },
          body: jsonEncode(
              <String, String>{
                "country": country,
                "city": city,
                "phone": phone
              },
          ),
      );
      print(response.statusCode);
      return response;
    }catch(e)
    {
      return null;
    }
  }
  Future<http.StreamedResponse?> updatepicture (String imagepath)
  async {
    http.StreamedResponse response;
    var headers = {
      'Authorization': 'Bearer ' + await AppPreferences().getLocalToken()
    };
    try
    {
      var request = http.MultipartRequest('PATCH', Uri.parse(EndPoints().updateprofileLink));
      request.files.add(await http.MultipartFile.fromPath('profile_picture', imagepath));
      request.headers.addAll(headers);
      response = await request.send();
      print(response.statusCode);
      return response;
    }catch(e)
    {
      return null;
    }
  }

}