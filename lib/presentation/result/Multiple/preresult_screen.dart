import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mutqen/presentation/result/Multiple/Widgets/preresult_data.dart';
import 'package:mutqen/presentation/result/Fare2/result_screen.dart';
import 'package:mutqen/presentation/result/Multiple/result_screen3.dart';
import 'package:mutqen/resources/common_widgets/button_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/common_widgets/app_bar.dart';

class preresult_page extends StatefulWidget {
  const preresult_page({Key? key}) : super(key: key);

  @override
  State<preresult_page> createState() => _preresult_pageState();
}

class _preresult_pageState extends State<preresult_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidgetWithNotificationIcon("نتيجه الذكاءات المتعدده", context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(height: 30,) ,
              Center(
                child: SvgPicture.asset(
                  ImageAssets.quesionimage,
                  height: 40.h,
                  width: 40.w,
                ),
              ),
            SizedBox(height: 8.0,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("دلائل مجموع الدرجات لكل ذكاء علي حده :",
              style: TextStyle(
                fontSize: 13.sp
              ),),
            ),
            SizedBox(height: 12.0),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Center(
                      child: Text(data[index].title),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(data[index].description,style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12.sp
                      ),),
                    )
                  ],
                );
              },),
            SizedBox(height: 8,),
            Center(
              child: defaultButton(width: 200, function: (){
                PersistentNavBarNavigator.pushNewScreen(context, screen: result_page3(multiple_results));
              }, text: "عرض النتيجة",
                  txtColor: Colors.white, height: 30, fontSize: 14),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
