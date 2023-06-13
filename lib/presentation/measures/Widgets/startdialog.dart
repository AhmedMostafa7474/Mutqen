import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mutqen/data/model/exam.dart';
import 'package:mutqen/presentation/login/Widgets/text_field_widget.dart';
import 'package:mutqen/resources/common_widgets/button_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../resources/color_manager.dart';
import '../../exam/exam2_screen.dart';

showStartDialog(BuildContext context, exam examm) {
  // set up the buttons
  Widget continueButton (BuildContext context1) {
    return  defaultButton(width: 120,
        function: () {
          Navigator.pop(context1);
          if(examm.title == exams[1].title || examm.title == exams[2].title)
              PersistentNavBarNavigator.pushNewScreen(context, screen: exam_page2(examm));
          else
              PersistentNavBarNavigator.pushNewScreen(context, screen: exam_page2(examm));
        }, text: "ابدأ",
        txtColor: ColorManager.white,
        height: 40, fontSize: 14,background: ColorManager.yellow,borderColor: ColorManager.yellow);
  }
  // set up the AlertDialog

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context1) {
      return  AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        contentPadding: EdgeInsets.all( 10.0),
        title: Center(child: Text("تعليمات المقياس",style: TextStyle(color: ColorManager.primatylight2),)),
        content: Text(examm.helpText),
        actions: [
          Center(child: continueButton(context1)),
          SizedBox(height: 20,)
        ],
      );;
    },
  );
}