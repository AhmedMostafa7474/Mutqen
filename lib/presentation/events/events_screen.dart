import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mutqen/presentation/events/Widgets/filter_data.dart';
import 'package:mutqen/presentation/home/Widgets/main_drawer.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../data/model/event.dart';
import '../../resources/assets_manager.dart';
import '../../resources/common_widgets/app_bar.dart';
import '../../resources/strings_manager.dart';
import '../homee/Widget/EventCard.dart';
import 'Widgets/Filter.dart';
import 'eventdetails_screen.dart';

class events_page extends StatefulWidget {
  const events_page({Key? key}) : super(key: key);

  @override
  State<events_page> createState() => _events_pageState();
}

class _events_pageState extends State<events_page> {
  var searchcontroller = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final listkey = GlobalKey<State>();

  List<event> showenevents =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showenevents = events;
    print("yesss");
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child:
        Scaffold(
            key: _key,
          endDrawer: Filter_Drawer(listkey,filterdata,showenevents:showenevents),
        appBar: getAppBarWidgetWithNotificationIcon(AppStrings.events.tr(), context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              InkWell(
                onTap: (){
                  _key.currentState!.openEndDrawer();
                },
                child: Container(
                    height: 40,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          )
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text("التصنيف"),
                        Icon(Icons.filter_alt,color: Colors.black54,)
                      ],
                    )
                ),
              )
              ,
              SizedBox(
                height: 15.h,
              ),
              StatefulBuilder(
                key: listkey,
                builder: (BuildContext context, void Function(void Function()) setState) {
                return AnimationLimiter(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding:  EdgeInsets.only(bottom: 20 ,top: 20),
                    itemCount: showenevents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 700),
                        child: SlideAnimation(
                          verticalOffset: 80.0,
                          child: FadeInAnimation(
                            child: UnconstrainedBox(
                                child :  eventcard(230.h,300.w,showenevents[index],index),

                            ),
                          ),
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 18,
                    );
                  },),
                );
                },
              ),
            ],
          ),
        )
    )
    );
  }
}
