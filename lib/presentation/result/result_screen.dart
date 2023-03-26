import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/result/Widgets/result_data.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../resources/assets_manager.dart';
import '../../resources/common_widgets/app_bar.dart';
import '../../resources/strings_manager.dart';

class result_page extends StatefulWidget {
  const result_page({Key? key}) : super(key: key);

  @override
  State<result_page> createState() => _result_pageState();
}

class _result_pageState extends State<result_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon("نتيجه وازن", context),
        body: Container(
          padding: EdgeInsets.only(top: 20),
          child: ListView.separated(
            padding:  EdgeInsets.only(bottom: 20),
            itemCount: results.length,
            itemBuilder: (BuildContext context, int index) {
              return UnconstrainedBox(
                child: InkWell(
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.all(9.0),
                    height: 110.h,
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
                            Column(
                              children: [
                                Text(results[index].title,style: TextStyle(
                                  color: results[index].color
                                ),),
                                SizedBox(height: 10,),
                                Text(results[index].description ,style: TextStyle(color: Colors.black45),),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: CircularPercentIndicator(
                                radius: 40.0,
                                lineWidth: 10.0,
                                animation: true,
                                animationDuration: 2000,
                                percent: results[index].res/100,
                                center: new Text(
                                  results[index].res.toString()+"%",
                                  style:
                                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                                ),
                                linearGradient: LinearGradient(colors:
                                [results[index].color.withOpacity(0.1),results[index].color.withOpacity(0.5),results[index].color]),
                                circularStrokeCap: CircularStrokeCap.round,
                               // progressColor: results[index].color,
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
