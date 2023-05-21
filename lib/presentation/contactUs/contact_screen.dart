import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../resources/assets_manager.dart';
import '../../resources/common_widgets/app_bar.dart';
import '../../resources/common_widgets/contactUs.dart';
import '../../resources/common_widgets/rate_app_button.dart';

class contact_page extends StatelessWidget {
  const contact_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBarWidgetWithNotificationIcon("تواصل معنا", context),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children:   [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("لا تتردد في الاتصال بنا واكتشاف خدماتنا",
                          style: TextStyle(
                              color: ColorManager.primary,
                              fontSize: 19.sp)),
                    ),
                    SizedBox(height: 15.h,),
                    InkWell(
                      onTap: (){
                        launchMap();
                      },
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Card(
                            elevation: 1.5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Card's title
                                  Icon(Icons.location_pin,color: Colors.red,size: 65,),
                                  Text("شارع التحلية - شركة باسمح التجارية",
                                      style: TextStyle(
                                          color: ColorManager.primary,
                                          fontSize: 16.sp)),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){

                        launchCaller('920009224');

                      },
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Card(
                            elevation: 1.5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Card's title
                                  Icon(Icons.phone,color: ColorManager.bluelight,size: 65,),
                                  Text("920009224 تحويلة 4",
                                      style: TextStyle(
                                          color: ColorManager.primary,
                                          fontSize: 16.sp)),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        launchEmail('mutqen@basamh.com');
                      },
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Card(
                            elevation: 1.5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Card's title
                                  Icon(Icons.email,color: ColorManager.grey,size: 65,),
                                  Text("mutqen@basamh.com",
                                      style: TextStyle(
                                          color: ColorManager.primary,
                                          fontSize: 16.sp)),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    RateButton(),



                  ],
                ),
              )),
        ),
      ),
    );
  }
}
