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


}