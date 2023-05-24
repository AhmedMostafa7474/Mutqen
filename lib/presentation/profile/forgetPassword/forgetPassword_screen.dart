import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../business/profileBloc/profile_cubit.dart';
import '../../../resources/common_widgets/app_bar.dart';
import '../../../resources/common_widgets/button_widget.dart';
import '../../../resources/strings_manager.dart';
import '../../login/Widgets/text_field_widget.dart';

class forgetPassword_page extends StatefulWidget {
  const forgetPassword_page({Key? key}) : super(key: key);
  @override
  State<forgetPassword_page> createState() => _forgetPassword_pageState();
}

class _forgetPassword_pageState extends State<forgetPassword_page> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var passwordcontroller = TextEditingController();
    var newpasswordcontroller = TextEditingController();
    var reenterpasswordcontroller = TextEditingController();
    return Scaffold(
      appBar:
      getAppBarWidgetWithNotificationIcon("تغيير كلمه المرور", context),
      body: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if(state is ProfileLoaded){
              return
                SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      Text_Field_Widget(
                        passwordcontroller,
                        AppStrings.oldPassword.tr(),
                        Icons.lock,

                        AppStrings.pleaseEnterYourUserName.tr(),
                        true,readonly: true,),
                      SizedBox(height: 8.h,),
                      Text_Field_Widget(
                        newpasswordcontroller,
                        AppStrings.newPassword.tr(),
                        Icons.lock,
                        AppStrings.pleaseEnterYourUserName.tr(),
                        false,readonly: true,),
                      SizedBox(height: 8.h,),
                      Text_Field_Widget(
                        reenterpasswordcontroller,
                        AppStrings.reEnterNewPassword.tr(),
                        Icons.lock,
                        AppStrings.pleaseEnterYourUserName.tr(),
                        false,readonly: true,passwordController: newpasswordcontroller),

                      SizedBox(height: 25.h,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: defaultButton(
                            width: 200.w,
                            function: () async {
                              if (formKey.currentState!.validate()) {}
                            },
                            text: "حفظ",
                            txtColor: Colors.white,
                            height: 45.h,
                            fontSize: 22.sp
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            else
            {
              return Container();
            }

          },
        ),
      ),
    );
  }
}
