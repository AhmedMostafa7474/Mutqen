import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/advisors/Widgets/advisor_data.dart';
import 'package:mutqen/resources/assets_manager.dart';

import '../../resources/common_widgets/app_bar.dart';
import '../../resources/strings_manager.dart';

class advisors_page extends StatefulWidget {
  const advisors_page({Key? key}) : super(key: key);

  @override
  State<advisors_page> createState() => _advisors_pageState();
}

class _advisors_pageState extends State<advisors_page> {
  var searchcontroller = TextEditingController();
  List<advisor>searchlist=[];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon(AppStrings.advisors.tr(), context),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 15,left: 30),
            width: 380,
            child: CupertinoSearchTextField(
              itemSize: 25,
              style: TextStyle(
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

                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:searchlist.isEmpty? advisors.length :searchlist.length,
              separatorBuilder: (BuildContext context, int index) { return SizedBox(
                height: 25,
              ) ; },
              itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){

                      },
                      child: UnconstrainedBox(
                        child: Container(
                          padding: EdgeInsets.all(9.0),
                          height: 100.h,
                          width: 340.w,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(15)),
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(searchlist.isEmpty?
                                  advisors[index].name:searchlist[index].name,style: TextStyle(
                                    fontSize: 16
                                  ),),
                                  SizedBox(height: 10,),
                                  Container(
                                    width: 200,
                                    child: Text(searchlist.isEmpty?
                                    advisors[index].desc :searchlist[index].desc ,
                                      style: TextStyle(color: Colors.black45
                                      ,fontSize: 12),),
                                  ),
                                ],
                              ),
                             Container(
                               height: 100,
                               width: 100,
                               decoration: BoxDecoration(
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.black.withOpacity(0.2),
                                       spreadRadius: 5,
                                       blurRadius: 7,
                                       offset: Offset(0, 3), // changes position of shadow
                                     ),
                                   ],
                                 borderRadius: BorderRadius.circular(100),
                                 image: DecorationImage(image: AssetImage(ImageAssets.profileimage))
                               ),
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

