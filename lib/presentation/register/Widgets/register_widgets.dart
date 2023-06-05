import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/navbar/navbar_screen.dart';
import 'package:mutqen/resources/common_widgets/alert_messages.dart';
import 'package:mutqen/resources/common_widgets/button_widget.dart';

import '../../../app/app_pref.dart';
import '../../../data/repo/login_repo.dart';
import '../../../data/webservice/login_services.dart';
import '../../../resources/strings_manager.dart';

class RegisterButton extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController councontroller = TextEditingController();

   RegisterButton(this.formKey,this.usernamecontroller,this.emailcontroller ,this.citycontroller,
       this.passwordcontroller,this.gendercontroller,this.phonecontroller,this.datecontroller, BuildContext context, this.councontroller,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      defaultButton( width: 300.w, function: () async {
      if (formKey.currentState!.validate()) {
        EasyLoading.show(status: "جاري تسجيل مستخدم جديد");
        AuthServices authServices = AuthServices();
        var response = await SignInRepo(authServices).register(usernamecontroller.text, emailcontroller.text,
            citycontroller.text, passwordcontroller.text,gendercontroller.text,phonecontroller.text,
            datecontroller.text,councontroller.text);
        EasyLoading.dismiss();
        if(response == "Success")
          {
            var response = await SignInRepo(authServices).signIn(emailcontroller.text, passwordcontroller.text);
            if(response is String)
            {
              showSnackBar(context: context, msg: response);
            }
            else
            {
              await AppPreferences().setUserLoggedIn();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  nav_screen()), (Route<dynamic> route) => false);
            }
          }
        else
          {
            showSnackBar(context: context, msg: response);
          }
      }
    }, text: AppStrings.register.tr(), txtColor: Colors.white, height: 50.h, fontSize: 18.sp);
  }
}
