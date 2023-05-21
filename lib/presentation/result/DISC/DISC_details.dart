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
    return  Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon("نتيجه DISC", context),
            backgroundColor: Colors.white.withOpacity(.9),
    body: Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child:
      OnBoardingAnimation(
        controller: PageController(initialPage: 0),
        pages:  [
          _GetCardsContent(

            image: 'assets/images/Logo/3amal.png',
            title: widget.resultt.resultdescription[0].description ,
            cardContent:widget.resultt.resultdescription[0].descrption2,
            color: ColorManager.D,
          ),
          _GetCardsContent(
            image: 'assets/images/Logo/namat.png',
            title: widget.resultt.resultdescription[1].description,
            cardContent:
            widget.resultt.resultdescription[1].descrption2,
            color: ColorManager.I,
          ),
          _GetCardsContent(
            image: 'assets/images/Logo/semat.png',
            title: widget.resultt.resultdescription[2].description,
            cardContent:
            widget.resultt.resultdescription[2].descrption2,
            color: ColorManager.S,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _GetCardsContent(
              image: 'assets/images/Logo/twasol.png',
              title: widget.resultt.resultdescription[3].description,
              cardContent:
              widget.resultt.resultdescription[3].descrption2,
              color: ColorManager.C,
            ),
          ),

        ],
          indicatorActiveDotColor: ColorManager.black,
        indicatorDotHeight: 11.0,
        indicatorDotWidth: 11.0,
        indicatorType: IndicatorType.jumpingDots,
        indicatorDotSpacing: 10,
        indicatorPosition: IndicatorPosition.bottomCenter,

      ),
    )
    );
  }
}
class _GetCardsContent extends StatelessWidget {
  final String image, cardContent,title;
   Color color;
   _GetCardsContent({
    Key? key,
    this.image = '',
    this.title = '',
    this.cardContent = '',
    this.color = Colors.black,

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
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  child: Image.asset(image,color: color,height: 170,width: 170,),
              ),
            SizedBox(height: 20,),
            Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: color,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              SizedBox(height: 25.h,),
              Text(
                  cardContent,
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: ColorManager.black,
                      fontWeight: FontWeight.w100
                  ),
                ),
              SizedBox(height: 15.h,)
            ],
          ),
        ),
      ),
    );
  }
}