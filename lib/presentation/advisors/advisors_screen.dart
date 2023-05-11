import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/advisors/Widgets/advisor_data.dart';
import 'package:mutqen/presentation/advisors/advisordetails_screen.dart';
import 'package:mutqen/resources/assets_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../resources/common_widgets/app_bar.dart';
import '../../resources/strings_manager.dart';
import '../home/Widgets/main_drawer.dart';
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
//   load();
  }

  load()
  async {

    await Future.delayed(Duration(seconds: 2),() {
      isloading = false;
    },);
    setState(() {
    });
  }
  final GlobalKey<ScaffoldState> _key = GlobalKey();
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
            endDrawer: FilterDrawer() ,

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
          ),
        ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: shownlist.length,
              separatorBuilder: (BuildContext context, int index) { return SizedBox(
                height: 25.h,
              ) ; },
              itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        PersistentNavBarNavigator.pushNewScreen(context, screen: advisordetails_page(index,shownlist[index]));
                      },
                      child: UnconstrainedBox(
                        child: Container(
                          padding: const EdgeInsets.all(9.0),
                          height: 110.h,
                          width: 340.w,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                                    fontSize: 16.sp
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
                                  Container(
                                    width: 200.w,
                                    child: Text(shownlist[index].desc ,
                                      style: TextStyle(color: Colors.black45
                                      ,fontSize: 12.sp),),
                                  ),
                                ],
                              ),
                            isloading? Shimmer.fromColors(
                               highlightColor: Colors.grey[100]! ,
                               baseColor: Colors.grey[300]!,
                               child: Container(
                                 height: 90.h,
                                 width: 90.w,
                                 decoration: BoxDecoration(
                                   color: Colors.grey[300]!,
                                   borderRadius: BorderRadius.circular(100),
                                 ),
                               ),
                             ):
                            Hero(
                              tag: "Hero"+index.toString(),
                           child: Container(
                              height: 80.h,
                              width: 80.w,
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
                                  image: DecorationImage(image: AssetImage(ImageAssets.profileimage))
                              ),
                            )
                            )
                            ],
                          ),
                        ),
                      ),
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

