import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../presentation/result/Wazen/Widgets/Wazen_data.dart';

defaultBottomSheet(ctxt,int index){
  showModalBottomSheet(
      context: ctxt,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context)
      {
        return Container(
          height: 300.h,
          child: SingleChildScrollView(
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Center(child: Text(" وسائل لتنمية "+wazenresults[index].title,style: TextStyle(
                        fontSize: 20.sp,
                        color: wazenresults[index].color
                    ),),),
                  ),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 8.h,
                      );
                    },
                    itemCount: list.length, itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Text((index+1).toString()),
                      title: Text(list[index]),
                    );
                  },),

                ]
            ),
          ),
        );
      }
  );
}