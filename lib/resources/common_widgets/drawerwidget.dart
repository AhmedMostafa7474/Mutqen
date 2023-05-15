import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/resources/color_manager.dart';

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