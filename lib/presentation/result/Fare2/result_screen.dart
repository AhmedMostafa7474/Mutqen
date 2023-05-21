import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/result/Fare2/resultdetails_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../data/model/result.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/common_widgets/app_bar.dart';
import '../../../resources/strings_manager.dart';
import 'Widgets/result_data.dart';

class result_page extends StatefulWidget {
   List<result> results;
   result_page(this.results, {Key? key}) : super(key: key);

  @override
  State<result_page> createState() => _result_pageState();
}

class _result_pageState extends State<result_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon("نتيجه فرق", context),
        body: Container(
          padding: EdgeInsets.only(top: 20),
          child: ListView.separated(
            padding:  EdgeInsets.only(bottom: 20),
            itemCount: widget.results.length,
            itemBuilder: (BuildContext context, int index) {
              return UnconstrainedBox(
                child: InkWell(
                  onTap: (){
                    PersistentNavBarNavigator.pushNewScreen(context, screen: resultdetails_page(widget.results[index]));
                  },
                  child: Container(
                    padding: EdgeInsets.all(9.0.sp),
                    height: 116.h,
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
                        SizedBox(height: 8.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(widget.results[index].title,style: TextStyle(
                                  color: widget.results[index].color
                                      ,fontSize: 15.sp
                                ),),
                                SizedBox(height: 10,),
                                Text(widget.results[index].description ,style: TextStyle(color: Colors.black45
                                ,fontSize: 14.sp),),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: CircularPercentIndicator(
                                radius: 40.0.sp,
                                lineWidth: 10.0.sp,
                                animation: true,
                                animationDuration: 2000,
                                percent: widget.results[index].res/100,
                                center: new Text(
                                  widget.results[index].res.toString()+"%",
                                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                                ),
                                linearGradient: LinearGradient(colors:
                                [widget.results[index].color.withOpacity(0.1),widget.results[index].color.withOpacity(0.5),widget.results[index].color]),
                                circularStrokeCap: CircularStrokeCap.round,
                               // progressColor: widget.results[index].color,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8,),
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
        ) ,
      ),
    );
  }
}
