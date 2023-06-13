import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mutqen/data/model/event.dart';
import 'package:mutqen/presentation/advisors/Widgets/advisor_data.dart';
import 'package:mutqen/presentation/advisors/advisordetails_screen.dart';
import 'package:mutqen/presentation/events/Widgets/Filter.dart';
import 'package:mutqen/resources/assets_manager.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../resources/common_widgets/app_bar.dart';
import '../../resources/strings_manager.dart';
import '../events/Widgets/filter_data.dart';
import 'Widgets/filter_drawer.dart';

class advisors_page extends StatefulWidget {
  const advisors_page({Key? key}) : super(key: key);

  @override
  State<advisors_page> createState() => _advisors_pageState();
}

class _advisors_pageState extends State<advisors_page> {
  var searchcontroller = TextEditingController();
  List<advisor>searchlist=[];
  List<advisor>shownlist=[];

  var isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shownlist =advisors;
   load();
  }

  load()
  async {
    await Future.delayed(Duration(seconds: 1),() {
      isloading = false;
    },);
    setState(() {

    });
  }
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  void refresh(List<advisor> sh)
  {
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButton:  FloatingActionButton.extended(
              backgroundColor: Colors.white,
              label: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("التصنيف",style: TextStyle(color: Colors.black87),),
              Icon(Icons.filter_alt,color: Colors.black54,)
            ],
          ),
            onPressed: (){
            _key.currentState!.openEndDrawer();

          }),
          key: _key,
            drawerEnableOpenDragGesture: false,

            endDrawer: Advisor_Filter_Drawer(refresh,filterdata2,shownlist) ,

        appBar:getAppBarWidgetWithNotificationIcon(AppStrings.advisors.tr(),context),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15),
            width: 380.w,
            child: CupertinoSearchTextField(
              itemSize: 25,
              style: const TextStyle(
                fontSize: 20
              ),
              controller: searchcontroller,
              placeholder: "ابحث عن مستشارين",
              borderRadius: BorderRadius.circular(15),
              onChanged: (text){
                searchlist.clear();
                if(text.isNotEmpty) {
                  advisors.forEach((element) {
                    if (element.name.toLowerCase().contains(
                        text.toLowerCase())) {
                      searchlist.add(element);
                    }
                  });
                }
                setState(() {
                  searchlist.isEmpty? shownlist= advisors :shownlist=searchlist;
                });
              },
            ),
          ),
          const SizedBox(height: 10,)
          ,
          SizedBox(
            height: 20.h,
          ), AnimationLimiter(
          child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: shownlist.length,
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 childAspectRatio: .568.sp,
                 mainAxisSpacing: 10,
                 crossAxisSpacing: 5
               ),
                itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: (){
                          PersistentNavBarNavigator.pushNewScreen(context, screen: advisordetails_page(index,shownlist[index]));
                        },
                        child: AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: Duration(milliseconds: 700),
                          columnCount: 2,
                          child: ScaleAnimation(
                            duration: Duration(milliseconds: 1100),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: FadeInAnimation(
                              child: Stack(
                                children: [
                                Container(
                                      padding: const EdgeInsets.all(9.0),
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
                                      child:
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 80.h,),
                                              isloading? Shimmer.fromColors(
                                                highlightColor: Colors.grey[100]! ,
                                                baseColor: Colors.grey[300]!,
                                                child: Container(
                                                  width: 100.w,
                                                  height: 20.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[300]!,
                                                  ),
                                                ),
                                              ):
                                              Text(shownlist[index].name,style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,

                                              ),),
                                              SizedBox(height: 10.h,),
                                              isloading? Shimmer.fromColors(
                                                highlightColor: Colors.grey[100]! ,
                                                baseColor: Colors.grey[300]!,
                                                child: Container(
                                                  width: 200.w,
                                                  height: 22.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[300]!,
                                                  ),
                                                ),
                                              ):
                                              Text(shownlist[index].desc ,
                                                  style: TextStyle(color: ColorManager.yellow
                                                  ,fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500)
                                                ,textAlign: TextAlign.center,
                                              ),
                                         SizedBox(height: 15.h,),
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Expanded(
                                               child: Column(
                                                 crossAxisAlignment: CrossAxisAlignment.center,
                                                 children: [
                                                   Text("عدد الاستشارات",style: TextStyle(
                                                     fontSize: 14.sp,
                                                     fontWeight: FontWeight.w700,

                                                   ),
                                                   textAlign: TextAlign.center,),
                                                   SizedBox(height: 11,),
                                                   Text("6",style: TextStyle(
                                                     fontWeight: FontWeight.w600,
                                                     color: ColorManager.yellow,
                                                     fontSize: 14.sp
                                                   ),)

                                                 ],
                                               ),
                                             ),
                                             Expanded(
                                               child: Column(
                                                 crossAxisAlignment: CrossAxisAlignment.center,
                                                 children: [
                                                   Text("المواعيد المتاحه",
                                                     style: TextStyle(
                                                   fontSize: 14.sp,
                                                       fontWeight: FontWeight.w700,

                                                     ),
                                                     textAlign: TextAlign.center,
                                                   ),
                                                   SizedBox(height: 11,),
                                                   Text("0",style: TextStyle(
                                                       color: ColorManager.yellow,
                                                     fontWeight: FontWeight.w600,
                                                       fontSize: 14.sp

                                                   ))
                                                 ],
                                               ),
                                             )
                                           ],
                                         )
                                        ],
                                      ),
                                  ),
                                  isloading? Shimmer.fromColors(
                                    highlightColor: Colors.grey[100]! ,
                                    baseColor: Colors.grey[300]!,
                                    child: Container(
                                      height: 95.sp,
                                      width: 95.sp,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300]!,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                    ),
                                  ):
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Hero(
                                        tag: "advisor"+index.toString(),
                                        child: Container(
                                          height: 80.sp,
                                          width: 80.sp,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.2),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 3), // changes position of shadow
                                                ),
                                              ],
                                              borderRadius: BorderRadius.circular(100),
                                              image: DecorationImage(
                                                  image: AssetImage(ImageAssets.meetingimage))
                                          ),
                                        )
                                    ),
                                    ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child:Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 22.sp,
                                              ),
                                              Text("4.5",style: TextStyle(fontSize: 14.sp),),
                                            ],
                                          ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                }
              ),
        ),
          SizedBox(height: 30,)
        ],
      ),
    )
        )
    );
  }
}

