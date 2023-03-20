import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/data/model/user.dart';
import 'package:mutqen/presentation/home/home_screen.dart';
import 'package:mutqen/presentation/navbar/navbar_screen.dart';

import '../presentation/login/login_screen.dart';
import '../presentation/splash/splash_screen.dart';
import 'app_pref.dart';


class MyAppp extends StatefulWidget {
  // named constructor
  MyAppp._internal();

  int appState = 0;

  static final MyAppp _instance =
  MyAppp._internal(); // singleton or single instance

  factory MyAppp() => _instance; // factory

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppp> {

  late AppPreferences _appPreferences ;

  @override
  void didChangeDependencies() {
    _appPreferences = AppPreferences();
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          home: nav_screen(),
        );
      },
    );
  }
}