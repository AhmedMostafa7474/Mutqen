import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/business/filterBloc/advisorfilter_cubit.dart';
import 'package:mutqen/business/filterBloc/filter_cubit.dart';
import 'package:mutqen/data/model/product.dart';
import 'package:mutqen/presentation/homee/Widget/EventCard.dart';
import 'package:mutqen/presentation/login/login_screen.dart';
import 'package:mutqen/presentation/myevents/myevents_screen.dart';
import 'package:mutqen/presentation/products/products_screen.dart';
import 'package:mutqen/presentation/products/widget/product_card.dart';
import 'package:mutqen/resources/common_widgets/button_widget.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:mutqen/resources/style_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../app/app_pref.dart';
import '../../data/model/event.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:mutqen/presentation/advisors/advisors_screen.dart';
import 'package:mutqen/presentation/events/events_screen.dart';
import 'package:mutqen/presentation/meetings/meetings_screen.dart';
import '../../resources/common_widgets/drawerwidget.dart';
import 'package:carousel_slider/carousel_slider.dart';

class animated_drawer extends StatelessWidget {
  Widget widgett;
  AdvancedDrawerController _advancedDrawerController ;
  animated_drawer(this.widgett,this._advancedDrawerController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                ColorManager.primary,
                ColorManager.primatylight.withOpacity(0.8),
                ColorManager.primatylight.withOpacity(0.7),
              ],
            ),
          ),
        ),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        animateChildDecoration: true,
        rtlOpening: true,
        openRatio: 0.65,
        openScale: 0.8,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black, blurRadius: 1, blurStyle: BlurStyle.outer),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        drawer: SafeArea(
          child: Container(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 128.0,
                      height: 128.0,
                      margin: const EdgeInsets.only(
                        top: 24.0,
                        bottom: 20.0,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(ImageAssets.smallLogo,
                          height: 200.h, width: 200.w,color: ColorManager.primary,fit: BoxFit.cover,),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    buildListTile(
                      AppStrings.advisors.tr(),
                      Icons.groups_rounded,
                      () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: BlocProvider(
                                create: (context) => AdvisorfilterCubit(),
                                child: advisors_page()));
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    buildListTile(
                      AppStrings.advices.tr(),
                      Icons.question_answer,
                      () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: (meetings_page()));
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    buildListTile(
                      AppStrings.events.tr(),
                      Icons.event,
                      () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: (BlocProvider(
                                create: (context) => FilterCubit(),
                                child: events_page())));
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    buildListTile(
                      "فعالياتي",
                      Icons.event_available,
                      () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: (const myevents_page()));
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    buildListTile(
                      "المنتجات",
                      Icons.dataset,
                      () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: (const products_page()));
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    buildListTile(
                      AppStrings.Logout.tr(),
                      Icons.logout,
                      () async {
                        await AppPreferences().logout();
                        Navigator.of(context, rootNavigator: true)
                            .pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const login_page();
                            },
                          ),
                          (_) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        child: widgett);
  }
}
