import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mutqen/presentation/login/Widgets/text_field_widget.dart';
import 'package:mutqen/resources/common_widgets/button_widget.dart';

showAlertDialog(BuildContext context, TextEditingController textcontroller) {
  // set up the buttons
  Widget cancelButton (BuildContext context1)
  {
    return defaultButton(width: 100,
        function: () {
          Navigator.pop(context1);
        }, text: "الغاء",
        txtColor: Colors.white, height: 40, fontSize: 14,
    background: Colors.red);
  }
  Widget continueButton (BuildContext context1) {
    return  defaultButton(width: 100,
        function: () {
          Navigator.pop(context1);
        }, text: "تسجيل",
        txtColor: Colors.white, height: 40, fontSize: 14);
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
        title: Text("من فضلك اضف شرح لماذا تريد هذا الموعد ؟"),
        content: Text_Field_Widget(textcontroller, "الموضوع", Icons.question_answer, "", false,multi: true,),
        actions: [
          continueButton(context1),
          cancelButton(context1),
          SizedBox(height: 20,)
        ],
      );;
    },
  );
}