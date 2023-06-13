import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mutqen/resources/assets_manager.dart';

import '../../../data/model/result.dart';
import '../../../resources/common_widgets/app_bar.dart';
import 'Widgets/result_data.dart';

class resultdetails_page extends StatefulWidget {
  result resultt;
   resultdetails_page(this.resultt, {Key? key}) : super(key: key);
   
   
  @override
  State<resultdetails_page> createState() => _resultdetails_pageState();
}

class _resultdetails_pageState extends State<resultdetails_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon(widget.resultt.title, context),
        body: SingleChildScrollView(
          child: Column
            (
            children: [
              SizedBox(height: 30.h,),
              widget.resultt.image.isEmpty? SvgPicture.asset(
                ImageAssets.personimage,
                color: widget.resultt.color,
                height: 70.h,
                width: 70.w,
              ) : Image.asset(widget.resultt.image)
              ,
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
                  width: 330.w,
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
              }, itemCount: widget.resultt.resultdescription.length, itemBuilder:
                  (BuildContext context, int index) {
                    List<String> desc = widget.resultt.resultdescription[index].description.split("•");
                    return
                      ExpansionTile(
                    textColor: widget.resultt.color,
                    iconColor: widget.resultt.color,
                    title: Row(
                      children: [
                        Icon(widget.resultt.resultdescription[index].icon
                        ,size: 15.sp,),
                        SizedBox(width: 12,),
                        Text(widget.resultt.resultdescription[index].title,style: TextStyle(
                          fontSize: 15.sp
                        ),)
                      ],
                    ),children: [
                      for(var item in desc )
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item,
                            style:TextStyle(
                                fontSize: 15.sp
                            ),),
                        )
                  ,
                   index==0? Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(widget.resultt.resultdescription[index].descrption2,
                     style:TextStyle(
                    fontSize: 15.sp
                    ),) ,) :SizedBox()
                ],
                  tilePadding: const EdgeInsets.all(8.0),
                );
              },)
            ],
          ),
        )
    );
  }
}
