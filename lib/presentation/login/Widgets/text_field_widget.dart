import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class Text_Field_Widget extends StatefulWidget {
  final  TextEditingController userNameController;
  final String title ;
  final IconData iconData ;
  final String validate;
  final bool obscure;
  const Text_Field_Widget(this.userNameController,this.title , this.iconData ,this.validate, this.obscure, {Key? key}) : super(key: key);

  @override
  State<Text_Field_Widget> createState() => _Text_Field_WidgetState(this.userNameController,this.title , this.iconData ,this.validate, this.obscure);
}

class _Text_Field_WidgetState extends State<Text_Field_Widget> {
  final  TextEditingController userNameController;
  final String title ;
  final IconData iconData ;
  final String validate;
  bool obscure;
  _Text_Field_WidgetState(this.userNameController,this.title , this.iconData ,this.validate, this.obscure);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validate;
          }
          return null;
        },
        controller: userNameController,
        obscureText: obscure,
        inputFormatters: title == AppStrings.age.tr() ? [LengthLimitingTextInputFormatter(3)]:null,
        textInputAction: title == AppStrings.password.tr() ? TextInputAction.done:TextInputAction.next,
        keyboardType: title == AppStrings.age.tr() ?TextInputType.number :TextInputType.text,
        decoration: InputDecoration(
            labelText: title,
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
            prefixIcon: Icon(iconData),
            suffixIcon: title == AppStrings.password.tr() ? IconButton(onPressed: (){

              setState(() {
                obscure = !obscure;
              });

            }, icon: Icon(obscure?Icons.visibility_off:Icons.visibility)) :null
        ),
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 5,
          offset: const Offset(0, 5),
        )
      ],
          borderRadius: BorderRadius.circular(15)),
    );
  }
}

// Widget userNameTextFormField(TextEditingController userNameController, String title , IconData iconData ,String validate, bool obscure ) {
//   return Container(
//     margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//     padding: EdgeInsets.all(12),
//     child: TextFormField(
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return validate;
//         }
//         return null;
//       },
//       controller: userNameController,
//       obscureText: obscure,
//
//       // keyboardType: TextInputType.phone,
//       decoration: InputDecoration(
//         labelText: title,
//         fillColor: Colors.white,
//         filled: true,
//         border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10.0),
//         ),
//         prefixIcon: Icon(iconData),
//         suffixIcon: title == AppStrings.password.tr() ? IconButton(onPressed: (){
//           obscure =!obscure;
//         }, icon: Icon(obscure?Icons.visibility_off:Icons.visibility))
//       ),
//     ),
//     decoration: BoxDecoration(boxShadow: [
//       BoxShadow(
//         color: Colors.black.withOpacity(0.1),
//         blurRadius: 20,
//         offset: const Offset(0, 5),
//       )
//     ],
//     borderRadius: BorderRadius.circular(15)),
//   );
// }