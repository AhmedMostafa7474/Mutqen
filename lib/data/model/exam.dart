class exam
{
  String title;
  String description;
  int count;
  List<answer>answers;
  exam(this.title, this.description,this.count,this.answers);
}

List<exam> exams = [
  exam("مقياس DISC", "يساعدك علي التوازن في حياتك والتأكد من التجدد والتجسن المستمر", 44,
  [answer(index: 1),answer(index: 2),answer(index: 3),answer(index: 4),answer(index: 5)]),
  exam("مقياس وازن", "يساعدك علي التوازن في حياتك والتأكد من التجدد والتجسن المستمر", 100,
      [answer(title: "نعم"),answer(title: "احيانا"),answer(title: "ابدا")]),
  exam("مقياس فرق", "اكتشاف الميول التعليميه والمهنيه والخصائص الشخصيه", 42,
      [answer(title: "نعم"),answer(title: "لا")]),
  exam("مقياس الذكاءات المتعدده", "يساعدك علي التوازن في حياتك والتأكد من التجدد والتجسن المستمر", 42,
      [answer(index: 1),answer(index: 2),answer(index: 3),answer(index: 4),answer(index: 5)]),
];

class answer
{
  String? title;
  int ?index ;
  bool selected =false;
  answer({this.title,this.index});
}