import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/data/model/result.dart';
import 'package:onboarding_animation/onboarding_animation.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/common_widgets/app_bar.dart';

class DISC_details extends StatefulWidget {
  result resultt;
  DISC_details( this.resultt, {Key? key}) : super(key: key);

  @override
  State<DISC_details> createState() => _DISC_detailsState();
}

class _DISC_detailsState extends State<DISC_details> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon("نتيجه DISC", context),
            backgroundColor: Colors.white.withOpacity(.9),
    body: Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
      child: OnBoardingAnimation(
        controller: PageController(initialPage: 0),
        pages:  [
          _GetCardsContent(

            image: 'assets/images/Logo/1.png',
            title: widget.resultt.resultdescription[0].description ,
            cardContent:widget.resultt.resultdescription[0].descrption2,
          ),
          _GetCardsContent(
            image: 'assets/images/image_2.jpg',
            title: widget.resultt.resultdescription[1].description,
            cardContent:
            widget.resultt.resultdescription[1].descrption2, ),
          _GetCardsContent(
            image: 'assets/images/image_3.jpg',
            title: widget.resultt.resultdescription[2].description,
            cardContent:
            widget.resultt.resultdescription[2].descrption2,),
        ],
          indicatorActiveDotColor: ColorManager.black,
        indicatorDotHeight: 11.0,
        indicatorDotWidth: 11.0,
        indicatorType: IndicatorType.jumpingDots,
        indicatorDotSpacing: 10,
        indicatorPosition: IndicatorPosition.bottomCenter,

      ),
    ))
    );
  }
}
class _GetCardsContent extends StatelessWidget {
  final String image, cardContent,title;

  const _GetCardsContent({
    Key? key,
    this.image = '',
    this.title = '',
    this.cardContent = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
                child: Image.asset(image),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'Monadi',
                      fontSize: 18.sp,
                      color: ColorManager.black,
                      fontWeight: FontWeight.w200
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Text(
                cardContent,
                style: TextStyle(
                    fontFamily: 'Monadi',
                    fontSize: 15.sp,
                    color: ColorManager.black,
                    fontWeight: FontWeight.w100
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}