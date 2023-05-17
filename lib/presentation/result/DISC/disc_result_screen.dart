import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../data/model/result.dart';
import '../../../resources/common_widgets/app_bar.dart';
import '../../../resources/strings_manager.dart';
import '../Fare2/resultdetails_screen.dart';
import 'DISC_details.dart';


class disc_result_page extends StatefulWidget {
  List<result> results;
  disc_result_page(this.results, {Key? key}) : super(key: key);
  @override
  State<disc_result_page> createState() => _disc_result_page();
}

class _disc_result_page extends State<disc_result_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon("نتيجه DISC", context),
        body: Container(
          padding: const EdgeInsets.only(top: 20),
          child:
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              childAspectRatio: 0.63, // Ratio of child item's height to width
            ),
            padding: EdgeInsets.only(bottom: 20.h),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return
                InkWell(
                  onTap: (){
                    PersistentNavBarNavigator.pushNewScreen(context, screen: DISC_details(widget.results[index]));
                  },
                  child: Card(
                    elevation: 1.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Card's title
                        Container(
                          height: 120.h,
                          decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                            //color: widget.results[index].color,
                            gradient: LinearGradient(colors: [
                              widget.results[index].color,
                              widget.results[index].color.withOpacity(0.9),
                              widget.results[index].color.withOpacity(0.8),

                            ])
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(widget.results[index].title,style: TextStyle(
                                  color:Colors.white,fontSize: 45.sp,
                              ),)
                            ),
                          ),
                        ),
                        // Card's description
                        Container(
                          height: 80.h,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(widget.results[index].description ,
                              style: TextStyle(color: Colors.black54,fontSize: 16.sp),),
                          ),
                        ),
                        Container(
                          height: 40.h,
                            alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                            Text(
                              "${widget.results[index].res}%",
                              style:
                               TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0.sp),
                            ),),
                        ),
                      ],
                    ),
                  ),
                );
            },
           ),
        ) ,
      ),
    );
  }
}


