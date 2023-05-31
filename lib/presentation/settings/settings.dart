import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mutqen/presentation/login/login_screen.dart';
import 'package:mutqen/presentation/profile/profile_screen.dart';
import 'package:mutqen/resources/common_widgets/button_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/app_pref.dart';
import '../../business/bloc_initialze.dart';
import '../../business/cityBloc/citytext_cubit.dart';
import '../../business/filterBloc/advisorfilter_cubit.dart';
import '../../business/filterBloc/filter_cubit.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/common_widgets/app_bar.dart';
import '../../resources/common_widgets/drawerwidget.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';
import '../about/aboutUs_screen.dart';
import '../advisors/advisors_screen.dart';
import '../contactUs/contact_screen.dart';
import '../events/events_screen.dart';
import '../meetings/meetings_screen.dart';
import '../myevents/myevents_screen.dart';

bool notifySwitch = false;

class settingView extends StatefulWidget {
  @override
  State<settingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<settingView> {
  final _advancedDrawerController = AdvancedDrawerController();
  String? name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  load()
  async {
    name = await AppPreferences().getusername();
    setState(() {

    });
  }
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
            child: SingleChildScrollView (
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
                  SizedBox(
                    height: 10.h,
                  ),
                  buildListTile(
                    AppStrings.advisors.tr(),
                    Icons.groups_rounded,
                        () {

                      PersistentNavBarNavigator.pushNewScreen(context, screen:
                      BlocProvider(
                          create: (context) => AdvisorfilterCubit(),
                          child: advisors_page())
                      );
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
                      PersistentNavBarNavigator.pushNewScreen(context, screen: (
                          BlocProvider(
                              create: (context) => FilterCubit(),
                              child:events_page())
                      ));
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  buildListTile(
                    "فعالياتي",
                    Icons.event_available,
                        () {
                      PersistentNavBarNavigator.pushNewScreen(context, screen: (const myevents_page()));

                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  buildListTile(
                    AppStrings.Logout.tr(),
                    Icons.logout,
                        () async {
                      await AppPreferences().logout();
                      Navigator.of(context, rootNavigator: true)
                          .pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const login_page();
                          },
                        ),
                            (_) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text('الاعدادات'),
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
      body: Column(
        children: [
          SizedBox(height: 10,),
          Center(
            child: Hero(
                tag: "Hero777",
                child: Container(
                  height: 110.sp,
                  width: 110.sp,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(image: AssetImage(ImageAssets.meetingimage))
                  ),
                )
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: Text(
              name ?? "",
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: defaultButton(width: 140,
                function: (){
              PersistentNavBarNavigator.pushNewScreen(context, screen:   MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => blocGenerator().cityCubit),
                  BlocProvider(create: (context) => CitytextCubit())
                ],
                child: profile_page(),
              ),
              );
                },
                text: "تعديل الصفحه الشخصيه",
                txtColor: Colors.white,
                height: 40,
                fontSize: 13,
                background: ColorManager.primary
                ,radius: 5
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: itemms.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          if( itemms[index].title != "الاشعارات") {
                            PersistentNavBarNavigator.pushNewScreen(
                                context, screen: itemms[index].widget);
                          }
                          },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(itemms[index].icon),
                                  SizedBox(width: 20,),
                                  Text(itemms[index].title,style : getBoldtStyle(
                                    fontSize: 16.h,
                                    color: ColorManager.primary,
                                  ))
                                ],
                              ),
                            itemms[index].title != "الاشعارات" ? Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey,),
                            ) : Container(
                              child: Switch(
                                activeColor: ColorManager.green,
                                value: notifySwitch,
                                onChanged: (value) {
                                  setState(() {
                                    notifySwitch = value;
                                  });
                                },
                              ),
                            ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Divider(),
                          SizedBox(height:  itemms[index].title == "الاشعارات"? 0 :15,)
                        ],
                      );
                    },)

                ],
              ),
            ),
          )
        ],
      ),
    )
    );
  }
  List<itemss> itemms = [
    itemss("الاشعارات",Icons.notifications_active,const SizedBox()),
    itemss("عن التطبيق",Icons.info_outline,const about_page()),
    itemss("تواصل معنا", Icons.contact_support, contact_page()) ,
  ];
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();

  }
}

class itemss
{
  String title;
  IconData icon;
  Widget widget;
  itemss(this.title, this.icon, this.widget);
}
