import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mutqen/presentation/result/Widgets/result_data.dart';
import 'package:mutqen/resources/assets_manager.dart';

import '../../resources/common_widgets/app_bar.dart';
import 'Widgets/result_data.dart';

class resultdetails_page extends StatefulWidget {
  result resultt;
   resultdetails_page(this.resultt, {Key? key}) : super(key: key);

  @override
  State<resultdetails_page> createState() => _resultdetails_pageState();
}

class _resultdetails_pageState extends State<resultdetails_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon(widget.resultt.title, context),
        body: Column
          (
          
          children: [
            SizedBox(height: 60.h,),
            SvgPicture.asset(
          ImageAssets.personimage,
          color: widget.resultt.color,
              height: 80.h,
              width: 80.w,
            ),
            Center(
              child: Text(widget.resultt.title,style: TextStyle(
                fontSize: 18.sp
              ),),
            ),
            SizedBox(height: 10.h,),
            Center(
              child: Text(widget.resultt.title,style: TextStyle(
                  fontSize: 15.sp,
                color: Colors.black45
              ),),
            )
        ],
        )
    )
    );
  }
}
