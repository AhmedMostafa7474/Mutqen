import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
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
import '../login/Widgets/drop_down_widget.dart';
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
  var collegeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EasyLoading.show(status: "جاري تحميل الصفحه الشخصيه");
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
              collegeController.text = state.profile!.gender;

              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 150.h,
                        child: InkWell(
                            onTap: () {
                              pickImageFromGallery().then((file) {});
                            },
                            child: Image.asset(ImageAssets.smallLogo,
                                height: 200.h, width: 200.w)),
                      ),
                      Text_Field_Widget(
                          usernamecontroller,
                          AppStrings.userName.tr(),
                          Icons.person,
                          AppStrings.pleaseEnterYourUserName.tr(),
                          false),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text_Field_Widget(
                          emailcontroller,
                          AppStrings.email.tr(),
                          Icons.email,
                          AppStrings.pleaseEnterYourUserName.tr(),
                          false),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text_Field_Widget(
                          passwordcontroller, AppStrings.password.tr(),
                          Icons.lock, AppStrings.pleaseEnterYourUserName.tr(),
                          true),
                      SizedBox(
                        height: 5.h,
                      ),
                      Drop_Down_Widget(
                          collegeController,
                          AppStrings.college.tr(),
                          Icons.school,
                          AppStrings.pleaseEnterYourUserName.tr(),
                          collegeitems),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: defaultButton(
                            width: 300.w,
                            function: () async {
                              if (formKey.currentState!.validate()) {}
                            },
                            text: "تعديل",
                            txtColor: Colors.white,
                            height: 50.h,
                            fontSize: 18.sp),
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
