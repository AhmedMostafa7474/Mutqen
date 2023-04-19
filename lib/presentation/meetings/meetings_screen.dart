import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/data/model/meeting.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../resources/assets_manager.dart';
import '../../resources/common_widgets/app_bar.dart';
import '../../resources/strings_manager.dart';

class meetings_page extends StatefulWidget {
  const meetings_page({Key? key}) : super(key: key);

  @override
  State<meetings_page> createState() => _meetings_pageState();
}

class _meetings_pageState extends State<meetings_page> {
  DateFormat dateFormat = DateFormat("HH:mm a");
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: getAppBarWidgetWithNotificationIcon(
            AppStrings.advices.tr(), context),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  TableCalendar(
                    locale: "ar",
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now().add(Duration(days: 6)),
                    daysOfWeekHeight: 40,
                    focusedDay: _focusedDay,
                    onFormatChanged: (C){
                    },
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay; // update `_focusedDay` here as well
                      });
                    },
                    calendarFormat: CalendarFormat.week,
                    calendarStyle: CalendarStyle(
                    ),
                  ),
                  SizedBox(height: 20,),
                  ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding:  EdgeInsets.all(20),
                          itemCount: _selectedDay.day == DateTime.now().day?2 :_selectedDay.day == DateTime.now().day + 1?1:0,
                          itemBuilder: (BuildContext context, int index) {
                            return UnconstrainedBox(
                              child: InkWell(
                                onTap: (){
                                },
                                child: Container(
                                  padding: EdgeInsets.all(9.0),
                                  height: 150.h,
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 8,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              Hero(
                                                  tag: "Hero"+index.toString(),
                                                  child: Container(
                                                    height: 60 ,
                                                    width: 60,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(100),
                                                        image: DecorationImage(image: AssetImage(ImageAssets.meetingimage))
                                                    ),
                                                  )
                                              ),
                                            SizedBox(width: 10,),
                                            Text(Meetings[index].instructor_name ,style: TextStyle(
                                                  fontSize: 15.sp
                                              )),
                                              ]
                                          ),
                                  Container(
                                    height: 30.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                        color: Colors.white70,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(child: Text(
                                        dateFormat.format(Meetings[index].meeting_time).toString(),style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                        textAlign: TextAlign.center),),
                                  ),
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                    Column(
                                              children: [
                                                Container(
                                                  height: 20.h,
                                                  width: 100.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8)),
                                                  child: Center(child: Text(meetingtitle[1],style: TextStyle(
                                                    fontSize: 15.sp,
                                                  ),
                                                      textAlign: TextAlign.center),),
                                                ),
                                                SizedBox(height: 10,),
                                                Container(
                                                  height: 30.h,
                                                  width: 130.w,
                                                  decoration: BoxDecoration(boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey.withOpacity(0.2),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: Offset(0, 3), // changes position of shadow
                                                    ),
                                                  ],
                                                      color: Colors.white70,
                                                      borderRadius: BorderRadius.circular(8)),
                                                  child: Center(child: Text(
                                                     Meetings[index].meetingn_subject,style: TextStyle(
                                                    fontSize: 15.sp,
                                                  ),
                                                      textAlign: TextAlign.center),),
                                                ),
                                              ],
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 18,
                            );
                          },),
                ],
              ),
            ),
            ));
  }
}
