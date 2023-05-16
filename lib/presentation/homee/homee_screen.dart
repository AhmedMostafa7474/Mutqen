import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mutqen/resources/common_widgets/app_bar.dart';
import 'package:mutqen/resources/common_widgets/button_widget.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:mutqen/resources/style_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../data/model/user.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../about/aboutUs_screen.dart';
import '../home/Widgets/main_drawer.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:mutqen/presentation/advisors/advisors_screen.dart';
import 'package:mutqen/presentation/events/events_screen.dart';
import 'package:mutqen/presentation/meetings/meetings_screen.dart';
import '../../resources/common_widgets/drawerwidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../profile/profile_screen.dart';
class homee_page extends StatefulWidget {
  @override
  State<homee_page> createState() => _homee_pageState();

}

class _homee_pageState extends State<homee_page> {
  final _advancedDrawerController = AdvancedDrawerController();

  _homee_pageState();
  List<Widget> imgList = [
    Stack(
      children: [
        Container(
          padding: EdgeInsets.all(9.0),
          height: 230.h,
          width: 290.w,
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Hero(
                    tag: "Hero",
                    child: Image.asset(
                      'assets/images/logomutqen2.png',
                      height: 120.sp,width: 120.sp,)),
              ),
              // const SizedBox(height: 8,),
               Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.event_seat,color: ColorManager.primatylight , size: 21.sp,),
                      const SizedBox(width: 10,),
                      Text("مقعد متاح : ",style: TextStyle(
                          color: ColorManager.primatylight,
                          fontSize: 18.sp
                      ),),
                      Text("0",style: TextStyle(
                          color: ColorManager.yellow,
                          fontSize: 16.sp
                      ),),
                    ],
                  ),
                ),
               Padding(
                  padding: const EdgeInsets.only(top: 9.0,right: 6.0),
                  child:
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(child: Icon(Icons.location_on,color: ColorManager.primatylight,size: 21.sp,))),
                      Expanded(
                        flex: 3,
                        child: Text("برنامج ",style: TextStyle(
                            color: ColorManager.primatylight,
                            fontSize: 18.sp
                        ),),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text("وازن",style: TextStyle(
                            color: ColorManager.yellow,
                            fontSize: 16.sp
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 82.h,
              width: 85.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white70,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Expanded(
                    child: Text("5",style: TextStyle(
                        fontSize: 21.sp,
                        color: Colors.black38
                    ),
                        textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                        color: ColorManager.primary,
                      ),
                      alignment: Alignment.center,

                      child: Text("April",style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white
                      ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
    Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(9.0),
          height: 240.h,
          width: 290.w,
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Hero(
                    tag: "Hero",
                    child: Image.asset(
                      'assets/images/faree2.png',
                      height: 120.sp,width: 120.sp,)),
              ),
              // const SizedBox(height: 8,),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Icon(Icons.event_seat,color: ColorManager.primatylight , size: 21.sp,),
                      const SizedBox(width: 10,),
                      Text("مقعد متاح : ",style: TextStyle(
                          color: ColorManager.primatylight,
                          fontSize: 18.sp
                      ),),
                      Text("0",style: TextStyle(
                          color: ColorManager.yellow,
                          fontSize: 16.sp
                      ),),
                    ],
                  ),
                ),
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(top: 9.0,right: 6.0),
                  child:
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(child: Icon(Icons.location_on,color: ColorManager.primatylight,size: 21.sp,))),
                      Expanded(
                        flex: 3,
                        child: Text("برنامج ",style: TextStyle(
                            color: ColorManager.primatylight,
                            fontSize: 18.sp
                        ),),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text("فرق",style: TextStyle(
                            color: ColorManager.yellow,
                            fontSize: 16.sp
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 82.h,
              width: 85.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white70,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Expanded(
                    child: Text("5",style: TextStyle(
                        fontSize: 21.sp,
                        color: Colors.black38
                    ),
                        textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                        color: ColorManager.primary,
                      ),
                      alignment: Alignment.center,

                      child: Text("April",style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white
                      ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
    Stack(
      children: [
        Container(
          padding: EdgeInsets.all(9.0),
          height: 240.h,
          width: 290.w,
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Hero(
                    tag: "Hero",
                    child: Image.asset(
                      'assets/images/wazenn.png',
                      height: 130.sp,width: 140.sp,)),
              ),
              // const SizedBox(height: 5,),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    children: [
                      Icon(Icons.event_seat,color: ColorManager.primatylight , size: 21.sp,),
                      const SizedBox(width: 5,),
                      Text("مقعد متاح : ",style: TextStyle(
                          color: ColorManager.primatylight,
                          fontSize: 18.sp
                      ),),
                      Text("0",style: TextStyle(
                          color: ColorManager.yellow,
                          fontSize: 16.sp
                      ),),
                    ],
                  ),
                ),
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0,right: 6.0),
                  child:
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(child: Icon(Icons.location_on,color: ColorManager.primatylight,size: 21.sp,))),
                      Expanded(
                        flex: 3,
                        child: Text("برنامج ",style: TextStyle(
                            color: ColorManager.primatylight,
                            fontSize: 18.sp
                        ),),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text("دال",style: TextStyle(
                            color: ColorManager.yellow,
                            fontSize: 16.sp
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 82.h,
              width: 85.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white70,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Expanded(
                    child: Text("8",style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.black38
                    ),
                        textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                        color: ColorManager.primary,
                      ),
                      alignment: Alignment.center,

                      child: Text("December",style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white
                      ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [ColorManager.primary,
              ColorManager.primatylight.withOpacity(0.8),
              ColorManager.primatylight.withOpacity(0.7),
            ],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 400),
      animateChildDecoration: true,
      rtlOpening: true,
      openRatio: 0.65,
      openScale: 0.8,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(

        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black,
            blurRadius: 1,
            blurStyle: BlurStyle.outer
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),

      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 20.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                      ImageAssets.smallLogo,height: 200.h, width: 200.w
                  ),
                ),
                buildListTile(
                  AppStrings.home.tr(),
                  CupertinoIcons.home,
                      () {
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                buildListTile(
                  AppStrings.advisors.tr(),
                  FontAwesomeIcons.listCheck,
                      () {
                    PersistentNavBarNavigator.pushNewScreen(context, screen: advisors_page());
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                buildListTile(
                  AppStrings.advices.tr(),
                  Icons.question_answer,
                      () {
                    PersistentNavBarNavigator.pushNewScreen(context, screen: (meetings_page()));

                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                buildListTile(
                  AppStrings.events.tr(),
                  Icons.event,
                      () {
                    PersistentNavBarNavigator.pushNewScreen(context, screen: (events_page()));

                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                buildListTile(
                  AppStrings.profile.tr(),
                  Icons.person,
                      () {
                    PersistentNavBarNavigator.pushNewScreen(context, screen: (const profile_page()));

                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                buildListTile(
                  "عن التطبيق",
                  Icons.info_outline,
                      () {
                    PersistentNavBarNavigator.pushNewScreen(context, screen: (const about_page()));

                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                buildListTile(
                  AppStrings.Logout.tr(),
                  Icons.logout,
                      () async {
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text('الرئيسية'),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 2,color: Colors.orange,width: 37,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('أحدث الفعاليات',
                    style: getBoldtStyle(
                        color: Colors.black54,fontSize: 22.sp,
                    ),),
                  ),
                  Container(height: 2,color: Colors.orange,width: 37,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 5),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 245.h,
                    aspectRatio: 0.6,
                    enlargeFactor: 0.3,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    initialPage: 1,
                    autoPlay: true,
                  ),
                  items: imgList,
                ),
              ),
              defaultButton(width: 160.w, function: (){
                PersistentNavBarNavigator.pushNewScreen(context, screen: const events_page());},
                  text: "المزيد من الفعاليات", txtColor: ColorManager.white, height: 32.h,
                  fontSize: 16.sp),
              SizedBox(height: 15.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 2,color: Colors.orange,width: 37,),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text('إستشارات',
                      style: getBoldtStyle(
                        color: Colors.black54,fontSize: 22.sp,
                      ),),),
                  Container(height: 2,color: Colors.orange,width: 37,),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0,bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(ImageAssets.HomepageMeeting1),
                      Padding(

                          padding: const EdgeInsets.only(top: 10),
                          child: Text('لديك سؤال عن مستقبلك المهنى ؟',
                            style: getBoldtStyle(
                              color: Colors.orange.shade700,fontSize: 17.sp,
                            ),),
                      ),
                      Text('تمكنك هذه الاستشارات من',
                            style: getBoldtStyle(
                              color: Colors.blue.shade400,fontSize: 15.sp,
                            ),),
                      Text('التخطيط الجيد لتحديد المسار المهنى المناسب لك',
                        style: getBoldtStyle(
                          color: Colors.black54,fontSize: 12.sp,
                        ),),
                      Text('التعرف على مفاتيح النجاح فى المقابلات الوظيفية ',
                        style: getBoldtStyle(
                          color: Colors.black54,fontSize: 12.sp,
                        ),),
                      Text('إعداد وكتابة السيرة الذاتية',
                        style: getBoldtStyle(
                          color: Colors.black54,fontSize: 12.sp,
                        ),),



                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: defaultButton(width: 160.w, function: (){
                  PersistentNavBarNavigator.pushNewScreen(context, screen: const advisors_page());
                  },
                    text: "احجز جلستك الآن!", txtColor: ColorManager.white, height: 32.h,
                    fontSize: 16.sp,background: Colors.orange),
              ),

            ],
          ),
        ),
      ),
    );

  }
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();

  }
}
