import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/result/Widgets/result_data.dart';
import 'package:mutqen/presentation/result/resultdetails_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../resources/common_widgets/app_bar.dart';

class result_page2 extends StatefulWidget {
  const result_page2({Key? key}) : super(key: key);

  @override
  State<result_page2> createState() => _result_page2State();
}

class _result_page2State extends State<result_page2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon("نتيجه وازن", context),
        body: Container(
          padding: EdgeInsets.only(top: 20),
          child: ListView.separated(
            padding:  EdgeInsets.only(bottom: 20),
            itemCount: wazenresults.length,
            itemBuilder: (BuildContext context, int index) {
              return UnconstrainedBox(
                child: InkWell(
                  onTap: (){
             //       PersistentNavBarNavigator.pushNewScreen(context, screen: resultdetails_page(results[index]));
             showModalBottomSheet(
             context: context,
             builder: (context)
             {
               return SingleChildScrollView(
                 child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: Center(child: Text(" وسائل لتنمية "+wazenresults[index].title,style: TextStyle(
                           fontSize: 20,
                           color: wazenresults[index].color
                         ),),),
                       ),
                       ListView.separated(
                         physics: NeverScrollableScrollPhysics(),
                           shrinkWrap: true,
                           separatorBuilder: (BuildContext context, int index) {
                             return SizedBox(
                               height: 8,
                             );
                           },
                           itemCount: list.length, itemBuilder: (BuildContext context, int index) {
                         return ListTile(
                           leading: Text((index+1).toString()),
                           title: Text(list[index]),
                         );
                       },),
                       SizedBox(height: 50,)
                     ]
                 ),
               );
             }
             );
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
                            Text(wazenresults[index].title,style: TextStyle(
                                    color: wazenresults[index].color
                                ),),
                            SizedBox(height: 40,),
                            Container(
                              child: LinearPercentIndicator(
                                width: 320,
                                animation: true,
                                lineHeight: 30.0,
                                animationDuration: 2500,
                                percent: wazenresults[index].res/100,
                                center: Text(wazenresults[index].res.toString()+"%"),
                                barRadius: Radius.circular(8),
                                  linearGradient: LinearGradient(colors:
                                  [results[index].color.withOpacity(0.3),results[index].color.withOpacity(0.6),results[index].color])
                              ),
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
