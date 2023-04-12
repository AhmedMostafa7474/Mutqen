import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/presentation/result/Fare2/resultdetails_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../data/model/result.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/common_widgets/app_bar.dart';
import '../../../resources/strings_manager.dart';
import 'Widgets/preresult_data.dart';

class result_page3 extends StatefulWidget {
  List<result> results;
  result_page3(this.results, {Key? key}) : super(key: key);

  @override
  State<result_page3> createState() => _result_page3State();
}

class _result_page3State extends State<result_page3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon("نتيجه الذكاءات المتعدده", context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PieChart(
                    dataMap: dataMap2,
                   colorList: colorList,
                  chartType: ChartType.ring,
                  chartRadius: 170.sp,
                  chartLegendSpacing: 20,
                  ringStrokeWidth: 30,
                  legendOptions: LegendOptions(
                    legendPosition: LegendPosition.bottom
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding:  EdgeInsets.only(bottom: 20),
                  itemCount: widget.results.length,
                  itemBuilder: (BuildContext context, int index) {
                    return  InkWell(
                        onTap: (){
                          PersistentNavBarNavigator.pushNewScreen(context, screen: resultdetails_page(widget.results[index]));
                        },
                        child:
                        ListTile(
                          title:Text(widget.results[index].title,style: TextStyle(
                              color: widget.results[index].color
                          ),),
                          subtitle:widget.results[index].description.isNotEmpty?
                          Text(widget.results[index].description ,style: TextStyle(color: Colors.black45),):null,
                          trailing: Icon(Icons.arrow_forward_ios),
                        )
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 18,
                    );
                  },),
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}
