import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mutqen/data/model/product.dart';
import 'package:mutqen/presentation/products/product_details.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class product_card extends StatelessWidget {

  product productt;
  int index;
  product_card(this.productt, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(context, screen: product_details(productt, index));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      )
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: Column (
                  children: [
                    Expanded(
                      flex : 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Hero(
                            tag: "product" + index.toString(),
                            child: Image.asset(productt.image,
                              height: 90.sp,width: 90.sp,)
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 60,
                        width: 230,
                        padding: EdgeInsets.only(top: 6),
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 1), // changes position of shadow
                          ),
                        ],
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.groups),
                                  Text(productt.audience,style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12
                                  ),
                                      textAlign: TextAlign.center)
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.access_time),
                                  Text(productt.hours,style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),textAlign: TextAlign.center,)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
  }
}
