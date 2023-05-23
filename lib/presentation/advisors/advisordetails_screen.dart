import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/advisors/Widgets/advisor_data.dart';
import 'package:mutqen/presentation/advisors/Widgets/filter_drawer.dart';
import 'package:mutqen/presentation/advisors/advisortable.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../resources/assets_manager.dart';
import '../../resources/common_widgets/app_bar.dart';
import '../../resources/strings_manager.dart';

class advisordetails_page extends StatefulWidget {
  int index;
  advisor advisorr;
   advisordetails_page(this.index, this.advisorr, {Key? key}) : super(key: key);

  @override
  State<advisordetails_page> createState() => _advisordetails_pageState();
}

class _advisordetails_pageState extends State<advisordetails_page> {
  List<String> list=["عدد الاستشارات","المواعيد المتاحه","تقييم"];
  List<String> list2=["المجال","الرتبه","ساعه تدريب"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon(AppStrings.advisor.tr(), context),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
              Center(
                child: Hero(
                    tag: "Hero2"+widget.index.toString(),
                    child: Container(
                      height: 115.sp,
                      width: 115.sp,
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
                          image: DecorationImage(image: AssetImage(ImageAssets.meetingimage))
                      ),
                    )
                ),
              ),
              SizedBox(height: 10,),
          Center(
            child: Text(widget.advisorr.name,style: TextStyle(
                fontSize: 14.sp
            ),),
          ),
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            height: 36.h,
            decoration: BoxDecoration(
            color: Color(0xFF008199)
            ),
            child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for(int i =0 ;i <list.length ; i++)
                      Text(list[i],style: TextStyle(color: Colors.white,fontSize: 14.sp),)
                  ],
                )

          ),
      Container(
              width: double.infinity,
              height: 42.h,
              decoration: BoxDecoration(
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container( width: 70.w,
                      child: Text("6 استشارات ",style:
                        TextStyle(fontSize: 14.sp),)),
                  Text("4 مواعيد",style:
                  TextStyle(fontSize: 14.sp),),
                  Row(
                    children: [
                      Icon(Icons.star,color: Colors.amber,),
                      Text("4.3",style:
                      TextStyle(fontSize: 14.sp),),
                    ],
                  ),
                ],
              ),
          ),
          // Container(
          //     width: double.infinity,
          //     height: 36.h,
          //     decoration: BoxDecoration(
          //         color: ColorManager.primary
          //     ),
          //     child:
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         for(int i =0 ;i <list2.length ; i++)
          //           Text(list2[i],style: TextStyle(color: Colors.white,fontSize: 14.sp),)
          //       ],
          //     )
          //
          // ),
          // Container(
          //   width: double.infinity,
          //   height: 42.h,
          //   decoration: BoxDecoration(
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //      Text("شباب ",style:
          //           TextStyle(fontSize: 14.sp),),
          //       Text("ذهبي",style:
          //       TextStyle(fontSize: 14.sp),),
          //           Text("49 ساعه",style:
          //           TextStyle(fontSize: 14.sp),),
          //     ],
          //   ),
          // ),
          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Text("نبذه :",style: TextStyle(
                fontSize: 16.sp
            ),),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Text(widget.advisorr.desc,style: TextStyle(
                fontSize: 13.sp
            ),),
          ),
          SizedBox(height: 30,),
          Container(
              width: double.infinity,
              height: 36.h,
              decoration: BoxDecoration(
                  color: ColorManager.primary
              ),
              child:
                    Center( child: Text("السيره الذاتيه",style: TextStyle(color: Colors.white,fontSize: 15.sp
                        ,fontWeight: FontWeight.w700
                    ),))

          ),
                     Html(
                          data: """<p style="font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span style="font-size: 14px;"><strong>المؤهلات العلميّة:</strong></span></p>
<ul style="font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">
    <li><span class="Apple-converted-space">&nbsp;</span>ماجستير قيادة تربويّة 2019 تقدير ممتاز مع مرتبة الشّرف، جامعة دار الحكمة، جدة.</li>
    <li><span class="Apple-converted-space">&nbsp;</span>بكالوريوس دراسات إسلامية 2008 تقدير ممتاز مع مرتبة الشرف الثانية، جامعة الملك عبد العزيز، جدة.</li>
    <li><span class="Apple-converted-space">&nbsp;</span>مدربة معتمدة محليًا من المؤسسة العامة للتدريب التقنيّ والمهني.</li>
    <li><span class="Apple-converted-space">&nbsp;</span>كوتش معتمد حسب معايير الاتحاد الدولي للكوتشنج ICF</li>
</ul>
<p style="font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><span style="font-size: 14px;"><strong>الخبـرات الأكاديمية والعمليّة والتطوعيّة:</strong></span><br><strong>TA، مدرب، مصمّم برامج، باحث أكاديمي، ناشط بالخدمة المُجتمعيّة</strong></p>
<ul style="font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">
    <li><span class="Apple-converted-space">&nbsp;</span>مدرب وميسر متعاون لعدد من الجهات: جمعيّة المودة للتنمية الأسرية، مؤسسة غدن للاستشارات، (متقن) برنامج باسمح لخدمة المجتمع، مؤسسة مسك الخيريّة.</li>
    <li><span class="Apple-converted-space">&nbsp;</span>النشر العلمي لبحث ٍ بعنوان (دور برنامج The Leader in Meفي تنمية العادات القياديّة لدى طلاب الصفّ الثالث ابتدائي) بالمجلّة الدوليّة للعلوم التربويّة والنفسيّة (ُIJEPS) ع (27)، مج (8)، أغسطس 2019</li>
    <li><span class="Apple-converted-space">&nbsp;</span>مُساعد مُحاضر (TA) لمواد (منهج البحث العلمي، حلقة بحث: تصميم الخطط البحثيّة) بقسم ماجستير القيادة التربويّة، جامعة دار الحكمة.</li>
    <li><span class="Apple-converted-space">&nbsp;</span>أخصائيّة بحث علمي في العيادة البحثيّة Research Clinic بجامعة دار الحكمة، جدة.</li>
    <li><span class="Apple-converted-space">&nbsp;</span>المشاركة بعدد من الملتقيات الأكاديميّة في: الإدارة والقيادة التربويّة، والتخطيط التربوي (تقديم بحث، ملصق علمي، تقديم ركن أكاديميّ) بالمملكة العربيّة السعودية، الكويت.</li>
    <li><span class="Apple-converted-space">&nbsp;</span>الحصول على المركز الأول (فئة الابتكار والابداع) بمسابقة مركز الأبحاث بجامعة دار الحكمة، جدة.</li>
    <li><span class="Apple-converted-space">&nbsp;</span>تدريب شابات ومنسوبات من كوادر أكاديميّة، اداريّة، وتعليميّة (تمّ تدريب عدد 1137 مستفيدة) جدة، المدينة المنورة.، الظهران.</li>
    <li><span class="Apple-converted-space">&nbsp;</span>المشاركة بتقديم ورشة تأهيل سفراء برنامج مُتقن لمنسوبات (أكاديمية، ادارية) بجامعة طيبة، المدينة المنورة.</li>
    <li><span class="Apple-converted-space">&nbsp;</span>تصميم وقيادة فعاليّة (الأسرة المتألّقة) النسائيّة، بمركز حيّ الخالديّة (حضور 400شخص) ليومين متتاليين، المدينة المنوّرة.</li>
    <li><span class="Apple-converted-space">&nbsp;</span>المشاركة كمُيسّر، وأخصّائي ألعاب وأنشطة تعلّميّة بمُلتقى الاتقان للطالبات بجامعة طيبة، جامعة الأعمال والتكنولوجيا UBT، المدينة المنورة، جدة.</li>
    <li><span class="Apple-converted-space">&nbsp;</span>إعداد تقريرٍ بأداء معلمات بالمرحلة الابتدائيّة وسلوكيّات الطالبات وفق نظريّات التعلّم، مدرسة خاصة، المدينة المنوّرة.</li>
    <li><span class="Apple-converted-space">&nbsp;</span>المشاركة بعرض التجارب اليابانيّة في التعليم على مجلس إدارة، ومشرفات التطوير التعليمي بإحدى المدارس الخاصّة، المدينة المنوّرة. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</li>
    <li><span class="Apple-converted-space">&nbsp;</span>إعداد أربع حقائب تدريبية شاملة للأنشطة والألعاب التدريبية: سر قوَّتي، مهارات التفوق الدراسي، أنا مسؤول، وقرّة عيني.</li>
    <li><span class="Apple-converted-space">&nbsp;</span>تدريب الأعمار بين 5-12 سنة (تم تدريب عدد 200 طفل)</li>
    <li><span class="Apple-converted-space">&nbsp;</span>المشرفة العامّة لمركز kids shine بالمدينة المنوّرة</li>
    <li><span class="Apple-converted-space">&nbsp;</span>إعداد برامج أسرية &ndash; تربوية وثقافية وترفيهية &ndash; لملتقى الأحباب الأسري، جدة &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</li>
    <li><span class="Apple-converted-space">&nbsp;</span>عضوة، ومسؤولة في النشاط الثقافي في حملة الحج التابعة لشركة أرامكو، جدة &nbsp;</li>
    <li><span class="Apple-converted-space">&nbsp;</span>المشاركة (بإعداد وكتابة سيناريو مسرحي، والتدريب والتنظيم المسرحي) لمسرحيّة ختام الأنشطة السنويّة لقسم الدراسات الاسلاميّة، جامعة الملك عبد العزيز، جدة. &nbsp;</li>
    <li><span class="Apple-converted-space">&nbsp;</span>المشاركة بالتقديم، والالقاء في مؤتمر الحوار للفتيات التابع لإدارة التربية والتعليم، بالمدينة المنورة</li>
</ul>""",
            ),
          SizedBox(height: 50,)
        ],
      ),
    )
            ,
            floatingActionButton: FloatingActionButton.extended(onPressed: (){
              PersistentNavBarNavigator.pushNewScreen(context, screen: advisortable_page());

            },
              icon:  Icon(Icons.question_answer),
              label:Text("احجز استشاره"),
              backgroundColor: ColorManager.primary,

    ),
    )
    );
  }
}
