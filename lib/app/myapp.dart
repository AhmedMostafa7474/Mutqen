import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/data/model/user.dart';
import 'package:mutqen/presentation/home/home_screen.dart';
import 'package:mutqen/presentation/navbar/navbar_screen.dart';
import 'package:mutqen/presentation/register/register_screen.dart';

import '../presentation/login/login_screen.dart';
import '../presentation/splash/splash_screen.dart';
import '../presentation/splash/splashtest_screen.dart';
import '../resources/color_manager.dart';
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
        List<LocalizationsDelegate>list = [];
        for(int i = 0 ; i<context.localizationDelegates.length; i++)
          {
            list.add(context.localizationDelegates[i]);
          }
        list.add(CountryLocalizations.delegate);
        return MaterialApp(
          localizationsDelegates: list,
          builder: EasyLoading.init(),
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'DIN',
            appBarTheme: const AppBarTheme(
              backgroundColor: ColorManager.primary,
            )
          ),
          home: MyCustomSplashScreen(),
        );
      },
    );
  }
}