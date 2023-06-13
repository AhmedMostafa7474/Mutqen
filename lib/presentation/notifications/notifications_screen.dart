import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mutqen/data/model/notification.dart';
import 'package:mutqen/resources/color_manager.dart';

class notification_page extends StatefulWidget {
  const notification_page({Key? key}) : super(key: key);

  @override
  State<notification_page> createState() => _notification_pageState();
}

class _notification_pageState extends State<notification_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الاشعارات"),
        centerTitle: true,
      ),
      body: AnimationLimiter(
        child: ListView.separated(
          padding: EdgeInsets.only(bottom: 20, top: 20),
          itemCount: notifications.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 600),
              child: SlideAnimation(
                duration: Duration(milliseconds: 1600),
                verticalOffset: 80.0,
                child: FadeInAnimation(
                  child: UnconstrainedBox(
                      child: Container(
                    padding: const EdgeInsets.all(9.0),
                    //height: notifications[index].desc.isEmpty ?80.h:140.h,
                    width: 350.w,
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
                        child:
                        notifications[index].desc.isEmpty? Row(
                          children: [
                            Expanded(
                              flex: 1,
                                child: Image.asset(notifications[index].image)),
                            Expanded(
                              flex: 3,
                              child:
                                  Text(notifications[index].title,style: TextStyle(
                                      color: notifications[index].color,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700
                                  ),
                              )
                            ),
                            Expanded(
                                flex: 1,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(notifications[index].time,style: TextStyle(
                                      fontSize: 14.sp
                                    ),)))
                          ],
                        ) :Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Image.asset(notifications[index].image)),
                                Expanded(
                                    flex: 3,
                                    child:
                                    Text(notifications[index].title,style: TextStyle(
                                        color: notifications[index].color,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700
                                    ),
                                    )
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(notifications[index].time,style: TextStyle(
                                            fontSize: 14.sp
                                        ))))
                              ],
                            ),
                          Text(notifications[index].desc,style: TextStyle(
                              color: ColorManager.bluelight2,fontWeight: FontWeight.w500,fontSize: 14.sp
                          )
                    ),
                            SizedBox(height: 8,)
                          ],
                        ),
                  )),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 6,
            );
          },
        ),
      ),
    );
  }
}
