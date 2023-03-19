import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/login/login_screen.dart';
import 'package:mutqen/presentation/register/Widgets/register_widgets.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';
import '../login/Widgets/login_widget.dart';
import '../login/Widgets/text_field_widget.dart';

class register_page extends StatefulWidget {
  const register_page({Key? key}) : super(key: key);

  @override
  State<register_page> createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {
  final formKey = GlobalKey<FormState>();

  var usernamecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var agecontroller = TextEditingController();
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
                Text_Field_Widget(usernamecontroller,AppStrings.userName.tr(),Icons.person,AppStrings.pleaseEnterYourUserName.tr(),false),
                SizedBox(height: 8.h,),
                Text_Field_Widget(emailcontroller,AppStrings.email.tr(),Icons.email,AppStrings.pleaseEnterYouremail.tr(),false),
                SizedBox(height: 8.h,),
                Text_Field_Widget(agecontroller,AppStrings.age.tr(),Icons.numbers,AppStrings.pleaseEnterYourage.tr(),false),
                SizedBox(height: 8.h,),
                Text_Field_Widget(passwordcontroller,AppStrings.password.tr(),Icons.password,AppStrings.pleaseEnterYourpassword.tr(),true),
                SizedBox(height: 15.h,),

                RegisterButton(formKey,usernamecontroller,emailcontroller,agecontroller,passwordcontroller,context),
                SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.YouHave.tr()),
                    InkWell(
                        onTap: () async {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> login_page()));
                        },
                        child: Text(" "+AppStrings.login.tr() ,style: getRegularStyle(color: ColorManager.primary),))

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
