import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:mutqen/resources/style_manager.dart';

class FilterDrawer extends StatefulWidget {
  @override
  _FilterDrawerState createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  bool selected = false;

  Widget buildListTile(String title, IconData icon, Function location) {
    return
      ExpansionTile(
          iconColor: Colors.black,
          collapsedIconColor: Colors.black,
          leading: Icon(
            icon,
            size: 24.sp,
            color: ColorManager.black,
          ),
          title: Text(
            title,
            style: TextStyle(
                fontSize: 17.sp,
                color: ColorManager.black,
            ),
          ),
        children: [
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                  activeColor: ColorManager.primary,
                  value: selected, onChanged:
                        (value){
                          selected = value!;
                            setState(() {

                            });
                    }
                    ,title: Text("بناء خطه شخصيه",
                  style: TextStyle(color: Colors.black87
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
            buildListTile(
             "متقن كافيه",
              CupertinoIcons.add_circled,
                  () {
              },
            ),

            SizedBox(
              height: 20.h,
            ),
            buildListTile(
             "ملتقي التوجيه المهني",
              CupertinoIcons.add_circled,
                  () {
              },
            ),

          ],
        ),
      ),
    );
  }
}