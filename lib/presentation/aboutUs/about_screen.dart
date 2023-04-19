import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/resources/color_manager.dart';

import '../../resources/common_widgets/app_bar.dart';
import '../../resources/strings_manager.dart';
import '../home/Widgets/main_drawer.dart';

class about_page extends StatefulWidget {
  const about_page({Key? key}) : super(key: key);

  @override
  State<about_page> createState() => _about_pageState();
}

class _about_pageState extends State<about_page> {
  @override
  Widget build(BuildContext context) {
    List<List<String>> list= [
    [ "من نحن",
      "يركز على النتائج ، يفضل الإقدام على الفعل بدلاً من التخطيط ، يحب مواجهة التحديات والإقدام على المخاطر ، سرعة في تقيم المواقف ويحدد مسار العمل اللازم لتخطيه ، حازم مباشر منافس ، لا يحب إضاعة الوقت ، يرغب دائما في الحصول على الإجابات المباشرة ' وضع الأمور في نصابها الصحيح '  عصاميون يتحدون الوضع الراهن ، يبرعون في موقع المسئولية  ",
       ],
    ["نبذه عنا",
    "يركز على النتائج ، يفضل الإقدام على الفعل بدلاً من التخطيط ، يحب مواجهة التحديات والإقدام على المخاطر ، سرعة في تقيم المواقف ويحدد مسار العمل اللازم لتخطيه ، حازم مباشر منافس ، لا يحب إضاعة الوقت ، يرغب دائما في الحصول على الإجابات المباشرة ' وضع الأمور في نصابها الصحيح '  عصاميون يتحدون الوضع الراهن ، يبرعون في موقع المسئولية ، لديهم ثقة فطرية بأنفسهم في تحقيق الأهداف الصعبة ",
    ],
    ["هدف المنصة",
    "يركز على النتائج ، يفضل الإقدام على الفعل بدلاً من التخطيط ، يحب مواجهة التحديات والإقدام على المخاطر ، سرعة في تقيم المواقف ويحدد مسار العمل اللازم لتخطيه ، حازم مباشر منافس ، لا يحب إضاعة الوقت ، يرغب دائما في الحصول على الإجابات المباشرة ' وضع الأمور في نصابها الصحيح '  عصاميون يتحدون الوضع الراهن ، يبرعون في موقع المسئولية ، لديهم ثقة فطرية بأنفسهم في تحقيق الأهداف الصعبة ",
    ],
    ];
    return SafeArea(
         child: Scaffold(
         appBar: getAppBarWidgetWithNotificationIcon(AppStrings.aboutUs.tr(), context),
         drawer: MainDrawer(),
         body:SingleChildScrollView(
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 25),
                 child: Image.asset("assets/images/about.png",height: 160.h,width: 160.w,color: ColorManager.primary,),
               ),
               ListView.separated(
                 physics: const NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 separatorBuilder: (BuildContext context, int index) {
                   return SizedBox(
                     height: 18.h,
                   );
                 }, itemCount: 3, itemBuilder:
                   (BuildContext context, int index) {
                  return ExpansionTile(
                   textColor: Colors.black,
                   iconColor: Colors.black54,
                   title: Row(
                     children: [
                       // Icon(Icons.accessibility
                       //   ,size: 22.sp,),
                       SizedBox(width: 10.w,),
                       Text(list[index][0],style: TextStyle(
                           fontSize: 18.sp,fontWeight:FontWeight.w500
                       ),),

                     ],
                   ),
                   tilePadding: const EdgeInsets.all(8.0),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(list[index][1],style: TextStyle(
                            fontSize: 16.sp,letterSpacing: 1.5,
                        ),),
                      ),

                    ],
                 );
               },),
             ],
           ),
         ),
        ),
    );
  }
}
