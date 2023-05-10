import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class Date_Picker_Widget extends StatefulWidget {
  final  TextEditingController userNameController;
  final String title ;
  final IconData iconData ;
  final String validate;
  Date_Picker_Widget(this.userNameController,this.title , this.iconData ,this.validate, {Key? key}) : super(key: key);

  @override
  State<Date_Picker_Widget> createState() => _Date_Picker_WidgetState();
}

class _Date_Picker_WidgetState extends State<Date_Picker_Widget> {


  @override
  Widget build(BuildContext context) {
    bool shadowshowen = true;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        readOnly: true,
        validator: (value) {
          shadowshowen = false;
          if (value == null || value.isEmpty) {
            return widget.validate + widget.title;
          }
          return null;
        },
        onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2100));

            if (pickedDate != null) {
              print(
                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
              DateFormat('yyyy-MM-dd').format(pickedDate);
              print(
                  formattedDate); //formatted date output using intl package =>  2021-03-16
              setState(() {
                widget.userNameController.text =
                    formattedDate; //set output date to TextField value.
              });
            } else {}
        },
        controller: widget.userNameController,
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
        ),
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
