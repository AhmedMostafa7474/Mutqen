import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:mutqen/resources/style_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget buildListTile(String title, IconData icon, Function location) {
    return ListTile(
        leading: Icon(
          icon,
          size: 24,
          color: ColorManager.white,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorManager.white,
          ),
        ),);
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
          fontFamily: 'RobotoCondensed',
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
      backgroundColor: Colors.black.withOpacity(0.3),
      child: Column(
        children: <Widget>[
          Container(
            height: 70,
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
                    size: 35,
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
            'Home',
            Icons.home,
                () {
            },
          ),
          buildListTile(
            'Subscription',
            Icons.subscriptions_rounded,
                () {
            },
          ),
          buildListTile(
            'Metro Map',
            Icons.map,
                () {
            },
          ),
          buildListTile(
            'Contact Us',
            Icons.support_agent_rounded,
                () {
            },
          ),
          buildListTile(
            'Settings',
            Icons.settings,
                () {
            },
          ),
          buildListTile(
            'Log Out',
            Icons.logout,
                () async {
            },
          ),
        ],
      ),
    );
  }
}