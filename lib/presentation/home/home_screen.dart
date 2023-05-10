import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/home/homecard_screen.dart';
import 'package:mutqen/resources/assets_manager.dart';
import 'package:mutqen/resources/common_widgets/app_bar.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../data/model/exam.dart';
import '../../data/model/user.dart';
import '../../resources/color_manager.dart';
import 'Widgets/main_drawer.dart';

class home_page extends StatefulWidget {
  User user;
  home_page(this.user, {Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState(user);
}

class _home_pageState extends State<home_page> {
  User user;
  _home_pageState(this.user);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon(AppStrings.home.tr(), context),
        drawer: MainDrawer(),
        body:
        Container(
          padding: EdgeInsets.only(top: 20),
          child: ListView.separated(
            padding:  EdgeInsets.only(bottom: 20),
            itemCount: exams.length,
            itemBuilder: (BuildContext context, int index) {
              return UnconstrainedBox(
                child: InkWell(
                  onTap: (){
                    PersistentNavBarNavigator.pushNewScreen(context, screen: homecard_page(index,exams[index]));
                  },
                  child: Container(
                    padding: EdgeInsets.all(9.0),
                    height: 185.h,
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
                          height: 35.h,
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
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(child: Text(exams[index].title,style: TextStyle(
                            fontSize: 15.sp,
                          ),
                          textAlign: TextAlign.center),),
                        ),
                        SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(exams[index].count.toString()+" سؤال" ,style: TextStyle(
                                fontSize: 15.sp
                            )),
                            SizedBox(width: 10,),
                            Hero(
                              tag: "Hero"+index.toString(),
                                child: Image.asset(ImageAssets.smallLogo,height: 80,width: 80,))
                          ],
                        ),
                        SizedBox(height: 8,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(exams[index].description,style: TextStyle(
                            color: Colors.black45,
                              fontSize: 12.sp
                          ),),
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
        ) ,
      ),
    );
  }
}
