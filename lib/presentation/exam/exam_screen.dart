
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/data/model/exam.dart';
import 'package:mutqen/presentation/result/Multiple/preresult_screen.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../resources/assets_manager.dart';
import '../../resources/common_widgets/app_bar.dart';
import '../result/Fare2/result_screen.dart';

class exam_page extends StatefulWidget {
  exam examm;
  exam_page(this.examm, {Key? key}) : super(key: key);

  @override
  State<exam_page> createState() => _exam_pageState();
}

class _exam_pageState extends State<exam_page> {
  int itemindex= -1 ;
  final controller = PageController(
    initialPage: 0,
    keepPage: false
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
         appBar: getAppBarWidgetWithNotificationIcon("المقياس", context),
          body: PageView.builder(
            itemCount: (list.length / 2).ceil(),
            controller: controller,
            itemBuilder: (BuildContext context, int index1) {
              return Container(
                padding: EdgeInsets.only(top: 20),
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 20),
                  itemCount: (list.length.isOdd && (index1 + 1) == (list.length / 2).ceil())? 1: 2,
                  itemBuilder: (BuildContext context, int index2) {
                    return UnconstrainedBox(
                      child: Container(
                        padding: EdgeInsets.all(9.0),
                        height: 220.h,
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
                            Container(
                              height: 25.h,
                              width: 150.w,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(child: Text(
                                "سؤال " + (index2 + (index1 *2) + 1).toString(),
                                style: TextStyle(
                                    fontSize: 15.sp
                                ),),),
                            ),
                            SizedBox(height: 50,),
                            Text(list[index2 + (index1 *2)], style: TextStyle(fontSize: 18),),
                            SizedBox(height: 70,),
                            Container(
                              height: 40,
                              width: double.infinity,
                              child: ListView.separated(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      if(widget.examm.title == exams[3].title)
                                        PersistentNavBarNavigator.pushNewScreen(context, screen: preresult_page());
                                    //  PersistentNavBarNavigator.pushNewScreen(context, screen: result_page());
                                      setState(() {
                                        rate[index2 + (index1 *2)] = index+1;
                                      });
                                    },
                                    child: Container(
                                      height: 25.h,
                                      width: 40.w,
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          color: rate[index2 + (index1 *2)] == index+1 ? ColorManager.primary: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                          color: Colors.white70,
                                          borderRadius: BorderRadius.circular(
                                              8)),
                                      child: Center(child: Text(
                                        (index + 1).toString(),
                                        style: TextStyle(
                                            fontSize: 15.sp
                                            , color: Colors.black
                                        ),),),

                                    ),
                                  );
                                },
                                separatorBuilder: (BuildContext context,
                                    int index) {
                                  return SizedBox(width: 20,);
                                },),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 18,
                    );
                  },),
              );
            }
          ) ,
    )
    );
  }

  List<String> list=["قيادي حريص علي النتائج العمليه","يستمتع بمخالطه الاخرين","يعمل ضمن روتين محدد وواضح","سووو","بوووو","بوووو"];
  List<int> rate=[-1,-1,-1,-1,-1,-1];
}
