import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mutqen/business/bloc_initialze.dart';
import 'package:mutqen/presentation/home/home_screen.dart';
import 'package:mutqen/presentation/login/login_screen.dart';
import 'package:mutqen/presentation/profile/profile_screen.dart';
import 'package:mutqen/presentation/register/register_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../data/model/user.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../homee/homee_screen.dart';
import 'Widgets/onwillpop_widget.dart';

class nav_screen extends StatefulWidget {
  const nav_screen({Key? key}) : super(key: key);

  @override
  State<nav_screen> createState() => _nav_screenState();
}

class _nav_screenState extends State<nav_screen> {
  PersistentTabController _controller=PersistentTabController(initialIndex: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => blocGenerator().profileCubit),
      ],
  child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: false, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.simple,
        onItemSelected: (index)
        {
          if (index == 2)
            {
              EasyLoading.show(status: "جاري تحميل الصفحه الشخصيه");
              Timer(Duration(seconds: 1), () {
                EasyLoading.dismiss();
              });
            }
        },// Choose the nav bar style with this property.
),
);
  }
  List<Widget> _buildScreens() {
    return [
      homee_page(),
      home_page(),
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => blocGenerator().cityCubit)
        ],
  child: profile_page(),
),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: (AppStrings.home.tr()),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesomeIcons.listCheck),
        title: (AppStrings.task.tr()),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: (AppStrings.profile.tr()),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      )
    ];
  }

}