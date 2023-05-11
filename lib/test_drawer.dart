import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/home/home_screen.dart';
import 'package:mutqen/resources/color_manager.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:mutqen/resources/style_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'data/model/user.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => new _ExampleState();
}

class _ExampleState extends State<Example> with TickerProviderStateMixin {

  late AnimationController _animationController;
  double animationDuration = 0.0;
  int totalItems = 9;

  @override
  void initState() {
    super.initState();
    final int totalDuration = 1000;
    _animationController = AnimationController(
        vsync: this, duration: new Duration(milliseconds: totalDuration));
    animationDuration = totalDuration/(100*(totalDuration/(totalItems)));
    _animationController.forward();
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250.w,
      backgroundColor: Colors.black.withOpacity(0.3),
      child: Column(
        children: [
          Container(
            height: 70.h,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            color: ColorManager.primary,
            // #A80F14 red
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 35.sp,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  "Omar Ahmed",
                  style: getRegularStyle(
                      font: FontWeight.w500,
                      fontSize: 18.sp,
                      color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: 75.0,
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return new Item(index: index, animationController: _animationController, duration: animationDuration);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Item extends StatefulWidget {

  final int index;
  final AnimationController animationController;
  final double duration;

  Item({required this.index, required this.animationController, required this.duration});

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  late Animation _animation;
  late double start;
  late double end;
  late Animation<double> rotateY;

  @override
  void initState() {
    super.initState();
    start = (widget.duration * widget.index).toDouble();
    end = start + widget.duration;
    print("START $start , end $end");
    _animation = Tween<double>(
      begin: 1.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          widget.index == 0 ? start : start - widget.duration/2,
          widget.index == 0 ? end + widget.duration : end + widget.duration/2,
          curve: Curves.easeIn,
        ),
      ),
    )..addListener((){
      setState(() {
      });
    });

    rotateY = new Tween<double>(
      begin: -0.5,
      end: .0,
    ).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          widget.index == 0 ? start: start - widget.duration/2,
          widget.index == 0 ? end + widget.duration : end + widget.duration/2,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  Future<Null> reverse() async {

    await widget.animationController
        .reverse()
        .orCancel;
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      animation: widget.animationController,
      builder: (context, child) {
        final card = Opacity(
          opacity: _animation.value,
          child: Row(
            children: [
              Icon(CupertinoIcons.home),
              SizedBox(width: 20,),
              Text(
                "English",
                style: TextStyle(
                    fontFamily: 'Monadi',
                    fontSize: 17.sp,
                    color: ColorManager.white,
                    fontWeight: FontWeight.w200
                ),
              ),
            ],
          )
        );

        return new Transform(
          transform: new Matrix4.rotationY(rotateY.value * math.pi),
          alignment: Alignment.centerRight,
          child: card,
        );
      },
    );
  }
}
Widget buildListTile(String title, IconData icon, Function location) {
  return ListTile(
      leading: Icon(
        icon,
        size: 24.sp,
        color: ColorManager.white,
      ),
      title: Text(
        "English",
        style: TextStyle(
            fontFamily: 'Monadi',
            fontSize: 17.sp,
            color: ColorManager.white,
            fontWeight: FontWeight.w200
        ),
      ),
      onTap: ()=> location() );
}