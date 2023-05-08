
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mutqen/resources/common_widgets/app_bar.dart';

import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';
import '../login/Widgets/text_field_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidgetWithNotificationIcon("تعديل الصفحه الشخصيه", context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
              onTap: (){
                  pickImageFromGallery().then((file) {

                  });
                        },
                    child: Image.asset(ImageAssets.smallLogo,height: 200.h, width: 200.w)),
                  Text_Field_Widget(usernamecontroller,"My name",Icons.person,"دخل اسمك عدل",
                    false),
                SizedBox(height: 8.h,),
                Text_Field_Widget(emailcontroller,"My email",Icons.email,"دخل الايميل عدل",
                    false),
                SizedBox(height: 8.h,),
                Text_Field_Widget(passwordcontroller,AppStrings.password.tr(),Icons.lock,"دخل الرقم السري عدل",
                    true),
                SizedBox(height: 8.h,),

              ],
            ),
          ),
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
