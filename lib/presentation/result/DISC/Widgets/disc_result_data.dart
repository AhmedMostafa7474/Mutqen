import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mutqen/resources/color_manager.dart';

import '../../../../data/model/result.dart';

List<resultdesc> disc_result_des= [
  resultdesc("مسيطرومباشر",
       "",
       " يركز علي النتائج\n يفضل الإقدام علي الفعل بدلا من التخطيط \n يحب مواجهه التحديات و الإقدام علي المخاطر \n سرعة في تقييم المواقف و يحدد مسار العمل اللازم لتخطيه \n حازم مباشر منافس و لايحب إضاعه الوقت  \n يرغب دلئما في الحصول علي الاجابات المباشرة,عصاميون يتحدون الوضع الراهن \n لديهم ثقه فطريه بأنفسهم في تحقيق الأهداف الصعبه",
       Icons.accessibility_new_sharp),



];
List<result> disc_results=[
  result("D", "مسيطر و مباشر و حازم",30,ColorManager.D,disc_result_des),
  result("C", "وجداني و حذر و مستقيم",15,ColorManager.C,disc_result_des),
  result("I", "تفاعلي و ملهم و عفوي",20,ColorManager.I,disc_result_des),
  result("S", "داعم و مخلص ومتعاطف",25,ColorManager.S,disc_result_des),

];
