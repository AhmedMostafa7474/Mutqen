import 'package:flutter/material.dart';

import '../../../../data/model/result.dart';
import '../../../../resources/color_manager.dart';
import '../../Fare2/Widgets/result_data.dart';

class preresult_data
{
  String title;
  String description;

  preresult_data(this.title, this.description);
  
}
List<preresult_data> data = [preresult_data("7 - 15", 
"أنت لا ترتاح إلى استخدام هذا النوع من الذكاء وتحاول دائماً تجنب استخدامه . فاستخدامه يجعل عقلك أقل ثقة في نفسك وقدراتك , ولكن تذكر أنك إذا بذلت الجهد والوقت في تعلمه ووفقت إلى المعلم والمدرب المناسب فستنجح إن شاء الله . هذا ما يؤكده خبراء الذكاءات المتعددة .")
,preresult_data("16 - 26","أنت تميل إلى قبول استخدام هذا الذكاء وتشعر بسهولة وراحة عند استخدامه , ولكنه ليس أول ما تفضل استخدامه , ربما لأنك لم تبذل جهداً إضافياً في تطويره , وتذكر أن هذا الذكاء يحتاج منك إلى قليل من الجهد والاهتمام لتطويره .")
,preresult_data("27 - 35","أنت تفضل استخدام هذا النوع من الذكاء , وتشعر براحة ومتعة وسرور عند تطبيقه واستخدامه , بل حتى الآخرين يعرفون مدى تفوقك وتميزك فيه وللوصول إلى إتقان هذا الذكاء وصقله وتطويره يحتاج منك لجهد قليل وبسيط .. لذا ننصحك بتنمية هذا الذكاء والتركيز نحو إتقانه من خلال اختيارك لتخصصك العلمي الصحيح وأيضاً من خلال العمل الوظيفي المستقبلي الذي يرتبط بهذا النوع من الذكاء .. وتوكل على الله.")
];

List<result> multiple_results=[result("الذكاء اللغوي", "",30,ColorManager.primary,multiple_des),
  result("الذكاء الحسابي", "الرياضي / المنطقي",15,Colors.red,multiple_des),
  result("الذكاء البيئي", "",20,Colors.orange,multiple_des),
  result("الذكاء الوجداني", "الذاتي",25,Colors.purple,multiple_des),
  result("الذكاء البصري", "المكاني",10,Colors.blue,multiple_des),
  result("الذكاء الاجتماعي", "",15,Colors.pink,multiple_des),
  result("الذكاء السمعي", "الفني / الإيقاعي",20,Colors.cyan,multiple_des),
  result("الذكاء الحركي", "الجسدي",25,Colors.redAccent,multiple_des),
];

List<resultdesc> multiple_des= [
  resultdesc("صفاته",
      "• يستمتع بالقصص الأدبية . • يقضي وقتاً لا بأس به في الكتابة . • تستثيره عناوين الكتب والمقالات . • يستمع باهتمام . • يحب القراءة . • يحب الألعاب الكلامية . • يميل إلى التعرف على لغات أخرى . • يعشق الأشعار .",
      "",
      Icons.star),
  resultdesc("نقاط القوة", "كصاحب شخصية مقنعة ، تمتلك المهارات التجارية والتسويقية أكثر من المهارات العلمية.","", Icons.person),
  resultdesc("إجراءات التطوير", "يراه الآخرون أصحاب شخصية مليئة بالطاقة والحيوية ، لذا من الأفضل أن يتجنبوا العمل بالمجالات العلمية والفكرية المعقدة.",
      "",Icons.group),
  resultdesc("المستقبل المهني", "يحب العمل في مهن تستلزم العمل مع الآخرين ويستمتعون بأنشطة مثل البيع والإقناع والقيادة وإدارة الأداء","", Icons.work),
  resultdesc("التطور المهني", " علوم الحيوان - علوم الأحياء البحرية - العلوم النفسية - الفيزياء - الكيمياء - الجيولوجيا- الطب / الجراحة - الاقتصاد الاستهلاكي- المختبرات",
      "",Icons.workspaces),
];

final dataMap2 = <String, double>{
  "الذكاء اللغوي": 24,
  "الذكاء الحسابي": 14,
  "الذكاء البيئي": 18,
};


final colorList = <Color>[
  ColorManager.primary,
  Colors.red,
  Colors.orange,
  const Color(0xffe17055),
  const Color(0xff6c5ce7),
];