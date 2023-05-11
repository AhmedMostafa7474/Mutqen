import 'dart:ui';

import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';

class event
{
  String title;
  String seats;
  String place;
  String date;
  String image;
  DateTime dateTime = DateTime.now().add(Duration(days: 1));
  String instructor = "احمد مصطفي";
  String target = "ذكور واناث";
  Color color;
  event(this.title, this.seats, this.place, this.date,this.image,this.color);
}
List<event> events = [event("وازن", "15", "جماعه الملك فيصل", "20 مارس",
    ImageAssets.eventimage,ColorManager.greenlight),
  event("فرق", "100", "Online Workshop", "25 مارس",
      ImageAssets.eventimage2,ColorManager.bluelight),
  event("وازن", "25", "جماعه الملك فيصل", "1 ابريل",
      ImageAssets.eventimage,ColorManager.greenlight),
  event("فرق", "15", "Online Workshop", "20 مارس",
      ImageAssets.eventimage2,ColorManager.bluelight)
];

class eventdetails
{
  String title;
  String desc = "";
  IconData icon;

  eventdetails(this.title, this.icon);
}

List<eventdetails> eventdetailss = [eventdetails("تاريخ الفاعليه", Icons.date_range),
  eventdetails("المكان",  Icons.location_on),
  eventdetails("الساعه",  Icons.timer),
  eventdetails("عدد المقاعد",  Icons.event_seat),
  eventdetails("الميسر",  Icons.person),
  eventdetails("الحضور",  Icons.groups),
];