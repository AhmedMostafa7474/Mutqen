import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mutqen/data/model/product.dart';
import 'package:mutqen/presentation/products/widget/product_card.dart';

import '../../resources/color_manager.dart';
import '../../resources/common_widgets/app_bar.dart';
import '../../resources/strings_manager.dart';

class products_page extends StatefulWidget {
  const products_page({Key? key}) : super(key: key);

  @override
  State<products_page> createState() => _products_pageState();
}

class _products_pageState extends State<products_page> {
  var searchcontroller = TextEditingController();
  List<product>searchlist=[];
  List<product>shownlist=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shownlist = products;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:getAppBarWidgetWithNotificationIcon(AppStrings.products.tr(),context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15),
                width: 380.w,
                child: CupertinoSearchTextField(
                  itemSize: 25,
                  style: const TextStyle(
                      fontSize: 20
                  ),
                  controller: searchcontroller,
                  placeholder: "ابحث عن منتجات",
                  borderRadius: BorderRadius.circular(15),
                  onChanged: (text){
                    searchlist.clear();
                    if(text.isNotEmpty) {
                      products.forEach((element) {
                        if (element.title.toLowerCase().contains(
                            text.toLowerCase())) {
                          searchlist.add(element);
                        }
                      });
                    }
                    setState(() {
                      searchlist.isEmpty? shownlist= products :shownlist=searchlist;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10,)
              ,
              SizedBox(
                height: 20.h,
              ), AnimationLimiter(
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: shownlist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 5,
                        mainAxisExtent: 230
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return  AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: Duration(milliseconds: 700),
                      columnCount: 2,
                      child: ScaleAnimation(
                      duration: Duration(milliseconds: 1100),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: FadeInAnimation(
                      child: product_card(shownlist[index],index))));
                    }
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        )
    );
  }

}
