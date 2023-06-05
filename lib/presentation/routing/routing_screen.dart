import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/home/home_screen.dart';
import 'package:mutqen/presentation/navbar/navbar_screen.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../resources/assets_manager.dart';


class routing_screen extends StatefulWidget {
  const routing_screen({Key? key}) : super(key: key);

  @override
  State<routing_screen> createState() => _routing_screenState();
}

class _routing_screenState extends State<routing_screen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      ColorManager.primary.withOpacity(0.8),
                      ColorManager.primary.withOpacity(0.9),
                      ColorManager.primary,
                    ],
                  ),),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    FlipCard(
                      direction: FlipDirection.HORIZONTAL,
                      speed: 1200,
                      onFlip: (){
                        Timer(Duration(milliseconds: 1250), () {
                          PersistentNavBarNavigator.pushNewScreen(context, screen: ( nav_screen()));
                        });
                      },
                      front: Image.asset(
                        ImageAssets.smallLogo,
                        width: 160.w,
                        height: 120,
                        color: Colors.white,
                      ), back: Image.asset(
                      ImageAssets.smallLogo,
                      width: 160.w,
                      height: 120,
                      color: Colors.white,
                    ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    ColorManager.blue,
                    ColorManager.blue.withOpacity(0.7),
                    ColorManager.blue.withOpacity(0.4),
                  ],
                ),),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlipCard(
                      direction: FlipDirection.HORIZONTAL,
                      speed: 1200,
                      onFlip: (){
                        Timer(Duration(milliseconds: 1250), () {
                          PersistentNavBarNavigator.pushNewScreen(context, screen: ( nav_screen()));
                        });
                      },
                      front: Image.asset(
                        ImageAssets.shaghafLogo,
                        width: 160.w,
                        height: 120,
                        color: Colors.white,
                      ), back: Image.asset(
                      ImageAssets.shaghafLogo,
                      width: 160.w,
                      height: 120,
                      color: Colors.white,
                    ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
