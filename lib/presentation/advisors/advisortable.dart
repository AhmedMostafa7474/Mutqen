import 'package:easy_localization/easy_localization.dart' as localized;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/advisors/Widgets/submit_dialog.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../resources/common_widgets/app_bar.dart';
import '../../resources/strings_manager.dart';

class advisortable_page extends StatefulWidget {
  const advisortable_page({Key? key}) : super(key: key);

  @override
  State<advisortable_page> createState() => _advisortable_pageState();
}

class _advisortable_pageState extends State<advisortable_page> {
 DateTime _selectedDay = DateTime.now();
 DateTime _focusedDay = DateTime.now();
 var textcontroller = TextEditingController();

 @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon(AppStrings.advisor.tr(), context),
        body: SingleChildScrollView(
          child: Column(
            children:[ TableCalendar(
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
              Text("المواعيد المتاحه",style: TextStyle(fontSize: 20),),
              SizedBox(height: 20,),
              ListView.separated(
               shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
               padding:  EdgeInsets.only(bottom: 20),
               itemCount: _selectedDay.day == DateTime.now().day?3 :_selectedDay.day == DateTime.now().day + 1?2:0,
               itemBuilder: (BuildContext context, int index) {
               return UnconstrainedBox(
               child: InkWell(
               onTap: () async {
                 await showAlertDialog(context,textcontroller);
               },
               child:  Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(9.0),
                  height: 50.h,
                  width: 250.w,
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
                  child: Text("3:00 PM",style: TextStyle(
                    fontSize: 18
                  ),textDirection: TextDirection.ltr,)
              )
               ),
               );
               },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 18,
                    );
                  }
              )
            ]
          ),
        )
    )
    );
  }
}
