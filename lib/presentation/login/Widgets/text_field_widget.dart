import 'package:flutter/material.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

Widget userNameTextFormField(TextEditingController userNameController) {
  return Container(
    margin: EdgeInsets.only(
        left: 20, right: 20, top: 20),
    child: TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.pleaseEnterYourUserName.tr();
        }
        return null;
      },
      controller: userNameController,
      // keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: AppStrings.userName.tr(),
        fillColor: Colors.white,
        filled: true,
      ),
    ),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ],
    borderRadius: BorderRadius.all(Radius.circular(30))),
  );
}