
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:mutqen/resources/common_widgets/button_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../resources/assets_manager.dart';
import '../../resources/common_widgets/app_bar.dart';

class about_page extends StatelessWidget {
  const about_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBarWidgetWithNotificationIcon("عن التطبيق", context),
        body: SafeArea(
          child: SingleChildScrollView(
              child:
              Center(
                child: Column(
                  children: [
                    Image.asset(ImageAssets.Anmotqen,height: 130.h,width: 130.w,),
                      Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("ضمن إطار اهتمام شركات باسمح التجارية والصناعية نحو تنمية المجتمع و إيمانهم بأن الإتقان هو القيمة المضافة التي يحتاجها الشاب في المجتمع السعودي; انطلقت مبادرتها المجتمعية في العام 1430هـ/2009م من خلال برنامج متقن",
                          style:TextStyle( letterSpacing: 1,color: ColorManager.primary,fontSize: 14.sp) ),
                    ),
                    SizedBox(height: 30.h,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(ImageAssets.About,),
                    ),
                    // RateButton(),

                  ],
                ),
              )

          ),
        ),


      ),
    );
  }

}
class RateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return defaultButton(width: 100,
        function: () {
          _launchStoreLink(context);
        }, text: "Rate the app",
        txtColor: Colors.white, height: 40, fontSize: 14);
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