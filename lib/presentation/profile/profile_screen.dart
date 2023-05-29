import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mutqen/business/bloc_initialze.dart';
import 'package:mutqen/business/cityBloc/citytext_cubit.dart';
import 'package:mutqen/business/profileBloc/profile_cubit.dart';
import 'package:mutqen/business/profileBloc/profile_cubit.dart';
import 'package:mutqen/data/api_links.dart';
import 'package:mutqen/presentation/login/Widgets/city_dropdown_widget.dart';
import 'package:mutqen/presentation/profile/forgetPassword/forgetPassword_screen.dart';
import 'package:mutqen/resources/common_widgets/app_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../business/cityBloc/city_cubit.dart';
import '../../data/model/profile.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
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
  var imagePicker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  String countryid = "";
  String cityid = "";
  var imagee ;
  XFile? selectedimage ;
  var usernamecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var countrycontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var citycontroller = TextEditingController();
  XFile? _selectedImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Load();
  }
  Future<void> Load()
  async {
   Profile? profile = await BlocProvider.of<ProfileCubit>(context).GetProfile();
   print("reloded");
    usernamecontroller.text = profile!.name;
    emailcontroller.text = profile!.user.email;
    countrycontroller.text = profile!.country.nameAr;
    phonecontroller.text =profile!.user.phone;
    citycontroller.text = profile!.city.id.toString();
    await BlocProvider.of<CityCubit>(context).GetCites(profile!.country.code);
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar:
      getAppBarWidgetWithNotificationIcon(AppStrings.profile.tr(), context),
      body: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if(state is ProfileLoaded){
              imageCache.clear();
              EasyLoading.dismiss();
               imagee = state.profile!.profilePicture == null ? AssetImage(ImageAssets.placeholder): NetworkImage(baseLink + state.profile!.profilePicture);
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: () {
                          _selectProfilePicture();
                        },
                        child:
                        Container(
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

                        image:
                        DecorationImage(image: _selectedImage != null ?
                        FileImage(File(_selectedImage!.path)): imagee  ,
                          onError: (Object e, StackTrace? stackTrace) {
                            imagee = AssetImage(ImageAssets.placeholder);
                            setState(() {
                            });
                          },
                             ),
                    ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                   borderRadius:BorderRadius.circular(20)
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
                      Country_Picker_Widget(countrycontroller,
                          AppStrings.country.tr(), Icons.flag,
                          AppStrings.pleaseEnterYourUserName.tr(),citycontroller: citycontroller),
                      SizedBox(
                        height: 5.h,
                      ),
                      BlocBuilder<CityCubit, CityState>(
                      builder: (context, state) {
                        if (state is CityLoaded) {
                          countryid = state.cities[0].countryId.toString();
                          return Drop_Down_Widget(
                              citycontroller,
                              AppStrings.city.tr(), Icons.location_city,
                              AppStrings.pleaseEnterYourUserName.tr(), [],
                              cities: state.cities,
                          );
                        }
                        else
                          {
                            return Text_Field_Widget(
                              citycontroller,
                              AppStrings.city.tr(),
                              Icons.location_city,
                              AppStrings.pleaseEnterYourUserName.tr(),
                              false,readonly: false);
                          }
                      }

                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppStrings.didyouforget.tr(),
                            style: getRegularStyle(color: Colors.black,fontSize: 16.sp),),
                          InkWell(
                              onTap: () async {
                                PersistentNavBarNavigator.pushNewScreen(context, screen:
                                const forgetPassword_page());
                              },
                              child: Text(" "+AppStrings.password.tr()+" ؟" ,
                                style: getRegularStyle(color: ColorManager.primary),
                              ),)

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: defaultButton(
                            width: 200.w,
                            function: () async {
                              if (formKey.currentState!.validate()) {
                                print(phonecontroller.text + " "+
                                    countryid+ " "+
                                    citycontroller.text+ " ");
                                await BlocProvider.of<ProfileCubit>(context).updateProfile(phonecontroller.text,
                                    countryid.toString(),
                                    citycontroller.text);
                              }
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
                return Container();
              }

          },
        ),
      ),
    );
  }



  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    try {
      final pickedImage = await picker.pickImage(source: source);
      if (pickedImage != null) {
        setState(() {
          _selectedImage = pickedImage;
          imagee=_selectedImage!.path;

        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _selectProfilePicture() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),

      builder: (BuildContext context) {
        return Container(
          height: 130.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Center(child: Text('Choose from Gallery')),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Center(child: Text('Take a Photo')),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
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
