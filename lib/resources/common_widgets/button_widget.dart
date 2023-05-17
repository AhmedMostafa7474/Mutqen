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
      Color borderColor =Colors.grey,
      TextStyle? txtStyle}) =>
    InkWell(
      onTap: (){
        function();
      },
      child: Container(
        width: width,
        height: height,
        alignment:Alignment.center,
        padding: EdgeInsets.only(
          bottom: 3
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: background,
            border: Border.all(width: 1.0, color: borderColor)
        ),
        child:  Text(
            text,
            style: txtStyle ?? TextStyle(color: txtColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w700
            ) ),

      ),
    );