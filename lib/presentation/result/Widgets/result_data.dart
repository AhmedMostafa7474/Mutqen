import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mutqen/resources/color_manager.dart';

class result
{
  String title;
  String description;
  String subtitle = "يرغب أصحاب هذه الشخصية بفهم واستكشاف الأشياء المحيطة بهم ، ويدفعهم حب العمل والتعلم.";
  double res;
  Color color;
  result(this.title, this.description,this.res,this.color);
}
List<result> results=[result("الشخصيه المحققه", "المفكر - المستقصي",30,ColorManager.primary),
  result("الشخصيه الاجتماعيه", "المساعد",15,Colors.red),
  result("الشخصيه المبادره", "المقنع",20,Colors.orange),
  result("الشخصيه الواقعيه", "الواقعي",25,Colors.purple),
  result("الشخصيه الفنيه", "الفنان",10,Colors.blue)
];

class resultdesc
{
  String title;
  String description;
  String descrption2;
  IconData icon;
  resultdesc(this.title, this.description,this.descrption2,this.icon);
}
List<resultdesc> resultdes= [
  resultdesc("صفاته المميزة",
      "يتميز هؤلاء الأفراد بالصفات التالية : التحليل ، الذحر ، الدقة ، النقد ، الفضول العلمي ، الاستقلالية في التفكير ، الذاتية (التفكير على مشاعره وأفكاره الذاتية) ، المنهجية ، العقلانية ، التحفظ.",
      "الامتلاك والاستحواذ ، حب المغامرة ، الطموح ، مهارات الإصغاء ، التسلط ، النشاط ، الإنطلاق ، الرافعية ، التفاؤل ، التفتيش عن المنفعة ، الثقة بالنفس",
      Icons.star),
  resultdesc("نظرته عن ذاته", "كصاحب شخصية مقنعة ، تمتلك المهارات التجارية والتسويقية أكثر من المهارات العلمية.","", Icons.person),
  resultdesc("نظرة الآخرين له", "يراه الآخرون أصحاب شخصية مليئة بالطاقة والحيوية ، لذا من الأفضل أن يتجنبوا العمل بالمجالات العلمية والفكرية المعقدة.",
      "",Icons.group),
  resultdesc("طبيعة العمل", "يحب العمل في مهن تستلزم العمل مع الآخرين ويستمتعون بأنشطة مثل البيع والإقناع والقيادة وإدارة الأداء","", Icons.work),
  resultdesc("المهن المناسبة", " علوم الحيوان - علوم الأحياء البحرية - العلوم النفسية - الفيزياء - الكيمياء - الجيولوجيا- الطب / الجراحة - الاقتصاد الاستهلاكي- المختبرات",
      "",Icons.workspaces),

];
List<result> wazenresults=[
  result("التوازن الروحاني والعبادي", "",30,ColorManager.primary),
  result("التوازن الجسدي والصحي", "",15,Colors.red),
  result("التوازن الاجتماعي والعاطفي", "",20,Colors.orange),
  result("التوازن الفكري والثقافي", "",25,Colors.purple),
  result("التوازن المهاري والمالي", "",10,Colors.blue)
];
List<String> list=["التمرين والرياضة اليومية" ,"الاحتياجات الغذائية" ,".الراحة والاسترخاء","متابعة علاج الأمراض أولا بأول"];