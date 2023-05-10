import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/advisors/advisors_screen.dart';
import 'package:mutqen/presentation/events/events_screen.dart';
import 'package:mutqen/presentation/meetings/meetings_screen.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:mutqen/resources/style_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../profile/profile_screen.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
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
            fontWeight: FontWeight.w200
          ),
        ),
    onTap: ()=> location() );
  }
  String _username= " ";
  Widget buildIcon(
      String title, String iconName, double size, Function location) {
    String name = "images/" + iconName;
    return ListTile(
      leading: ImageIcon(
        AssetImage(name),
        color: ColorManager.primary,
        size: size,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Monadi',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ColorManager.primary,
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _username = "";
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250.w,
      backgroundColor: Colors.black.withOpacity(0.3),
      child: Column(
        children: <Widget>[
          Container(
            height: 70.h,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            color: ColorManager.primary,
            // #A80F14 red
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 35.sp,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  "Omar Ahmed",
                  style: getRegularStyle(
                      font: FontWeight.w500,
                      fontSize: 18.sp,
                      color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          buildListTile(
            AppStrings.home.tr(),
            CupertinoIcons.home,
                () {
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          buildListTile(
            AppStrings.advisors.tr(),
                FontAwesomeIcons.listCheck,
                () {
                    PersistentNavBarNavigator.pushNewScreen(context, screen: advisors_page());
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          buildListTile(
            AppStrings.advices.tr(),
            Icons.question_answer,
                () {
                  PersistentNavBarNavigator.pushNewScreen(context, screen: (meetings_page()));

                },
          ),
          SizedBox(
            height: 15.h,
          ),
          buildListTile(
            AppStrings.events.tr(),
            Icons.event,
                () {
              PersistentNavBarNavigator.pushNewScreen(context, screen: (events_page()));

            },
          ),
          SizedBox(
            height: 15.h,
          ),
          buildListTile(
            AppStrings.settings.tr(),
            Icons.settings,
                () {
                  PersistentNavBarNavigator.pushNewScreen(context, screen: (profile_page()));

                },
          ),
          SizedBox(
            height: 15.h,
          ),
          buildListTile(
            AppStrings.Logout.tr(),
            Icons.logout,
                () async {
            },
          ),
        ],
      ),
    );
  }
}