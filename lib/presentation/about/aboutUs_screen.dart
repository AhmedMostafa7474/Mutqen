import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/resources/color_manager.dart';

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
                      child: Text("ضمن إطار اهتمام شركات باسمح التجاريه والصناعيه نحو تنميه المجتمه و إيمانهم بأن الإتقان هو القيمه المضافه التي يحتاجها الشاب في المجتمع السعودي; انطلقت مبادرتها المجتمعيه في العام 1430هـ/2009 م من خلال برنامج متقن",
                          style:TextStyle( letterSpacing: 1.1,color: ColorManager.primary,fontSize: 15.sp) ),
                    ),
                    SizedBox(height: 30.h,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(ImageAssets.About,),
                    ),
                  ],
                ),
              )

          ),
        ),


      ),
    );
  }
}