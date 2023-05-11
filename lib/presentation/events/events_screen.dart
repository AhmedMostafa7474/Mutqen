import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/home/Widgets/main_drawer.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../data/model/event.dart';
import '../../resources/assets_manager.dart';
import '../../resources/common_widgets/app_bar.dart';
import '../../resources/strings_manager.dart';
import 'Widgets/Filter.dart';
import 'eventdetails_screen.dart';

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
          drawer: MainDrawer(),
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
                    child : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("التصنيف"),
                        Icon(Icons.filter_alt,color: Colors.black54,)
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          )
                        ],
                        borderRadius: BorderRadius.circular(15))
                ),
              )
              ,
              SizedBox(
                height: 15.h,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding:  EdgeInsets.only(bottom: 20 ,top: 20),
                itemCount: events.length,
                itemBuilder: (BuildContext context, int index) {
                  return UnconstrainedBox(
                      child : InkWell(
                  onTap: (){
                    PersistentNavBarNavigator.pushNewScreen(context, screen: eventdetails_page(
                        events[index],index));
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(9.0),
                        height: 270.h,
                        width: 300.w,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: 8,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Hero(
                                      tag: "Heroo"+index.toString(),
                                      child: Image.asset(events[index].image,
                                        height: 120.sp,width: 120.sp,)),
                                ),
                            SizedBox(height: 8,),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.event_seat,color: ColorManager.primatylight , size: 21.sp,),
                                    SizedBox(width: 10,),
                                    Container(
                                      child: Text("مقعد متاح : ",style: TextStyle(
                                          color: ColorManager.primatylight,
                                          fontSize: 16.sp
                                      ),),
                                    ),
                                    Container(
                                      child: Text(events[index].seats,style: TextStyle(
                                          color: ColorManager.yellow,
                                          fontSize: 16.sp
                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 9.0,right: 6.0),
                                child:
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                            child: Container(child: Icon(Icons.location_on,color: ColorManager.primatylight,size: 21.sp,))),
                                        Expanded(
                                          flex: 3,
                                          child: Text("برنامج "+ events[index].title +" - ",style: TextStyle(
                                                color: ColorManager.primatylight,
                                                fontSize: 16.sp
                                            ),),
                                        ),
                                         Expanded(
                                           flex: 6,
                                             child: Text(events[index].place,style: TextStyle(
                                                  color: ColorManager.yellow,
                                                  fontSize: 16.sp
                                              ),
                                        ),
                                           ),
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
                                border: Border.all(color: events[index].color),
                                boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Container(
                                  height: 40.h,
                                  alignment: Alignment.center,
                                  child: Text(events[index].date.split(" ")[0],style: TextStyle(
                                    fontSize: 21.sp,
                                    color: events[index].color
                                  ),
                                      textAlign: TextAlign.center),
                                ),
                                Container(
                                  height: 40.h,
                                  alignment: Alignment.center,
                                  color: events[index].color,
                                  child: Text(events[index].date.split(" ")[1],style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.white
                                  ),
                                      textAlign: TextAlign.center),
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
                return SizedBox(
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
