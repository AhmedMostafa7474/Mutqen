import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mutqen/resources/strings_manager.dart';

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
        appBar: AppBar(
          backgroundColor: ColorManager.primary,
          title: Text(AppStrings.home.tr()),
        ),
        drawer: MainDrawer(),
        body: ListView.separated(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Container(

            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 15,
            );
          },) ,
      ),
    );
  }
}
