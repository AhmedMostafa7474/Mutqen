import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color_manager.dart';

Widget defaultButton(
    {
      required double width,
      Color background =  ColorManager.primary,
      required Function function,
      required String text,
      required Color txtColor,
      required double height,
      double radius =18.0,
      required double fontSize,
      Color borderColor =Colors.greenAccent,
      TextStyle? txtStyle}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: background,
          border: Border.all(width: 1.0, color: borderColor)),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text,
          style: txtStyle ?? TextStyle(color: txtColor, fontSize: fontSize,),
        ),
      ),
    );