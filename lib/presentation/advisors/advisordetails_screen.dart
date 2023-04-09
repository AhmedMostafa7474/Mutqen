import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/advisors/Widgets/advisor_data.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../resources/assets_manager.dart';
import '../../resources/common_widgets/app_bar.dart';
import '../../resources/strings_manager.dart';

class advisordetails_page extends StatefulWidget {
  int index;
  advisor advisorr;
   advisordetails_page(this.index, this.advisorr, {Key? key}) : super(key: key);

  @override
  State<advisordetails_page> createState() => _advisordetails_pageState();
}

class _advisordetails_pageState extends State<advisordetails_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon(AppStrings.advisor.tr(), context),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
            Center(
              child: Hero(
                  tag: "Hero"+widget.index.toString(),
                  child: Container(
                    height: 120,
                    width: 120,
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
                        image: DecorationImage(image: AssetImage(ImageAssets.profileimage))
                    ),
                  )
              ),
            ),
            SizedBox(height: 10,),
        Center(
          child: Text(widget.advisorr.name,style: TextStyle(
              fontSize: 14.sp
          ),),
        ),
        SizedBox(height: 30,),
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Text("نبذه :",style: TextStyle(
              fontSize: 16.sp
          ),),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(right: 30),
          child: Text(widget.advisorr.desc,style: TextStyle(
              fontSize: 13.sp
          ),),
        ),
        SizedBox(height: 30,),
        Container(
          height: 300,
          child:  DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: ColorManager.primary,
              appBar:  TabBar(
                  tabs: [
                    Tab( text: "تعريف",),
                    Tab( text: "المؤهلات العلميه"),
                  ],
                ),
              body: TabBarView(
                children: [
                  Container(color: Colors.white,
                      child: Center( child: Text(widget.advisorr.desc))),
                  Container(
                    color: Colors.white,
                      child: Center( child: Text(widget.advisorr.desc))),
                ],
              ),
            ),
          )
        )
      ],
    )
    )
    );
  }
}
