import 'dart:ui';

import 'package:mutqen/resources/assets_manager.dart';

import '../../resources/color_manager.dart';

class product
{
  String title;
  String hours;
  String audience;
  String image;
  Color color;

  product(this.title, this.hours, this.audience, this.image,this.color);
}


List<product> products = [
  product("فرق", "ساعتين", "جماهيري تفاعلي", ImageAssets.eventimage2,ColorManager.grey),
  product("وازن", "ساعتين", "جماهيري بأسلوب التيسير التعاوني", ImageAssets.eventimage,ColorManager.greenlight),
  product("فرق", "ساعتين", "جماهيري تفاعلي", ImageAssets.eventimage2,ColorManager.bluelight),
  product("وازن", "ساعتين", "جماهيري بأسلوب التيسير التعاوني", ImageAssets.eventimage,ColorManager.greenlight)
];