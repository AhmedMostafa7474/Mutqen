import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class Text_Field_Widget extends StatefulWidget {
  final  TextEditingController userNameController;
  final String title ;
  final IconData iconData ;
  final String validate;
  bool obscure;
  bool multi ;

   Text_Field_Widget(this.userNameController,this.title ,
       this.iconData ,this.validate, this.obscure, {Key? key,this.multi =false}) : super(key: key);

  @override
  State<Text_Field_Widget> createState() => _Text_Field_WidgetState();
}

class _Text_Field_WidgetState extends State<Text_Field_Widget> {
  bool shadowshowen = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(boxShadow:[
       BoxShadow(
          color: shadowshowen?Colors.grey.withOpacity(0.3): Colors.grey.withOpacity(0.2),
          blurRadius: 5,
          offset: const Offset(0, 5),
        )
      ],
          borderRadius: BorderRadius.circular(15)),
      child: TextFormField(

        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines:widget.multi? 5: 1,
        validator: (value) {
          shadowshowen = false;
          if (value == null || value.isEmpty) {
            return widget.validate + widget.title;
          }
          else if(!value.isValidEmail() &&
              widget.title == AppStrings.email.tr())
            {
              return "قم يادخال بريد الكتروني صحيح" ;
            }
          else if(value.length < 8 &&
              widget.title == AppStrings.password.tr())
          {
            return "كلمه المرور يجب ان تكون ٨ احرف او اكثر" ;
          }
          return null;
        },
        controller: widget.userNameController,
        obscureText: widget.obscure,
        textInputAction: widget.title == AppStrings.password.tr() ? TextInputAction.done:TextInputAction.next,
        decoration: InputDecoration(
            labelText: widget.title,
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(width: 1, color: Colors.transparent)
            ) ,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
               borderSide: BorderSide(width: 3, color: Colors.greenAccent)
            ),
            prefixIcon: Icon(widget.iconData),
            suffixIcon: widget.title == AppStrings.password.tr() ? IconButton(onPressed: (){

              setState(() {
                widget.obscure = !widget.obscure;
              });

            }, icon: Icon(widget.obscure?Icons.visibility_off:Icons.remove_red_eye_rounded)) :null
        ),
      ),
    );
  }
}
extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
