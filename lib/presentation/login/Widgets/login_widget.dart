import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/data/repo/login_repo.dart';
import 'package:mutqen/data/webservice/login_services.dart';
import 'package:mutqen/presentation/routing/routing_screen.dart';
import 'package:mutqen/resources/common_widgets/alert_messages.dart';
import 'package:mutqen/resources/common_widgets/button_widget.dart';

import '../../../app/app_pref.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../navbar/navbar_screen.dart';

class LoginButton extends StatelessWidget {
  final formKey;
  TextEditingController emailController;
  TextEditingController passwordController;
  final context2;

  LoginButton(this.formKey, this.emailController, this.passwordController,
      this.context2);

  @override
  Widget build(BuildContext context) {
    return defaultButton(
        width: 300.w, function: () async {
      if (formKey.currentState!.validate()) {
        EasyLoading.show(status: "جاري تسجيل الدخول");
        AuthServices authServices = AuthServices();
        var response = await SignInRepo(authServices).signIn(emailController.text,
            passwordController.text);
        EasyLoading.dismiss();
        if(response is String)
        {
          showSnackBar(context: context, msg: "يوجد خطأ في البريد الالكتروني او كلمه المرور");
        }
        else
        {
          await AppPreferences().setUserLoggedIn();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) =>
              const routing_screen()), (Route<dynamic> route) => false);
        }
      }
    }, text: AppStrings.login.tr(), txtColor: Colors.white, height: 50.h, fontSize: 18.sp);

  }
}
