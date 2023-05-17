import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/data/model/event.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../resources/color_manager.dart';
import '../../events/eventdetails_screen.dart';

class eventcard extends StatelessWidget {
  double heigthh;
  double widthh;
  event showenevent;
  int index;
  eventcard(this.heigthh, this.widthh,this.showenevent, this.index,);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        PersistentNavBarNavigator.pushNewScreen(context, screen: eventdetails_page(
            showenevent,index));
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(9.0),
            height: heigthh,
            width: widthh,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
                color: Colors.white70,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // const SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Hero(
                      tag: "Heroo" + index.toString(),
                      child: Image.asset(showenevent.image,
                        height: 120.sp,width: 120.sp,)),
                ),
                // const SizedBox(height: 5,),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(Icons.event_seat,color: ColorManager.primatylight , size: 21.sp,),
                        const SizedBox(width: 10,),
                        Text("مقعد متاح : ",style: TextStyle(
                            color: ColorManager.primatylight,
                            fontSize: 16.sp
                        ),),
                        Text(showenevent.seats,style: TextStyle(
                            color: ColorManager.yellow,
                            fontSize: 16.sp
                        ),),
                      ],
                    ),
                  ),
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 9.0,right: 6.0),
                    child:
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(child: Icon(Icons.location_on,color: ColorManager.primatylight,size: 21.sp,))),
                        Expanded(
                          flex: 3,
                          child: Text("برنامج "+ showenevent.title +" - ",style: TextStyle(
                              color: ColorManager.primatylight,
                              fontSize: 16.sp
                          ),),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(showenevent.place,style: TextStyle(
                              color: ColorManager.yellow,
                              fontSize: 16.sp
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 82.h,
                width: 82.w,
                decoration: BoxDecoration(
                    border: Border.all(color: showenevent.color),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white70,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Expanded(
                      child: Text(showenevent.date.split(" ")[0],style: TextStyle(
                          fontSize: 21.sp,
                          color: showenevent.color
                      ),
                          textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Container(
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                          color: showenevent.color,
                        ),
                        alignment: Alignment.center,

                        child: Text(showenevent.date.split(" ")[1],style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white
                        ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
