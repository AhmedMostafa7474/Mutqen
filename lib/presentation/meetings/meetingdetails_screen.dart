import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/meetings/chatroom_screen.dart';
import 'package:mutqen/resources/common_widgets/button_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
//import 'package:zoom_native_sdk/zoom_native_sdk.dart';

import '../../data/model/meeting.dart';
import '../../resources/assets_manager.dart';
import '../../resources/common_widgets/app_bar.dart';
import '../../resources/strings_manager.dart';


class meetingdetails_page extends StatefulWidget {
  int index;
   meetingdetails_page(this.index,{Key? key}) : super(key: key);

  @override
  State<meetingdetails_page> createState() => _meetingdetails_pageState();
}

class _meetingdetails_pageState extends State<meetingdetails_page> {
  String meetingid = "83698622237";
  String password= "Jegw0F";
//  final _zoomNativelyPlugin = ZoomNativeSdk();
  bool isInitialized = false;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {

    try {
      if (!isInitialized) {
        // isInitialized = (await _zoomNativelyPlugin.initZoom(
        //   appKey: "92M7ZuZkS8ODARAHUFEB8Q",
        //   appSecret: "64OuLAgStzkO9c2yVRrk2qob0kkH5Yp5",
        // )) ??
        //     false;
      }
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon(AppStrings.advices.tr(), context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
           children: [
              SizedBox(height: 15,),
              Align(
                alignment: Alignment.center,
                child: Hero(
                    tag: "Hero3"+widget.index.toString(),
                    child: Container(
                      height: 80 ,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(image: AssetImage(ImageAssets.meetingimage))
                      ),
                    )
                ),
              ),
              SizedBox(height: 13,),
              Text(Meetings[widget.index].instructor_name ,style: TextStyle(
                  fontSize: 17.sp
              )
          ),
        SizedBox(height: 13,),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(Icons.access_time,size: 27,),
              SizedBox(width: 11),
              Text("الموعد : ",style: TextStyle(fontSize: 19.sp),)
            ],
          ),
        ),
        Text(DateFormat().add_MMMMEEEEd().format(Meetings[widget.index].meeting_time).toString(),
            style: TextStyle(fontSize: 19.sp )
        ),
        SizedBox(height: 3,),
        Text(DateFormat().add_jm().format(Meetings[widget.index].meeting_time).toString(),
            style: TextStyle(fontSize: 19.sp )
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(Icons.transit_enterexit,size: 27,),
              SizedBox(width: 11),
              Text("رابط الموعد zoom : ",style: TextStyle(fontSize: 19.sp),)
            ],
          ),
        ),
        SizedBox(height: 10,),
        defaultButton(width:  140.w, function: () async {
          if (isInitialized) {
            // await _zoomNativelyPlugin.joinMeting(
            //   meetingNumber: meetingid,
            //   meetingPassword: password,
            // );

          }
        }, text: "موعد zoom",
            txtColor: Colors.white, height: 40.h, fontSize: 19.sp),
        SizedBox(height: 36,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            defaultButton(width:  125.w, function: (){
              PersistentNavBarNavigator.pushNewScreen(context, screen: chatroom_page(),withNavBar: false);
            }, text: "محادثه",
                txtColor: Colors.black, height: 35.h, fontSize: 19.sp,background: Colors.white),
            defaultButton(width:  125.w, function: (){}, text: "الغاء",

                txtColor: Colors.white, height: 35.h, fontSize: 19.sp,background: Colors.red),
          ],
        )
      ],
      ),
    )
    )
    );
  }
}
