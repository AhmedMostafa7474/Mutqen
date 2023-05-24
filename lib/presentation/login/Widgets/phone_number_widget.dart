import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumber_widget extends StatefulWidget {
  TextEditingController phonecontroller;
  final String validate;
  final String title;

  PhoneNumber_widget(this.phonecontroller, this.validate, this.title,{Key? key,}) : super(key: key);

  @override
  State<PhoneNumber_widget> createState() => _PhoneNumber_widgetState();
}

class _PhoneNumber_widgetState extends State<PhoneNumber_widget> {
  bool shadowshowen = true;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(boxShadow:[
        BoxShadow(
          color: shadowshowen?Colors.grey.withOpacity(0.2): Colors.grey.withOpacity(0.2),
          blurRadius: 15,
          offset: const Offset(0, 5),
        )
      ],
          borderRadius: BorderRadius.circular(15)),
      child: IntlPhoneField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          shadowshowen = false;
          if (value == null ||value.number.isEmpty ) {
            return widget.validate + widget.title;
          }
          return null;
        },
        disableLengthCheck: false,
        invalidNumberMessage: "رقم هاتف غير صحيح",
        decoration: InputDecoration(
          labelText: "رقم الهاتف",
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
        ),
        initialCountryCode: 'IN',
        onChanged: (phone) {
          widget.phonecontroller.text = phone.completeNumber;
        },
      ),
    );
  }
}
