import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:mutqen/resources/assets_manager.dart';

class result
{
  String title;
  String description;
  String subtitle ;
  double res;
  Color color;
  String image = "";
  List<resultdesc> resultdescription;
  result(
  this.title,
  this.description,
  this.res,
  this.color,
  this.resultdescription, {this.subtitle = "يرغب أصحاب هذه الشخصية بفهم واستكشاف الأشياء المحيطة بهم ، ويدفعهم حب العمل والتعلم."}
      );
}

class resultdesc
{
  String title;
  String description;
  String descrption2;
  IconData icon;
  resultdesc(this.title, this.description,this.descrption2,this.icon);
}