import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../presentation/contactUs/contact_screen.dart';
import 'button_widget.dart';

class RateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return defaultButton(width: 140.w,

        function: () {
          _launchStoreLink(context);
        }, text: "Rate the app",
        txtColor: Colors.white, height: 45.h, fontSize: 16.sp);
  }

  void _launchStoreLink(BuildContext context) async {
    final url = _getStoreLink(context);
    if (await  canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }

  }


  String _getStoreLink(BuildContext context1) {
    // Replace with your app's ID on the App Store or Google Play
    final appId = 'com.example.myapp';

    if (Theme.of(context1).platform == TargetPlatform.iOS) {
      return 'itms-apps://itunes.apple.com/app/$appId?action=write-review';
    } else {
      return 'https://play.google.com/store/apps/details?id=$appId';
    }
  }
}