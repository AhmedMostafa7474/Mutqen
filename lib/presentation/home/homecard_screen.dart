
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mutqen/data/model/exam.dart';
import 'package:mutqen/presentation/exam/exam_screen.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:mutqen/resources/common_widgets/button_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/model/exam.dart';
import '../../resources/assets_manager.dart';
import '../../resources/common_widgets/alert_messages.dart';
import '../../resources/common_widgets/app_bar.dart';
import '../exam/exam2_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class homecard_page extends StatefulWidget {
  final String pdfUrl = '';
  int index;
  exam examm;

   homecard_page(this.index, this.examm, {Key? key}) : super(key: key);

  @override
  State<homecard_page> createState() => _homecard_pageState(index);
}

class _homecard_pageState extends State<homecard_page> {
  int index;
  _homecard_pageState(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:getAppBarWidgetWithNotificationIcon(widget.examm.title, context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
                  Hero(
                      tag: "Hero"+index.toString(),
                      child: Lottie.asset(widget.examm.image,width: 150.sp,height: 150.sp,)
                  )
               ,
              Text("سيساعدك هذا المقياس علي:",style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w500
              )),
              const SizedBox(height: 10,),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                separatorBuilder: (BuildContext context, int index) { return const SizedBox(height:5.0); },
                itemBuilder: (BuildContext context, int index) {
                  return UnconstrainedBox(
                    alignment: Alignment.center,
                    child: Container(
                     // height:75,
                      decoration: BoxDecoration(
                        color: Colors.white,
                          boxShadow: [BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          )
                          ],
                          borderRadius: BorderRadius.circular(15)),
                      width: 335.w,
                      padding: const EdgeInsets.all(18),
                        child: Text(list[index],style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black
                          ,fontWeight: FontWeight.normal
                        ),)),
                  );
                },)
              ,
              const SizedBox(height: 25,)
              ,
              defaultButton(width: 140.w, function: (){
                if(widget.examm.title == exams[1].title || widget.examm.title == exams[2].title)
                    PersistentNavBarNavigator.pushNewScreen(context, screen: exam_page2(widget.examm));
                else
                    PersistentNavBarNavigator.pushNewScreen(context, screen: exam_page2(widget.examm));

              }, text: "اجراء المقياس", txtColor: Colors.white, height: 33.h, fontSize: 16.sp
                  ,background: ColorManager.yellow,borderColor: ColorManager.yellow),
              SizedBox(height: 15,),
              Text("الماده المعرفيه",style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w500
              )),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("يمكنك الاستفاده من من هذا الملف في حاله حضورك ورشه العمل الخاصه بالمقياس ",
                style: TextStyle(
                  fontSize: 16
                ),),
              ),
              defaultButton(
                  width: 140.w,
                  function: (){
                    _openDrive(context,

                        "https://drive.google.com/file/d/1ztgoteCO_axMFcz-7w-DPNEqjl6XG8Vd/view?usp=share_link");
                  },
                  text: "تحميل الملف", txtColor: Colors.white,
                  height: 33.h, fontSize: 16.sp),
              SizedBox(height: 30,)
            ],
          ),
        ),
    );


  }
  Future<void> _openDrive(BuildContext context,String driveUrl) async {
    if (await canLaunch(driveUrl)) {
      await launch(driveUrl);
    } else {
      showSnackBar(context: context, msg: "يوجد خطأ عند محاوله فتح الدرايف");


    }
  }
  List<String>list=["معرفه ضروره التوازن بين جوانب الحياه المختلفه","تقييم مستوي التوازن لديك من خلال المقياس",
    "التخطيط الواقعي والعملي والمبني علي الاولويات التي تختلف من شخص لاخر"];
}

