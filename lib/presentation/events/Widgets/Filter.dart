import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/result/Multiple/Widgets/preresult_data.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:mutqen/resources/style_manager.dart';

import 'filter_data.dart';

class Filter_Drawer extends StatefulWidget {
  @override
  _Filter_DrawerState createState() => _Filter_DrawerState();
}

class _Filter_DrawerState extends State<Filter_Drawer> {
  bool selected = false;

  Widget buildListTile(filter_data data, IconData icon, Function location) {
    return  ExpansionTile(
      iconColor: ColorManager.primary,
      collapsedIconColor: Colors.black ,
      title: Text(
        data.title,
        style: TextStyle(
          fontSize: 17.sp,
          color: ColorManager.primary,
        ),
      ),
      children: [
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.subtitles.length,
          itemBuilder: (BuildContext context, int index) {
            return CheckboxListTile(
              activeColor: ColorManager.primary,
              value: selected, onChanged:
                (value){
              selected = value!;
              setState(() {

              });
            }
              ,title: Text(data.subtitles[index],
              style: TextStyle(color: ColorManager.primary
                  ,
                  fontSize: 18.sp),)
              ,
            );

          },

          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10,);
          },
        )
      ],
    );
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250.w,
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 70.h,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerRight,
              color: ColorManager.primary,
              // #A80F14 red
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.filter_alt,
                      color: Colors.white,
                      size: 30.sp,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "التصنيف",
                    style: getRegularStyle(
                        font: FontWeight.w500,
                        fontSize: 18.sp,
                        color: Color(0xFFFFFFFF)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return buildListTile(
                  filterdata[index],
                  CupertinoIcons.add_circled,
                      () {
                  },
                );
                },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10,);
              },
            ),
          ],
        ),
      ),
    );
  }
}