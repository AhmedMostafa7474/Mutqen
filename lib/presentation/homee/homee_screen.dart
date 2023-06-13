import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/business/filterBloc/advisorfilter_cubit.dart';
import 'package:mutqen/business/filterBloc/filter_cubit.dart';
import 'package:mutqen/data/model/product.dart';
import 'package:mutqen/presentation/homee/Widget/EventCard.dart';
import 'package:mutqen/presentation/products/widget/product_card.dart';
import 'package:mutqen/resources/common_widgets/animated_drawer.dart';
import 'package:mutqen/resources/common_widgets/button_widget.dart';
import 'package:mutqen/resources/style_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../data/model/event.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:mutqen/presentation/advisors/advisors_screen.dart';
import 'package:mutqen/presentation/events/events_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../notifications/notifications_screen.dart';


class homee_page extends StatefulWidget {
  @override
  State<homee_page> createState() => _homee_pageState();

}

class _homee_pageState extends State<homee_page> {
  final _advancedDrawerController = AdvancedDrawerController();

  _homee_pageState();
  List<Widget> imgList = [
    eventcard(245.h,300.w,events[0],0),
    eventcard(245.h,300.w,events[1],1),
    eventcard(245.h,300.w,events[2],2),
  ];

  List<Widget> productList = [
    product_card(products[0], 0),
    product_card(products[1], 1),
    product_card(products[2], 2),
  ];

  @override
  Widget build(BuildContext context) {
    return animated_drawer(
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text('الرئيسية'),
          leading: IconButton(
            onPressed: (){
              _advancedDrawerController.showDrawer();
            },
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
                PersistentNavBarNavigator.pushNewScreen(context, screen: notification_page());
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 2,color: Colors.orange,width: 37,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('أحدث الفعاليات',
                    style: getBoldtStyle(
                        color: Colors.black54,fontSize: 22.sp,
                    ),),
                  ),
                  Container(height: 2,color: Colors.orange,width: 37,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 5),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 265.h,
                    aspectRatio: 0.6,
                    enlargeFactor: 0.2,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    initialPage: 1,
                    autoPlay: true,
                  ),
                  items: imgList,
                ),
              ),

              defaultButton(width: 160.w, function: (){
              //  PersistentNavBarNavigator.pushNewScreen(context, screen: products_page());
                PersistentNavBarNavigator.pushNewScreen(context, screen: BlocProvider(
                    create: (context) => FilterCubit(),
                child: events_page()));

                },
                  text: "المزيد من الفعاليات", txtColor: ColorManager.white, height: 32.h,
                  fontSize: 16.sp),
              SizedBox(height: 15.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 2,color: Colors.orange,width: 37,),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text('إستشارات',
                      style: getBoldtStyle(
                        color: Colors.black54,fontSize: 22.sp,
                      ),),),
                  Container(height: 2,color: Colors.orange,width: 37,),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0,bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(ImageAssets.HomepageMeeting1),
                      Padding(

                          padding: const EdgeInsets.only(top: 10),
                          child: Text('لديك سؤال عن مستقبلك المهنى ؟',
                            style: getBoldtStyle(
                              color: Colors.orange.shade700,fontSize: 17.sp,
                            ),),
                      ),
                      Text('تمكنك هذه الاستشارات من',
                            style: getBoldtStyle(
                              color: Colors.blue.shade400,fontSize: 15.sp,
                            ),),
                      Text('التخطيط الجيد لتحديد المسار المهنى المناسب لك',
                        style: getBoldtStyle(
                          color: Colors.black54,fontSize: 12.sp,
                        ),),
                      Text('التعرف على مفاتيح النجاح فى المقابلات الوظيفية ',
                        style: getBoldtStyle(
                          color: Colors.black54,fontSize: 12.sp,
                        ),),
                      Text('إعداد وكتابة السيرة الذاتية',
                        style: getBoldtStyle(
                          color: Colors.black54,fontSize: 12.sp,
                        ),),

                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: defaultButton(width: 160.w, function: (){
                  PersistentNavBarNavigator.pushNewScreen(context, screen:
                      BlocProvider(
                      create: (context) => AdvisorfilterCubit(),
                  child: advisors_page()));
                  },
                    text: "احجز جلستك الآن!", txtColor: ColorManager.white, height: 32.h,
                    fontSize: 16.sp,background: ColorManager.yellow,borderColor: ColorManager.yellow
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
      _advancedDrawerController
    );

  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();

  }
}
