import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/business/filterBloc/filter_cubit.dart';
import 'package:mutqen/data/model/event.dart';
import 'package:mutqen/presentation/result/Multiple/Widgets/preresult_data.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:mutqen/resources/style_manager.dart';

import 'filter_data.dart';

class Filter_Drawer extends StatefulWidget {
  List<event>? showenevents;
  List<filter_data> filterdataa;
  Function refrseh;
  Filter_Drawer(this.refrseh, this.filterdataa,this.showenevents);

  @override
  _Filter_DrawerState createState() => _Filter_DrawerState();
}

class _Filter_DrawerState extends State<Filter_Drawer> {
  List<String> selected =[];
  List<event> filterevents =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      selected =  BlocProvider.of<FilterCubit>(context).state;
  }

  Widget buildListTile(int index, IconData icon, Function location) {
    return  BlocBuilder<FilterCubit, List<String>>(
  builder: (context, state) {
    selected = state;
    return ExpansionTile(
      iconColor: ColorManager.primary,
      collapsedIconColor: Colors.black ,
      title: Text(
        widget.filterdataa[index].title,
        style: TextStyle(
          fontSize: 17.sp,
          color: ColorManager.primary,
        ),
      ),
      children: [
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.filterdataa[index].subtitles.length,
          itemBuilder: (BuildContext context, int index1) {
            return CheckboxListTile(
              activeColor: ColorManager.primary,
              value: selected.contains(widget.filterdataa[index].subtitles[index1]),
              onChanged:
                (value){
                  filterevents.clear();
                  value! == true ? context.read<FilterCubit>().add(widget.filterdataa[index].subtitles[index1]):
                  context.read<FilterCubit>().delete(widget.filterdataa[index].subtitles[index1]);
                      events.forEach((element) {
                        if(selected.contains(element.title))
                          {
                           filterevents.add(element);
                          }
                      });
                  filterevents.isEmpty? widget.showenevents = events :widget.showenevents= filterevents;
                  widget.refrseh(widget.showenevents);
                  setState(() {

                  });
                  // widget._key.currentState!.setState(() {
                  // });
                }
              ,title: Text(widget.filterdataa[index].subtitles[index1],
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
  },
);
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
                      Icons.close,
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
              itemCount: widget.filterdataa.length,
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