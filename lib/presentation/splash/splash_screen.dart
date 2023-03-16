import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mutqen/presentation/login/login_screen.dart';
import 'package:mutqen/resources/assets_manager.dart';
import 'package:page_transition/page_transition.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
   // _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
            duration: 2000,
            splash: Image.asset(ImageAssets.smallLogo),
            nextScreen: login_page(),
            splashIconSize: 200,
            //splashTransition: SplashTransition.sizeTransition,
            animationDuration: Duration(seconds: 2),
            splashTransition: SplashTransition.rotationTransition,
            pageTransitionType: PageTransitionType.bottomToTop,
      );
  }


}
