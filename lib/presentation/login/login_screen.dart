import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:mutqen/resources/assets_manager.dart';

import '../../resources/style_manager.dart';
import 'Widgets/text_field_widget.dart';
import 'Widgets/text_field_widget2.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {

  var usernamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImageAssets.smallLogo,height: 300, width: 300,),
          userNameTextFormField(usernamecontroller),
          SizedBox(height: 12,),
          Container(
            width: 350,
            child: CustomShadowFormTextField(

              textEditingController: usernamecontroller,
              showStickyLabel: true,
              labelText: AppStrings.userName,
              stickyLabelStyle: getRegularStyle(color: Colors.grey),
              isMandatory: true,
              maxLines: 1,
              isEditable: true,
              worksAsPopup: false,
              obscureText: false,
              hintText: AppStrings.pleaseEnterYourUserName,
              validator: (String? value) {
                if (value == null || value.trim().isEmpty) {
                  return AppStrings.pleaseEnterYourUserName;
                } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                    .hasMatch(value)) {
                  return "${AppStrings.pleaseEnterYourUserName}  'Voithy@gmail.com'";
                }
                return null;
              },
              onValueChanged: (value) {

              },
              onSaved: (String? value) {

              },
            ),
          )
        ],
      ),
    );
  }
}
