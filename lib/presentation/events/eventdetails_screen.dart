import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mutqen/business/collegeBloc/college_cubit.dart';
import 'package:mutqen/business/uniBloc/uni_cubit.dart';
import 'package:mutqen/data/model/event.dart';
import 'package:mutqen/presentation/login/Widgets/drop_down_widget.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:mutqen/resources/strings_manager.dart';

import '../../data/model/college.dart';
import '../../resources/assets_manager.dart';
import '../../resources/common_widgets/app_bar.dart';
import '../../resources/common_widgets/button_widget.dart';
import '../register/Widgets/register_data.dart';

class eventdetails_page extends StatefulWidget {
  event eventt;
  int index;
  eventdetails_page(this.eventt, this.index, {Key? key}) : super(key: key);

  @override
  State<eventdetails_page> createState() => _eventdetails_pageState();
}

class _eventdetails_pageState extends State<eventdetails_page> {
  local.DateFormat dateFormat =  local.DateFormat("HH:mm a");
  final formKey = GlobalKey<FormState>();
  final bottomkey = GlobalKey<State>();
  var workcontroller = TextEditingController();
  var yearcontroller = TextEditingController();
  var collegecontroller = TextEditingController();
  var universitycontroller = TextEditingController();
  List <College> colleges = [];
  List <College> unives = [];
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
    load();
  }
  Future<void> load() async {
    unives = await BlocProvider.of<UniCubit>(context).GetUnives();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: getAppBarWidgetWithNotificationIcon(
                AppStrings.events.tr(), context),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: widget.eventt.color,
              onPressed: (){
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(22))),
                    builder: (context)
                    {
                      return StatefulBuilder(
                        key: bottomkey,
                        builder: (BuildContext context, void Function(void Function()) setState) {
                        return Container(
                            height: (workcontroller.text == "طالب جامعي")?420.h:220.h,
                            child: SingleChildScrollView(
                              child: Form(
                                key: formKey,
                                child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Center(child: Text(
                                          "نموذج الانضمام", style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18.sp,
                                            color: widget.eventt.color
                                        ),),),
                                      ),
                                      Drop_Down_Widget(
                                          workcontroller, AppStrings.work.tr(), Icons.work,
                                          AppStrings.pleaseEnterYourUserName
                                              .tr(), workitems,bottomkey: bottomkey,),
                                      (workcontroller.text == "طالب جامعي")
                                          ? BlocBuilder<UniCubit, UniState>(
                                          builder: (context, state) {
                                            if (state is UniLoaded) {
                                              unives = state.univs;
                                              return Drop_Down_Widget(
                                                  universitycontroller,
                                                  AppStrings.university.tr(),
                                                  Icons.account_balance_rounded,
                                                  AppStrings
                                                      .pleaseEnterYourUserName
                                                      .tr(), [],colleges: unives,);
                                            }
                                            else
                                              {
                                                return SizedBox();
                                              }
                                          }
                                          )
                                          :
                                      SizedBox(),
                                      (workcontroller.text == "طالب جامعي" )
                                          ?
                                      BlocBuilder<CollegeCubit, CollegeState>(
                                      builder: (context, state) {
                                        if (state is CollegeLoaded) {
                                          colleges = state.colleges;
                                          colleges.removeAt(0);
                                          return Drop_Down_Widget(
                                              collegecontroller,
                                              AppStrings.college.tr(),
                                              Icons.school,
                                              AppStrings.pleaseEnterYourUserName
                                                  .tr(), [],colleges: colleges,);
                                        }
                                        else
                                          {
                                            return SizedBox();
                                          }
                                      },
                                    ):
                                      SizedBox(),
                                      (workcontroller.text == "طالب جامعي")
                                          ?Drop_Down_Widget(yearcontroller,
                                          AppStrings.studentyear.tr(),
                                          Icons.date_range,
                                          AppStrings.pleaseEnterYourUserName
                                              .tr(), yearsitems):SizedBox(),
                                      SizedBox(height: 12,),
                                      defaultButton(width: 230.w,
                                          function: () {},
                                          text: "انضمام",
                                          txtColor: Colors.white,
                                          height: 40.h,
                                          fontSize: 18.sp,
                                          background:
                                          widget.eventt.color)
                                    ]
                                ),
                              ),
                            ),
                          );
                        }
                      );
                    }
                ).whenComplete(() { workcontroller.text = "" ;}
                );
              },
              label: Text("الانضمام الآن",),
        ),
            body: SingleChildScrollView(
                child: Column(
                    children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Hero(
                    tag: "event" + widget.index.toString(),
                    child: Image.asset(
                      widget.eventt.image,
                      height: 120.sp,
                      width: 120.sp,
                    )),
              ), AnimationLimiter(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                  childAspectRatio: 1.3.sp,
                  crossAxisSpacing: 1),
                  itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: Duration(milliseconds: 1200),
                        columnCount: 3,
                        child: ScaleAnimation(
                          duration: Duration(milliseconds: 1700),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: FadeInAnimation(
                            child: Container(
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
                                      Icon(eventdetailss[index].icon, color: Color(0xFF008199),size: 19.sp),
                                      Text(eventdetailss[index].title,style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w700,

                                      ),),
                                      SizedBox(width: 4.0)
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Text(eventdetailss[index].desc,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Color(0xFF3F3F46),
                                  ),
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.ltr,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                  },
                ),
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

                      SizedBox(height: 60,)
            ]
                )
            )
        );
  }
}
