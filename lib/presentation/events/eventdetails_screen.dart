import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/data/model/event.dart';
import 'package:mutqen/resources/strings_manager.dart';

import '../../resources/assets_manager.dart';
import '../../resources/common_widgets/app_bar.dart';

class eventdetails_page extends StatefulWidget {
  event eventt;
  int index;
  eventdetails_page(this.eventt, this.index, {Key? key}) : super(key: key);

  @override
  State<eventdetails_page> createState() => _eventdetails_pageState();
}

class _eventdetails_pageState extends State<eventdetails_page> {
  DateFormat dateFormat = DateFormat("HH:mm a");
  List<String> eventdata=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventdetailss[0].desc = (widget.eventt.date);
    eventdetailss[1].desc =(widget.eventt.place);
    eventdetailss[2].desc =(dateFormat.format(widget.eventt.dateTime));
    eventdetailss[3].desc =(widget.eventt.seats);
    eventdetailss[4].desc =(widget.eventt.instructor);
    eventdetailss[5].desc =(widget.eventt.target);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: getAppBarWidgetWithNotificationIcon(
                AppStrings.events.tr(), context),
            body: SingleChildScrollView(
                child: Column(
                    children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Hero(
                    tag: "Heroo" + widget.index.toString(),
                    child: Image.asset(
                      widget.eventt.image,
                      height: 120.sp,
                      width: 120.sp,
                    )),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                childAspectRatio: 1.3,
                crossAxisSpacing: 1),
                itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFFEBF5F7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(eventdetailss[index].icon, color: Color(0xFF008199),),
                              Text(eventdetailss[index].title,style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,

                              ),),
                              SizedBox(width: 4.0)
                            ],
                          ),
                          SizedBox(height: 15,),
                          Text(eventdetailss[index].desc,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF3F3F46),
                          ),
                          textAlign: TextAlign.center,)
                        ],
                      ),
                    );
                },
              ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                              Image.asset(ImageAssets.programdescripeimage),
                              SizedBox(width: 5.0,),
                              Text("وصف البرنامج",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                              ),)
                          ],
                        ),
                      )
                      ,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("يقدم برنامج (سَنَد) أهم المعايير الاحترافية حسب نظام الشركات في إعداد وكتابة السيرة الذاتية،"
                            " والتي تعتبر البوابة الأولى لعبور عالم الوظائف والأعمال،"
                            " ومن ثم يستكمل المسيرة من خلال عرض آليات اجتياز المقابلات الشخصية"
                            " وكيف يُظهر المشارك قدراته وإمكانياته في المقابلات الوظيفية باحترافية",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(ImageAssets.programhelpimage),
                            SizedBox(width: 5.0,),
                            Text("محاور البرنامج",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ))
                          ],
                        ),
                      )
                      ,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("التعرف على الطريقة الاحترافية في كتابة السير الذاتية "
                            "\n تطبيق عملي لكتابة سيرتك الذاتية حسب أنظمة الموارد البشرية في الشركات"
                        ,style:  TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                            )),),

            ]
                )
            )
        )
    );
  }
}