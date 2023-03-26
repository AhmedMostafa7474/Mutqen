import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mutqen/resources/color_manager.dart';

class result
{
  String title;
  String description;
  double res;
  Color color;
  result(this.title, this.description,this.res,this.color);
}
List<result> results=[result("الشخصيه المحققه", "المفكر - المستقصي",30,ColorManager.primary),
  result("الشخصيه الاجتماعيه", "المساعد",15,Colors.red),
  result("الشخصيه المبادره", "المقنع",20,Colors.orange),
  result("الشخصيه الواقعيه", "الواقعي",25,Colors.purple),
  result("الشخصيه الفنيه", "الفنان",10,Colors.blue)];