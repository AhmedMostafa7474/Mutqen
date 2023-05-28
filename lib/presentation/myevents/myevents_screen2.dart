import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/resources/common_widgets/button_widget.dart';

import '../../resources/color_manager.dart';
import '../../resources/common_widgets/app_bar.dart';

class myevents2_page extends StatefulWidget {
  const myevents2_page({Key? key}) : super(key: key);

  @override
  State<myevents2_page> createState() => _myevents2_pageState();
}

class _myevents2_pageState extends State<myevents2_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon("فعالياتي", context),
        body: Container(
          padding: const EdgeInsets.only(top: 20),
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: 20),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return UnconstrainedBox(
                  child: InkWell(
                onTap: () {},
                child: Stack(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(9.0),
                        height: 120.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                      child: Text("الفاعليه :",style: TextStyle(fontSize: 15.sp,
                                          fontWeight: FontWeight.w700),)),
                                  Expanded(
                                    flex: 4,
                                      child: Text("برنامج ( وازن ) لطالبات جامعة الملك عبدالعزيز - Online Workshop"
                                      ,style: TextStyle(fontSize: 15.sp,color: Colors.black.withOpacity(0.5))))
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  SizedBox(width: 120,),
                                  Text("الحاله :",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w700),),
                                  SizedBox(width: 8,),
                                  index.isEven ? defaultButton(width: 115,
                                      function: (){},
                                      text: "طباعه الشهاده", txtColor: Colors.white, height: 100, fontSize: 15,
                                  radius: 10):
                                  Text("غير مكتمل",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w700,color: ColorManager.primary),),

                                ],
                              ),
                            )
                          ],
                        )),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 35.h,
                          width: 100.w,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(child: Text("8/7/2020",style: TextStyle(
                            fontSize: 15.sp,
                          ),
                              textAlign: TextAlign.center),),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 18.h,
              );
            },
          ),
        ));
  }
}
