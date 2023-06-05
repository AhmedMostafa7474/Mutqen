import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:mutqen/app/app_pref.dart';
import 'package:mutqen/presentation/contactUs/contact_screen.dart';
import 'package:mutqen/presentation/login/login_screen.dart';
import 'package:mutqen/presentation/myevents/myevents_screen2.dart';
import 'package:mutqen/resources/assets_manager.dart';
import 'package:mutqen/resources/common_widgets/app_bar.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../business/filterBloc/advisorfilter_cubit.dart';
import '../../business/filterBloc/filter_cubit.dart';
import '../../data/model/exam.dart';
import '../../data/model/user.dart';
import '../../resources/color_manager.dart';
import '../../resources/common_widgets/animated_drawer.dart';
import '../../resources/common_widgets/drawerwidget.dart';
import '../about/aboutUs_screen.dart';
import '../advisors/advisors_screen.dart';
import '../events/events_screen.dart';
import '../meetings/meetings_screen.dart';
import '../myevents/myevents_screen.dart';
import '../products/products_screen.dart';
import '../profile/profile_screen.dart';
import 'Widgets/main_drawer.dart';
import 'measurecard_screen.dart';

class measures_page extends StatefulWidget {
  measures_page( {Key? key}) : super(key: key);

  @override
  State<measures_page> createState() => _measures_pageState();
}

class _measures_pageState extends State<measures_page> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return  animated_drawer(
      SafeArea(
        child: Scaffold(
          appBar: AppBar(title :Text(AppStrings.task.tr()),
          centerTitle: true,
            leading: IconButton(
              onPressed: ()=> _advancedDrawerController.showDrawer(),
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
          ),
          body:
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.separated(
              padding:  const EdgeInsets.only(bottom: 20),
              itemCount: exams.length,
              itemBuilder: (BuildContext context, int index) {
                return UnconstrainedBox(
                  child: InkWell(
                    onTap: (){
                      PersistentNavBarNavigator.pushNewScreen(context, screen: homecard_page(index,exams[index]));
                    },
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(9.0),
                          height: 200.h,
                          width: 300.w,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("${exams[index].count} سؤال" ,style: TextStyle(
                                      fontSize: 15.sp,
                                  )),
                                  SizedBox(width: 80.w,),
                                  Hero(
                                    tag: "exam$index",
                                      child: Lottie.asset(exams[index].image,width: 120.sp,height: 120.sp)
                                  )
                                ],
                              ),
                               SizedBox(height: 7.h,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(exams[index].description,style: TextStyle(
                                  color: Color(0xff5F6980),
                                    fontSize: 12.sp,
                                  fontWeight: FontWeight.w400
                                ),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 35.h,
                          width: 150.w,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(child: Text(exams[index].title,style: TextStyle(
                            fontSize: 15.sp,
                            color: ColorManager.primatylight2,
                            fontWeight: FontWeight.w700
                          ),
                              textAlign: TextAlign.center),),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return  SizedBox(
                  height: 18.h,
                );
              },),
          ) ,
        ),
      ),_advancedDrawerController
    );
  }
}
