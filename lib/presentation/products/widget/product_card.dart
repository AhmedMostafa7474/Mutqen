import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mutqen/data/model/product.dart';

class product_card extends StatelessWidget {

  product productt;
  int index;
  product_card(this.productt, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
              onTap: () {},
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
                            tag: "Heroop" + index.toString(),
                            child: Image.asset(productt.image,
                              height: 90.sp,width: 90.sp,)
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 70,
                        width: 230,
                        padding: EdgeInsets.only(top: 6),
                        decoration: BoxDecoration(
                            gradient:LinearGradient(colors: [
                              productt.color.withOpacity(0.7),
                              productt.color.withOpacity(0.5),
                              productt.color.withOpacity(0.1),
                            ],begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)
                        ),
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
