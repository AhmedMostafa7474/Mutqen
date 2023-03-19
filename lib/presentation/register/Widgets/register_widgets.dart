import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/resources/common_widgets/alert_messages.dart';
import 'package:mutqen/resources/common_widgets/button_widget.dart';

import '../../../data/repo/login_repo.dart';
import '../../../data/webservice/login_services.dart';
import '../../../resources/strings_manager.dart';
import '../../home/home_screen.dart';

class RegisterButton extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

   RegisterButton(this.formKey,this.usernamecontroller,this.emailcontroller ,this.agecontroller,this.passwordcontroller, BuildContext context,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return defaultButton( width: 300.w, function: () async {
      if (formKey.currentState!.validate()) {
        AuthServices authServices = AuthServices();
        var response = await SignInRepo(authServices).register(usernamecontroller.text, emailcontroller.text,int.parse(agecontroller.text), passwordcontroller.text);
        if(response == "Success")
          {
            var response = await SignInRepo(authServices).signIn(emailcontroller.text, passwordcontroller.text);
            if(response is String)
            {
              showSnackBar(context: context, msg: response);
            }
            else
            {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> home_page(response)));
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
