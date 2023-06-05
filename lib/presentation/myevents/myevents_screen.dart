import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/data/model/myevent.dart';
import 'package:mutqen/resources/color_manager.dart';

import '../../resources/common_widgets/app_bar.dart';
import '../../resources/common_widgets/button_widget.dart';
import '../../resources/strings_manager.dart';

class myevents_page extends StatefulWidget {
  const myevents_page({Key? key}) : super(key: key);

  @override
  State<myevents_page> createState() => _myevents_pageState();
}

class _myevents_pageState extends State<myevents_page> {
  bool sort = false;
  bool ascendingg = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWidgetWithNotificationIcon("فعالياتي", context),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
                (states) => ColorManager.primary.withOpacity(0.8)),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ], color: Colors.white70, borderRadius: BorderRadius.circular(15)),
            dividerThickness: 3,
            dataRowHeight: 90,
            columnSpacing: 30,
            sortColumnIndex: index,
            sortAscending: ascendingg,
            columns: [
              DataColumn(
                label: Text("الفعالية",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700)),
              ),
              DataColumn(
                label: Text("تاريخ الفعالية",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700)),
                onSort: (columnIndex, ascending) {
                  setState(() {
                    index = columnIndex;
                    ascendingg = ascending;
                    if(ascendingg)
                      {
                        myevents.sort((a,b) => a.dateTime.compareTo(b.dateTime));
                      }
                    else
                      {
                        myevents.sort((a,b) => b.dateTime.compareTo(a.dateTime));

                      }
                  });
                },
              ),
              DataColumn(
                label: Text("إكتمال الدورة",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700)),
              )
            ],
            rows: myevents.map((item) {
              return DataRow(cells: [
                DataCell(
                    Container(
                    width: 100, child: Text(item.title))),
                DataCell(Text(DateFormat('yyyy-MM-dd').format(item.dateTime))),
                DataCell(
                    item.iscertified? defaultButton(
                    width: 115,
                    function: () {},
                    text: "طباعه الشهاده",
                    txtColor: Colors.white,
                    height: 45,
                    fontSize: 15,
                    radius: 10)
                :Text("غير مكتمل",style: TextStyle(
                      color: ColorManager.primary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700
                    ),)
                ),
              ]);
            }).toList(),
          ),
        ));
  }
}
