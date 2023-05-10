import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class Drop_Down_Widget extends StatefulWidget {
  final  TextEditingController userNameController;
  final String title ;
  final IconData iconData ;
  final String validate;
  final List<String> items;
  const Drop_Down_Widget(this.userNameController,this.title , this.iconData ,this.validate,this.items, {Key? key}) : super(key: key);

  @override
  State<Drop_Down_Widget> createState() => _Drop_Down_WidgetState();
}

class _Drop_Down_WidgetState extends State<Drop_Down_Widget> {
  bool shadowshowen = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: DropdownButtonFormField<String>(
        validator: (value) {
          shadowshowen = false;
          if (value == null ) {
            return widget.validate + widget.title;
          }
          return null;
        },
          autovalidateMode: AutovalidateMode.onUserInteraction,
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

        ), onChanged: (value) {  },
          items: widget.items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList()
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(

          color: shadowshowen?Colors.grey.withOpacity(0.3): Colors.grey.withOpacity(0.2),
          blurRadius: 5,
          offset: const Offset(0, 5),
        )
      ],
          borderRadius: BorderRadius.circular(15)),
    );
  }
}