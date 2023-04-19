import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/app/app_pref.dart';
import 'package:mutqen/presentation/register/register_screen.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:mutqen/resources/assets_manager.dart';

import '../../resources/style_manager.dart';
import 'Widgets/login_widget.dart';
import 'Widgets/text_field_widget.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final formKey = GlobalKey<FormState>();

  var usernamecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(ImageAssets.smallLogo,height: 200.h, width: 200.w),
                Text_Field_Widget(usernamecontroller,AppStrings.userName.tr(),Icons.person,AppStrings.pleaseEnterYourUserName.tr(),
                    false),
                SizedBox(height: 8.h,),
                Text_Field_Widget(passwordcontroller,AppStrings.password.tr(),Icons.password,AppStrings.pleaseEnterYourUserName.tr(),true),
                SizedBox(height: 15.h,),
                LoginButton(formKey,usernamecontroller,passwordcontroller,context),
                SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.DontHave.tr()),
                    InkWell(
                      onTap: () async {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> register_page()));
                      },
                        child: Text(" "+AppStrings.register.tr() ,style: getRegularStyle(color: ColorManager.primary),))

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
