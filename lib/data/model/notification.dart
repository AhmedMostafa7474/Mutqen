import 'dart:ui';

import 'package:mutqen/resources/assets_manager.dart';
import 'package:mutqen/resources/color_manager.dart';

class notification
{
  String title;
  String desc;
  String image;
  String time;
  String sendby;
  Color color;

  notification(this.title, this.desc, this.image, this.time, this.sendby,this.color);
}

List<notification> notifications = [
  notification("ما هو الجزء الاكثر تحديا بالنسبه لك في الموقع ؟", "", ImageAssets.notificon, "منذ 3h", "احمد سيلمان",ColorManager.yellow2),
  notification("تهانينا !!!", "لقد اتممت فعاليه (برنامج اعمل بوعي - online workshop (مخصصه  للذكور والاناث) بنجاح",
      ImageAssets.notificon2, "منذ 5h", "احمد سيلمان",ColorManager.greenlight2),
  notification("ما هو الجزء الاكثر تحديا بالنسبه لك في الموقع ؟", "", ImageAssets.notificon, "منذ 8h", "احمد سيلمان",ColorManager.yellow2),
  notification("تهانينا !!!", "لقد اتممت فعاليه (برنامج اعمل بوعي - online workshop (مخصصه  للذكور والاناث) بنجاح",
      ImageAssets.notificon2, "منذ 12h", "احمد سيلمان",ColorManager.greenlight2)
];
