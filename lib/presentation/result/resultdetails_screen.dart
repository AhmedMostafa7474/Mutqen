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
        body: SingleChildScrollView(
          child: Column
            (
            children: [
              SizedBox(height: 30.h,),
              SvgPicture.asset(
                ImageAssets.personimage,
                color: widget.resultt.color,
                height: 70.h,
                width: 70.w,
              ),
              Center(
                child: Text(widget.resultt.title,style: TextStyle(
                  fontSize: 18.sp
                ),),
              ),
              SizedBox(height: 10.h,),
              Center(
                child: Text(widget.resultt.description,style: TextStyle(
                    fontSize: 15.sp,
                  color: Colors.black45
                ),),
              ),
              SizedBox(height: 18.h,),
              Center(
                child: SizedBox(
                  width: 330.sp,
                  child: Text(widget.resultt.subtitle,style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black87
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 18.h),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 18,
                );
              }, itemCount: resultdes.length, itemBuilder:
                  (BuildContext context, int index) {
                return ExpansionTile(
                    textColor: widget.resultt.color,
                    iconColor: widget.resultt.color,
                    title: Row(
                      children: [
                        Icon(resultdes[index].icon),
                        SizedBox(width: 12,),
                        Text(resultdes[index].title)
                      ],
                    ),children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(resultdes[index].description),
                  )
                  ,
                   index==0? Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(resultdes[index].descrption2),
                   ):SizedBox()
                ],
                  tilePadding: const EdgeInsets.all(8.0),
                );
              },)
            ],
          ),
        )
    )
    );
  }
}
