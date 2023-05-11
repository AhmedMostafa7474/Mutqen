import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/home/Widgets/main_drawer.dart';
import 'package:mutqen/resources/color_manager.dart';

import '../../resources/assets_manager.dart';
import '../../resources/common_widgets/app_bar.dart';
import '../../resources/strings_manager.dart';
import 'Widgets/Filter.dart';

class events_page extends StatefulWidget {
  const events_page({Key? key}) : super(key: key);

  @override
  State<events_page> createState() => _events_pageState();
}

class _events_pageState extends State<events_page> {
  var searchcontroller = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
            key: _key,

          endDrawer: Filter_Drawer(),
        appBar: getAppBarWidgetWithNotificationIcon(AppStrings.events.tr(), context),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              InkWell(
                onTap: (){
                  _key.currentState!.openEndDrawer();
                },
                child: Container(
                    height: 40,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          )
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text("التصنيف"),
                        Icon(Icons.filter_alt,color: Colors.black54,)
                      ],
                    )
                ),
              )
              ,
              SizedBox(
                height: 15.h,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding:  const EdgeInsets.only(bottom: 20 ,top: 20),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return UnconstrainedBox(
                      child : InkWell(
                  onTap: (){
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(9.0),
                        height: 240.h,
                        width: 300.w,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(height: 8,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Hero(
                                      tag: "Heroo"+index.toString(),
                                      child: Image.asset(index.isOdd?ImageAssets.eventimage2:ImageAssets.eventimage,
                                        height: 120.sp,width: 120.sp,)),
                                ),
                            const SizedBox(height: 8,),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.event_seat,color: ColorManager.primatylight , size: 21.sp,),
                                    const SizedBox(width: 10,),
                                    Text("مقعد متاح : ",style: TextStyle(
                                        color: ColorManager.primatylight,
                                        fontSize: 16.sp
                                    ),),
                                    Text("0",style: TextStyle(
                                        color: ColorManager.yellow,
                                        fontSize: 16.sp
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on,color: ColorManager.primatylight,size: 21.sp,),
                                    const SizedBox(width: 10,),
                                    Text("برنامج وازن - ",style: TextStyle(
                                        color: ColorManager.primatylight,
                                        fontSize: 16.sp
                                    ),),
                                    Text("Online Workshop",style: TextStyle(
                                        color: ColorManager.yellow,
                                        fontSize: 16.sp
                                    ),),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 82.h,
                            width: 82.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: index.isOdd? ColorManager.bluelight : ColorManager.greenlight),
                                boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                                color: Colors.white70,
                                borderRadius: const BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text("20",style: TextStyle(
                                        fontSize: 21.sp,
                                        color: index.isOdd? ColorManager.bluelight : ColorManager.greenlight
                                      ),
                                          textAlign: TextAlign.center),

                                    ),
                                  ),

                                 Expanded(
                                   child: Container(
                                     decoration: BoxDecoration(
                                         borderRadius: const BorderRadius.only(bottomRight:
                                         Radius.circular(5),bottomLeft:
                                         Radius.circular(5)),
                                       color: index.isOdd? ColorManager.bluelight : ColorManager.greenlight,

                                     ),

                                      alignment: Alignment.center,
                                      child: Text("مارس",style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.white
                                      ),

                                          textAlign: TextAlign.center),

                                    ),
                                 ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 18,
                );
              },),
            ],
          ),
        )
    )
    );
  }
}
