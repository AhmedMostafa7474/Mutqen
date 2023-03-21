
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/exam/exam_screen.dart';
import 'package:mutqen/resources/common_widgets/button_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../resources/assets_manager.dart';

class homecard_page extends StatefulWidget {
  int index;
   homecard_page(this.index, {Key? key}) : super(key: key);

  @override
  State<homecard_page> createState() => _homecard_pageState(index);
}

class _homecard_pageState extends State<homecard_page> {
  int index;
  _homecard_pageState(this.index);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        ),
        body: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("مقياس وازن"),
                SizedBox(width: 10,),
                Hero(
                    tag: "Hero"+index.toString(),
                    child: Image.asset(ImageAssets.smallLogo,height: 80.h,width: 80.w,))
              ],
            ),
            SizedBox(height: 20,),
            Text("سيساعدك هذا المقياس علي:",style: TextStyle(
              fontSize: 21.sp,
              fontWeight: FontWeight.w500
            )),
            SizedBox(height: 10,),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) { return SizedBox(height:5.0); },
              itemBuilder: (BuildContext context, int index) {
                return UnconstrainedBox(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 335.w,
                    padding: EdgeInsets.only(right:25,top: 12),
                      child:
                      Text("• "+"سيساعدك هذا المقياس علي ههههيحنبخحني حخبنحخيبنحخينبحخبنيح:",style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black
                        ,fontWeight: FontWeight.normal
                      ),)),
                );
              },)
            ,
            SizedBox(height: 15,)
            ,
            defaultButton(width: 140, function: (){
              PersistentNavBarNavigator.pushNewScreen(context, screen: exam_page());
            }, text: "اجراء المقياس", txtColor: Colors.white, height: 40, fontSize: 16)
          ],
        ),
      ),
    );
  }
}
