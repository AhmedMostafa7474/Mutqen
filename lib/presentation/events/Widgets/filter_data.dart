class filter_data
{
  String title;
  List<String> subtitles;
  filter_data(this.title, this.subtitles);
}
class choices
{
  String title;
  bool selected;

  choices(this.title, this.selected);
}
List<filter_data> filterdata =[
  filter_data("البرنامج", ["وازن","دال","فرق"] )
 ,filter_data("نوع الفاعليه", ["اونلاين","اوفلاين"]),
  filter_data("الجامعه", ["جامعه الملك فهد","جامعه جده","جامعه الرياض"])
];
List<filter_data> filterdata2 =[
  filter_data("استشاره عامه", ["رسم المسار الوظيفي والنمو المهني","تطوير المهارات الحياتية","اختيار التخصص الدراسي والميول المهنية"] )
  ,filter_data("خاص بفاعليه", ["وازن","فرق"]),
];