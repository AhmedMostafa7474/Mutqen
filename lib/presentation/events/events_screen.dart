import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
  final listkey = GlobalKey<State>();

  List<event> showenevents =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showenevents = events;
    print("yesss");
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child:
        Scaffold(
            key: _key,
          endDrawer: Filter_Drawer(listkey,showenevents),
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
              StatefulBuilder(
                key: listkey,
                builder: (BuildContext context, void Function(void Function()) setState) {
                return AnimationLimiter(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding:  EdgeInsets.only(bottom: 20 ,top: 20),
                    itemCount: showenevents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 600),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: UnconstrainedBox(
                                child : InkWell(
                            onTap: (){
                              PersistentNavBarNavigator.pushNewScreen(context, screen: eventdetails_page(
                                  showenevents[index],index));
                            },
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(9.0),
                                  height: 230.h,
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
                                                child: Image.asset(showenevents[index].image,
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
                                                    child: Text("برنامج "+ showenevents[index].title +" - ",style: TextStyle(
                                                          color: ColorManager.primatylight,
                                                          fontSize: 16.sp
                                                      ),),
                                                  ),
                                                   Expanded(
                                                     flex: 6,
                                                       child: Text(showenevents[index].place,style: TextStyle(
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
                                          border: Border.all(color: showenevents[index].color),
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
                                      child: Text(showenevents[index].date.split(" ")[0],style: TextStyle(
                                              fontSize: 21.sp,
                                              color: showenevents[index].color
                                            ),
                                                textAlign: TextAlign.center),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                                                color: showenevents[index].color,
                                              ),
                                              alignment: Alignment.center,

                                              child: Text(showenevents[index].date.split(" ")[1],style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.white
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    )
                            ),
                          ),
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 18,
                    );
                  },),
                );
                },
              ),
            ],
          ),
        )
    )
    );
  }
}
