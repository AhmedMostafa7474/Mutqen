import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/data/model/product.dart';

import '../../resources/common_widgets/app_bar.dart';
import '../../resources/strings_manager.dart';

class product_details extends StatefulWidget {
  product productt;
  int index;

  product_details(this.productt, this.index, {Key? key}) : super(key: key);

  @override
  State<product_details> createState() => _product_detailsState();
}


class _product_detailsState extends State<product_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon(
            AppStrings.products.tr(), context),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: 10,
          ),
          Center(
              child: Hero(
                  tag: "product" + widget.index.toString(),
                  child: Image.asset(
                    widget.productt.image,
                    height: 120.sp,
                    width: 120.sp,
                  ))),
              SizedBox(height: 20,),
            Html(
            data:"""
            <p><strong><img alt="">وصف البرنامج</strong></p>
<p>يهدف هذا البرنامج على غرس مفهوم التوازن في حياة الشباب ، وقياس قدراتهم في تحقيق التوازن في مختلف أدوار الحياة ، وكيف يمكن أن يعالج الخلل ويعيد لحياته نظام التوازن الذي يحقق له الاطمئنان والإنجاز والنجاح.</p>
<hr>
<p><strong><img alt="">&nbsp;أسلوب عرض البرنامج:</strong></p>
<ul>
    <li><img alt="">&nbsp;جماهيري بأسلوب التيسير التعاوني</li>
</ul>
<hr>
<p><strong><img alt="">&nbsp;محاور البرنامج:</strong></p>
<ul>
    <li><img alt="">&nbsp;التعرف على أدوار الحياة المختلفة وأهميتها</li>
    <li><img alt="">&nbsp;مقياس الحياة المتوازنة وعجلة الحياة</li>
    <li><img alt="">&nbsp;طرق ووسائل عملية لتعزيز التوازن بين أدوار الحياة</li>
    <li><img alt="">&nbsp;صناعة خطة شهرية بناء على مفهوم التوازن</li>
</ul>
<hr>
<p><strong><img alt="">&nbsp;مدة البرنامج</strong></p>
<p><img alt="">&nbsp;يُقدّم البرنامج في يوم (لمدة ساعتين)</p>
            """,
            )
,
              SizedBox(height: 30,)
        ]

            )
        )
    );
  }
}
