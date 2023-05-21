
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/data/model/exam.dart';
import 'package:mutqen/presentation/result/Wazen/result_screen2.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:mutqen/resources/common_widgets/button_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../resources/assets_manager.dart';
import '../../resources/common_widgets/alert_messages.dart';
import '../../resources/common_widgets/app_bar.dart';
import '../result/DISC/Widgets/disc_result_data.dart';
import '../result/DISC/disc_result_screen.dart';
import '../result/Fare2/Widgets/result_data.dart';
import '../result/Fare2/result_screen.dart';
import '../result/Multiple/preresult_screen.dart';

class exam_page2 extends StatefulWidget {
  exam examm;
  exam_page2(this.examm, {Key? key}) : super(key: key);

  @override
  State<exam_page2> createState() => _exam_page2State();
}

class _exam_page2State extends State<exam_page2> {
  List<int>selected= [0,0] ;
  int currentpage =1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final controller = PageController(
      initialPage: 0,
      keepPage: false
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: getAppBarWidgetWithNotificationIcon("المقياس", context),
          body: PageView.builder(
              onPageChanged: (i){
                selected[0]=0;
                selected[1]=0;
                currentpage = i +1;
                setState(() {

                });
              },
              itemCount: (widget.examm.questions.length / 2).ceil(),
              controller: controller,
              itemBuilder: (BuildContext context, int index1) {
                return Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 20),
                          itemCount: 2,
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
                                          offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                          color: Colors.white70,
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Center(child: Text(
                                        "سؤال " + (index2 + (index1 *2) + 1).toString(),
                                        style: TextStyle(
                                            fontSize: 15.sp
                                        ),),),
                                    ),
                                    SizedBox(height: 50,),
                                    Text(widget.examm.questions[index2 + (index1 *2)].Question, style: TextStyle(fontSize: 18.sp),),
                                    SizedBox(height: 60.h,),
                                    buildanswers(index2, index1),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 18.h,
                            );
                          },),
                        SizedBox(height: 12.h,),
                        currentpage != widget.examm.questions.length / 2.toInt()?
                Text("${currentpage} / ${(widget.examm.questions.length / 2).toInt()}"
                        ,style: TextStyle(
                            fontSize: 18.sp
                          ),):
                        defaultButton(width: 160.w,
                            function: (){
                                 if(widget.examm.questions.every((element) => element.selectedanswer != null))
                                   {
                                     Navigator.popUntil(context, (route) => route.isFirst);
                                     if(widget.examm.title == exams[0].title)
                                     {
                                       PersistentNavBarNavigator.pushNewScreen(context, screen: disc_result_page(disc_results));

                                     }
                                     else if(widget.examm.title == exams[1].title)
                                     {
                                       PersistentNavBarNavigator.pushNewScreen(context, screen: result_page2());
                                     }
                                     else if(widget.examm.title == exams[2].title)
                                     {
                                       PersistentNavBarNavigator.pushNewScreen(context, screen: result_page(results));
                                     }
                                     else if(widget.examm.title == exams[3].title)
                                     {
                                       PersistentNavBarNavigator.pushNewScreen(context, screen: preresult_page());
                                     }
                                   }
                                 else
                                   {
                                     showSnackBar(context: context, msg: "يرجي اجابه جميع الاسئله !");
                                   }
                            },
                            text: "حفظ النتائج", txtColor: Colors.white,
                            height: 40.h, fontSize: 17.sp)
                        ,
                        SizedBox(height: 30,)
                      ],
                    ),

                  ),
                );
              }
          ) ,
        );
  }
  Container buildanswers(int index2, int index1) {
              return Container(
                              height: 40.h,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Center(
                                child: ListView.separated(
                                  itemCount: widget.examm.questions[0].answers.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                          widget.examm.questions[index2 + (index1 *2)].answers.forEach((element) {
                                            element.selected =false;
                                          });
                                          widget.examm.questions[index2 + (index1 *2)].answers[index].selected = true;
                                          widget.examm.questions[index2 + (index1 *2)].selectedanswer= widget.examm.questions[index2 + (index1 *2)].answers[index].title;
                                          //rate[index2 + (index1 *2)] = index+1;
                                          selected[index2]=1;
                                          if(selected.every((element) => element == 1))
                                          {
                                            controller.nextPage(duration: Duration(milliseconds: 300),
                                                curve: Curves.linearToEaseOut
                                            );

                                          }
                                        //  print(selected);
                                        setState(() {
                                        });
                                      },
                                      child: Container(
                                        height: widget.examm.title == exams[0].title ||  widget.examm.title == exams[3].title? 25.h:30.h,
                                        width:  widget.examm.title == exams[0].title ||  widget.examm.title == exams[3].title? 40.w:75.w,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                          BoxShadow(
                                            color: widget.examm.questions[index2 + (index1 *2)].answers[index].selected?
                                            ColorManager.primary: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                            color: Colors.white70,
                                            borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: Center(child: Text(
                                          widget.examm.questions[index2 + (index1 *2)].answers[index].title!,
                                          style: TextStyle(
                                              fontSize: 15.sp
                                              , color: Colors.black
                                          ),),),

                                      ),
                                    );
                                  },

                                  separatorBuilder: (BuildContext context, int index) {
                                    return SizedBox(width: 20,);
                                  },),
                              ),
                            );
  }
}
