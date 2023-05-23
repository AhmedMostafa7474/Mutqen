
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color_manager.dart';
import '../strings_manager.dart';

PreferredSizeWidget getAppBarWidgetWithNotificationIcon(String title,BuildContext context) {
  return AppBar(
    elevation: 0,
    // leading: IconButton(
    //   icon: const Icon(Icons.arrow_back_sharp, color: Colors.white),
    //   onPressed: () => Navigator.pop(context),
    // ),
    actions: [
      IconButton(
        icon: const Icon(
          Icons.notifications_none,
          color: Colors.white,
        ),
        onPressed: () {
          // do something
        },
      )
    ],
    backgroundColor: ColorManager.primary,
    centerTitle: true,
    title:  Text(title),
  );
}