import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mutqen/resources/common_widgets/app_bar.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../data/model/user.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../home/Widgets/main_drawer.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:mutqen/presentation/advisors/advisors_screen.dart';
import 'package:mutqen/presentation/events/events_screen.dart';
import 'package:mutqen/presentation/meetings/meetings_screen.dart';

import '../profile/profile_screen.dart';
class homee_page extends StatefulWidget {
  @override
  State<homee_page> createState() => _homee_pageState();
}

class _homee_pageState extends State<homee_page> {
  final _advancedDrawerController = AdvancedDrawerController();

  _homee_pageState();

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
      animationDuration: const Duration(milliseconds: 300),
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
                    bottom: 60.0,
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
                    PersistentNavBarNavigator.pushNewScreen(context, screen: (profile_page()));

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
          title: const Center(child: Text('الرئيسية')),
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
        body: Container(),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
Widget buildListTile(String title, IconData icon, Function location) {
  return ListTile(
      leading: Icon(
        icon,
        size: 24.sp,
        color: ColorManager.white,
      ),
      title: Text(

        title,
        style: TextStyle(
            fontFamily: 'Monadi',
            fontSize: 17.sp,
            color: ColorManager.white,
            fontWeight: FontWeight.w200,

        ),
      ),

      onTap: ()=> location() );
}