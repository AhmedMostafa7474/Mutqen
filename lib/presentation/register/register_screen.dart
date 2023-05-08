import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/login/Widgets/country_picker_widget.dart';
import 'package:mutqen/presentation/login/Widgets/date_picker_widget.dart';
import 'package:mutqen/presentation/login/Widgets/drop_down_widget.dart';
import 'package:mutqen/presentation/login/login_screen.dart';
import 'package:mutqen/presentation/register/Widgets/register_widgets.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';
import '../login/Widgets/login_widget.dart';
import '../login/Widgets/text_field_widget.dart';
import 'Widgets/register_data.dart';

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
  var countrycontroller = TextEditingController();
  var collegecontroller = TextEditingController();
  var universitycontroller = TextEditingController();
  var yearcontroller = TextEditingController();
  var gendercontroller = TextEditingController();
  var datecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child:  Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Form(
            key: formKey ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(ImageAssets.smallLogo,height: 140.h, width: 200.w),
                Text_Field_Widget(usernamecontroller,AppStrings.userName.tr(),Icons.person,AppStrings.pleaseEnterYourUserName.tr(),false),
                SizedBox(height: 8.h,),
                Text_Field_Widget(emailcontroller,AppStrings.email.tr(),Icons.email,AppStrings.pleaseEnterYourUserName.tr(),false),
                SizedBox(height: 8.h,),
                Country_Picker_Widget(countrycontroller, AppStrings.country.tr(), Icons.flag, AppStrings.pleaseEnterYourUserName.tr()),
               // Drop_Down_Widget(countrycontroller, AppStrings.country.tr(), Icons.flag, AppStrings.pleaseEnterYourUserName.tr(),countryitems),
                SizedBox(height: 8.h,),
                Drop_Down_Widget(universitycontroller, AppStrings.university.tr(), Icons.school, AppStrings.pleaseEnterYourUserName.tr(),countryitems),
                SizedBox(height: 8.h,),
                Drop_Down_Widget(collegecontroller, AppStrings.college.tr(), Icons.school, AppStrings.pleaseEnterYourUserName.tr(),countryitems),
                SizedBox(height: 8.h,),
                Drop_Down_Widget(yearcontroller, AppStrings.studentyear.tr(), Icons.school, AppStrings.pleaseEnterYourUserName.tr(),countryitems),
                SizedBox(height: 8.h,),
                Drop_Down_Widget(gendercontroller, AppStrings.gender.tr(), Icons.group, AppStrings.pleaseEnterYourUserName.tr(),Genderitems),
                SizedBox(height: 8.h,),
                Date_Picker_Widget(datecontroller, AppStrings.birthday.tr(), Icons.date_range,
                    AppStrings.pleaseEnterYourUserName.tr()),
                SizedBox(height: 8.h,),
                Text_Field_Widget(passwordcontroller,AppStrings.password.tr(),Icons.password,AppStrings.pleaseEnterYourUserName.tr(),true),
                SizedBox(height: 15.h,),
                RegisterButton(formKey,usernamecontroller,emailcontroller,agecontroller,passwordcontroller,context),
                SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.YouHave.tr()),
                    InkWell(
                        onTap: () async {
                          Navigator.of(context).pop();
                        },
                        child: Text(" "+AppStrings.login.tr() ,style: getRegularStyle(color: ColorManager.primary),))

                  ],
                )
                ,
                SizedBox(height: 15.h,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
