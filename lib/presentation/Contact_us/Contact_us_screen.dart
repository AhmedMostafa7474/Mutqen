import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/resources/color_manager.dart';

import '../../resources/common_widgets/app_bar.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';
import '../home/Widgets/main_drawer.dart';

class contact_page extends StatelessWidget {
  const contact_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon(AppStrings.contact.tr(), context),
        backgroundColor: Colors.white,
        drawer: MainDrawer(),
        body:  SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity  ,
                      decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                   border: Border.all(
                  color: ColorManager.primary,
                  width: 1 // red as border color
                    ),
                ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child: Column(
                          children: [
                            Text("Contact Email",style: getRegularStyle(
                                font: FontWeight.w500,
                                fontSize: 20.sp,
                                color: Colors.black)),
                            SizedBox(height: 8.h,),
                            Text("info@mutqn.info",style: getRegularStyle(
                                font: FontWeight.w400,
                                fontSize: 18.sp,
                                color: Colors.black))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: double.infinity  ,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        border: Border.all(
                            color: ColorManager.primary,
                            width: 1 // red as border color
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child: Column(
                          children: [
                            Text("Phone number",style: getRegularStyle(
                                font: FontWeight.w500,
                                fontSize: 20.sp,
                                color: Colors.black)),
                            SizedBox(height: 8.h,),
                            Text("+135671256966",style: getRegularStyle(
                                font: FontWeight.w400,
                                fontSize: 18.sp,
                                color: Colors.black))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: double.infinity  ,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        border: Border.all(
                            color: ColorManager.primary,
                            width: 1 // red as border color
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child: Column(
                          children: [
                            Text("Address",
                              style: getRegularStyle(
                                font: FontWeight.w500,
                                fontSize: 20.sp,
                                color: Colors.black),),
                            SizedBox(height: 8.h,),
                            Text("20 goal gamal",style: getRegularStyle(
                                font: FontWeight.w400,
                                fontSize: 18.sp,
                                color: Colors.black))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

          ),
   
      ),
    );
  }
}
