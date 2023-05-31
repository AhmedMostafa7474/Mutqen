import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'language_manager.dart';


const String PREFS_KEY_LANG = "PREFS_KEY_LANG";

const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";

class AppPreferences {
  late SharedPreferences _sharedPreferences;

  getLocalToken()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getString("token");
  }
  getusername()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getString("username");
  }
  setusername(String name)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("username",name);
  }
  saveTokenAndUserIdToSharedPrefrences(String localToken) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token",localToken);
  }

  Future<String> getAppLanguage() async {
    _sharedPreferences =  await SharedPreferences.getInstance();
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.ARABIC.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    _sharedPreferences =  await SharedPreferences.getInstance();
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      // set english
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      // set arabic
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }


  //login

  Future<void> setUserLoggedIn() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();

    return sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  Future<void> logout() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();

    sharedPreferences.remove("token");
    sharedPreferences.remove("username");
    sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
  }
}