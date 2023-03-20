import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            fontFamily: 'Monadi',
            fontSize: 17,
            color: ColorManager.white,
            fontWeight: FontWeight.w200
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
                  width: 5,
                ),
                Text(
                  _username,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                      color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            AppStrings.home.tr(),
            CupertinoIcons.home,
                () {
            },
          ),
          buildListTile(
            AppStrings.task.tr(),
                FontAwesomeIcons.listCheck,
                () {
            },
          ),
          buildListTile(
            AppStrings.settings.tr(),
            Icons.settings,
                () {
            },
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