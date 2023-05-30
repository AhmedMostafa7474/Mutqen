import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mutqen/business/cityBloc/city_cubit.dart';
import 'package:mutqen/presentation/login/Widgets/country_picker_widget.dart';
import 'package:mutqen/presentation/login/Widgets/date_picker_widget.dart';
import 'package:mutqen/presentation/login/Widgets/drop_down_widget.dart';
import 'package:mutqen/presentation/login/Widgets/phone_number_widget.dart';
import 'package:mutqen/presentation/login/login_screen.dart';
import 'package:mutqen/presentation/register/Widgets/register_widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';
import '../login/Widgets/city_dropdown_widget.dart';
import '../login/Widgets/text_field_widget.dart';
import 'Widgets/register_data.dart';

class register_page extends StatefulWidget {
  const register_page({Key? key}) : super(key: key);

  @override
  State<register_page> createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {
  final formKey = GlobalKey<FormState>();
  String gender = "male";
  var usernamecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var countrycontroller = TextEditingController();
  var citycontroller = TextEditingController();
  var gendercontroller = TextEditingController();
  var datecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var councontroller = TextEditingController();
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gendercontroller.text = "male";
  }
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
                SizedBox(height: 10,),
                Text("أهلاً بك فى متقن",style: TextStyle(fontSize: 30,
                  color: ColorManager.primary,
                  fontWeight: FontWeight.w700
                )),
                SizedBox(height: 20,),
                Text_Field_Widget(usernamecontroller,AppStrings.userName.tr(),Icons.person,AppStrings.pleaseEnterYourUserName.tr(),false),
                SizedBox(height: 8.h,),
                Text_Field_Widget(emailcontroller,AppStrings.email.tr(),Icons.email,AppStrings.pleaseEnterYourUserName.tr(),false),
                SizedBox(height: 8.h,),
                Country_Picker_Widget(countrycontroller, AppStrings.country.tr(), Icons.flag,
                    AppStrings.pleaseEnterYourUserName.tr(),),
                SizedBox(height: 8.h,),
                BlocBuilder<CityCubit, CityState>(
                builder: (context, state) {
                  if(state is CityLoaded) {
                    councontroller.text= state.cities[0].countryId.toString();
                   return city_dropdown_Widget(citycontroller,
                        AppStrings.city.tr(), Icons.location_city,
                        AppStrings.pleaseEnterYourUserName.tr(),[],cities:state.cities);
                  }
                  else{
                    return SizedBox();
                  }
                  },
                ),
                SizedBox(height: 8.h,),
                Date_Picker_Widget(datecontroller, AppStrings.birthday.tr(), Icons.date_range,
                    AppStrings.pleaseEnterYourUserName.tr()),
                PhoneNumber_widget(phonecontroller,AppStrings.pleaseEnterYourUserName.tr(),"رقم الهاتف"),
                SizedBox(height: 8.h,),
                Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 21.0,bottom: 8),
                child: Text("الجنس",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400
                ),),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text("ذكر"),
                    value: "male",
                    activeColor: ColorManager.primary,
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = value.toString();
                        gendercontroller.text =value.toString();
                      });
                      print(gendercontroller.text);

                    },
                  ),
                ),

                Expanded(
                  child: RadioListTile(
                    activeColor: ColorManager.primary,
                    title: Text("انثي"),
                    value: "female",
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = value.toString();
                        gendercontroller.text =value.toString();

                      });
                      print(gendercontroller.text);
                    },
                  ),
                ),
                ],
            ),
                Text_Field_Widget(passwordcontroller,AppStrings.password.tr(),Icons.password,AppStrings.pleaseEnterYourUserName.tr(),true),
                SizedBox(height: 15.h,),
                BlocBuilder<CityCubit, CityState>(
                builder: (context, state) {
                  if(state is CityLoaded) {
                    councontroller.text = state.cities[0].countryId.toString();
                    print("here");
                    return RegisterButton(
                        formKey,
                        usernamecontroller,
                        emailcontroller,
                        citycontroller,
                        passwordcontroller,
                        gendercontroller,
                        phonecontroller,
                        datecontroller,
                        context,
                        councontroller);
                  }
                else {
                    return RegisterButton(
                        formKey,
                        usernamecontroller,
                        emailcontroller,
                        citycontroller,
                        passwordcontroller,
                        gendercontroller,
                        phonecontroller,
                        datecontroller,
                        context,
                        councontroller);
                  }
                },
              ),

                SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.YouHave.tr()),
                    InkWell(
                        onTap: () async {
                          print(councontroller.text +"&&&&&");
                          Navigator.of(context, rootNavigator: true)
                              .pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return login_page();
                              },
                            ),
                                (_) => false,
                          );

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
