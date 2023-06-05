import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/app/app_pref.dart';
import 'package:mutqen/business/bloc_initialze.dart';
import 'package:mutqen/business/cityBloc/city_cubit.dart';
import 'package:mutqen/business/cityBloc/citytext_cubit.dart';
import 'package:mutqen/data/repo/city_repo.dart';
import 'package:mutqen/presentation/register/register_screen.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:mutqen/resources/common_widgets/button_widget.dart';
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
    return
      Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(ImageAssets.smallLogo,height: 120.sp, width: 120.sp,color: ColorManager.primary,fit: BoxFit.cover,),
                Text("أهلاً بك فى متقن",style: TextStyle(fontSize: 30,

                    color: ColorManager.primary,
                    fontWeight: FontWeight.w700,
                )),
                Text_Field_Widget(usernamecontroller,AppStrings.email.tr(),Icons.email,AppStrings.pleaseEnterYourUserName.tr(),
                    false),
                SizedBox(height: 8.h,),
                Text_Field_Widget(passwordcontroller,AppStrings.password.tr(),Icons.password,AppStrings.pleaseEnterYourUserName.tr(),true),
                SizedBox(height: 15.h,),
                LoginButton(formKey,usernamecontroller,passwordcontroller,context),
                SizedBox(height: 14.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.DontHave.tr(),
                        style: getRegularStyle(color: Colors.black,fontSize: 18)),
                    InkWell(
                      onTap: () async {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MultiBlocProvider(
                          providers: [
                            BlocProvider(create: (context) => blocGenerator().cityCubit),
                            BlocProvider(create: (context) => CitytextCubit()),
                          ],
                          child: register_page(),
                        )));
                      },
                        child: Text(" "+AppStrings.register.tr()
                          ,style: getRegularStyle(color: ColorManager.primary,fontSize: 18),))

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
