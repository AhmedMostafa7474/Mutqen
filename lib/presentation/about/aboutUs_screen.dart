import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/resources/color_manager.dart';
import '../../resources/assets_manager.dart';
import '../../resources/common_widgets/app_bar.dart';
import '../../resources/common_widgets/rate_app_button.dart';

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
              child: Center(
            child: Column(
              children: [
                Image.asset(
                  ImageAssets.Anmotqen,
                  height: 130.h,
                  width: 130.w,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      "ضمن إطار اهتمام شركات باسمح التجارية والصناعية نحو تنمية المجتمع و إيمانهم بأن الإتقان هو القيمة المضافة التي يحتاجها الشاب في المجتمع السعودي; انطلقت مبادرتها المجتمعية في العام 1430هـ/2009م من خلال برنامج متقن",
                      style: TextStyle(
                          letterSpacing: 1,
                          color: ColorManager.primary,
                          fontSize: 14.sp)),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    ImageAssets.About,
                  ),
                ),
                // RateButton(),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
