import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/common_widgets/app_bar.dart';

class about_page extends StatelessWidget {
  const about_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
        getAppBarWidgetWithNotificationIcon("عن التطبيق", context),
        body: SafeArea(
          child: SingleChildScrollView(
              child:
              Card(
                elevation: 1.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Center(
                      child: Container(
                        height: 70.h,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text("Description kteer " ,
                            style: TextStyle(color: Colors.black54,fontSize: 15.sp),),
                        ),
                      ),
                    ),

                  ],
                ),
              )

          ),
        ),


      ),
    );
  }
}