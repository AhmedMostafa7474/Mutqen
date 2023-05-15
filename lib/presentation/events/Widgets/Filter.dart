import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/data/model/event.dart';
import 'package:mutqen/presentation/result/Multiple/Widgets/preresult_data.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:mutqen/resources/style_manager.dart';

import 'filter_data.dart';

class Filter_Drawer extends StatefulWidget {
  GlobalKey<State<StatefulWidget>> _key;
  List<event> _showenevents;
  Filter_Drawer(this._key,this._showenevents);

  @override
  _Filter_DrawerState createState() => _Filter_DrawerState();
}

class _Filter_DrawerState extends State<Filter_Drawer> {
  List<String> selected =[];
  List<event> filterevents =[];
  Widget buildListTile(int index, IconData icon, Function location) {
    return  ExpansionTile(
      iconColor: ColorManager.primary,
      collapsedIconColor: Colors.black ,
      title: Text(
        filterdata[index].title,
        style: TextStyle(
          fontSize: 17.sp,
          color: ColorManager.primary,
        ),
      ),
      children: [
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: filterdata[index].subtitles.length,
          itemBuilder: (BuildContext context, int index1) {
            return CheckboxListTile(
              activeColor: ColorManager.primary,
              value: selected.contains(filterdata[index].subtitles[index1]),
              onChanged:
                (value){
                  value! == true ? selected.add(filterdata[index].subtitles[index1]): selected.remove(filterdata[index].subtitles[index1]);
                  //     events.forEach((element) {
                  //       if(selected.contains(element.title))
                  //         {
                  //          value! == true ? filterevents.add(element) : filterevents.remove(element);
                  //         }
                  //     });
                  //
                  // filterevents.isEmpty? widget._showenevents = events :widget._showenevents= filterevents;
                  // //print(widget._showenevents.length);
                  setState(() {

                  });
                  // widget._key.currentState!.setState(() {
                  // });
                }
              ,title: Text(filterdata[index].subtitles[index1],
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
                  index,
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