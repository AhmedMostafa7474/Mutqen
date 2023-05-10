import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mutqen/resources/common_widgets/app_bar.dart';
import 'package:mutqen/resources/strings_manager.dart';
import '../../data/model/user.dart';
import '../../resources/color_manager.dart';
import '../home/Widgets/main_drawer.dart';


class homee_page extends StatefulWidget {

  @override
  State<homee_page> createState() => _homee_pageState();
}

class _homee_pageState extends State<homee_page> {
  _homee_pageState();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon(AppStrings.home.tr(), context),
        drawer: MainDrawer(),
        body:Container(),
      ),
    );
  }
}
