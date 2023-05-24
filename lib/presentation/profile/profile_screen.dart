import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mutqen/business/profileBloc/profile_cubit.dart';
import 'package:mutqen/business/profileBloc/profile_cubit.dart';
import 'package:mutqen/resources/common_widgets/app_bar.dart';

import '../../resources/assets_manager.dart';
import '../../resources/common_widgets/button_widget.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';
import '../login/Widgets/country_picker_widget.dart';
import '../login/Widgets/drop_down_widget.dart';
import '../login/Widgets/phone_number_widget.dart';
import '../login/Widgets/text_field_widget.dart';
import '../register/Widgets/register_data.dart';

class profile_page extends StatefulWidget {
  const profile_page({Key? key}) : super(key: key);

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  File? image;
  var imagePicker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  var usernamecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var countrycontroller = TextEditingController();
  var phonecontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Load();
  }
  Future<void> Load()
  async {
    await BlocProvider.of<ProfileCubit>(context).GetProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      getAppBarWidgetWithNotificationIcon(AppStrings.profile.tr(), context),
      body: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if(state is ProfileLoaded){
              EasyLoading.dismiss();
              usernamecontroller.text = state.profile!.name;
              emailcontroller.text = state.profile!.user.email;
              // countrycontroller.text = state.profile!.country;
               phonecontroller.text =state.profile!.user.phone;
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: () {
                          pickImageFromGallery().then((file) {});
                        },
                        child: Container(
                    height: 110.sp,
                    width: 110.sp,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(image: AssetImage(ImageAssets.realimage))
                    ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: EdgeInsets.only(top: 30),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius:BorderRadius.circular(100)
                              ),
                              child: Icon(
                                Icons.photo_camera,
                                color: Colors.black,
                              ),
                            ),
                          ),
                      ),
                      ),
                      Text_Field_Widget(
                          usernamecontroller,
                          AppStrings.userName.tr(),
                          Icons.person,
                          AppStrings.pleaseEnterYourUserName.tr(),
                          false,readonly: false,),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text_Field_Widget(
                          emailcontroller,
                          AppStrings.email.tr(),
                          Icons.email,
                          AppStrings.pleaseEnterYourUserName.tr(),
                          false,readonly: false,),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text_Field_Widget(
                          phonecontroller,
                          "رقم الهاتف",
                          Icons.phone,
                          AppStrings.pleaseEnterYourUserName.tr(),
                          false,align: TextAlign.end,
                      alignmentDirectional: TextDirection.ltr),
                      SizedBox(height: 8.h,),
                      Country_Picker_Widget(countrycontroller, AppStrings.country.tr(), Icons.flag, AppStrings.pleaseEnterYourUserName.tr()),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: defaultButton(
                            width: 200.w,
                            function: () async {
                              if (formKey.currentState!.validate()) {}
                            },
                            text: "حفظ",
                            txtColor: Colors.white,
                            height: 50.h,
                            fontSize: 20.sp
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            else
              {
                Timer(Duration(seconds: 3), () {
                  EasyLoading.dismiss();
                });
                return Container();
              }

          },
        ),
      ),
    );
  }

  Future<XFile?> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      return image;
    }
  }

  Future<XFile?> tackPhotoByCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo == null) {
      return null;
    } else {
      return photo;
    }
  }
}
