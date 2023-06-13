import 'package:mutqen/resources/assets_manager.dart';

class exam
{
  String title;
  String description;
  int count;
  String image;
  List<question> questions;
  String helpText;
  exam(this.title, this.description,this.count,this.questions,this.image,this.helpText);
}

List<exam> exams = [
  exam("مقياس DISC", "المميزات والقدرات الشخصيه التي تحدد هويتك وشخصيتك الفريده", 44,
  questions,ImageAssets.discexamimage,"اختر العباره التي تعبر عنك علي مقياس 1 الي 5  (بحيث 1 اقل و5 اكتر)"),
  exam("مقياس وازن", "يساعدك علي التوازن في حياتك والتأكد من التجدد والتجسن المستمر", 100,
     wazenquestions,ImageAssets.wazenexamimage,"اختر المناسب من الخيارات التاليه ( دائما - احيانا - أبدا ) امام العبارات التاليه"),
  exam("مقياس فرق", "اكتشاف الميول التعليميه والمهنيه والخصائص الشخصيه", 42,
     fare2questions,ImageAssets.fare2examimage,"نرجو منك ان تختر ( نعم ) للعباره التي تمثلك و (لا) للعباره التي لا تمثلك "),
  exam("مقياس الذكاءات المتعدده", "اكتشاف الميول التعليميه والمهنيه والخصائص الشخصيه", 56,
     questions,ImageAssets.brainexamimage,"اختر العباره التي تعبر عنك علي مقياس 1 الي 5  (بحيث 1 اقل و5 اكتر)"),
];
List<answer> answers=[answer(title: "1"),answer(title: "2"),answer(title: "3"),answer(title: "4"),answer(title: "5")];
List<answer> wazenanswers= [answer(title: "نعم"),answer(title: "احيانا"),answer(title: "ابدا")];
List<answer> fare2answers= [answer(title: "نعم"),answer(title: "لا")];

List<question> questions = [
  question("قيادي حريص علي النتائج العمليه", [answer(title: "1"),answer(title: "2"),answer(title: "3"),answer(title: "4"),answer(title: "5")]),
  question("يستمتع بمخالطه الاخرين", [answer(title: "1"),answer(title: "2"),answer(title: "3"),answer(title: "4"),answer(title: "5")]),
  question("قيادي حريص علي النتائج العمليه", [answer(title: "1"),answer(title: "2"),answer(title: "3"),answer(title: "4"),answer(title: "5")]),
  question("يستمتع بمخالطه الاخرين", [answer(title: "1"),answer(title: "2"),answer(title: "3"),answer(title: "4"),answer(title: "5")]),
  question("قيادي حريص علي النتائج العمليه", [answer(title: "1"),answer(title: "2"),answer(title: "3"),answer(title: "4"),answer(title: "5")]),
  question("يستمتع بمخالطه ", [answer(title: "1"),answer(title: "2"),answer(title: "3"),answer(title: "4"),answer(title: "5")]),
];
List<question> wazenquestions = [
  question("قيادي حريص علي النتائج العمليه",  [answer(title: "نعم"),answer(title: "احيانا"),answer(title: "ابدا")]),
  question("يستمتع بمخالطه الاخرين", [answer(title: "نعم"),answer(title: "احيانا"),answer(title: "ابدا")]),
  question("قيادي حريص علي النتائج العمليه", [answer(title: "نعم"),answer(title: "احيانا"),answer(title: "ابدا")]),
  question("يستمتع بمخالطه الاخرين", [answer(title: "نعم"),answer(title: "احيانا"),answer(title: "ابدا")]),
  question("قيادي حريص علي النتائج العمليه", [answer(title: "نعم"),answer(title: "احيانا"),answer(title: "ابدا")]),
  question("يستمتع بمخالطه ", [answer(title: "نعم"),answer(title: "احيانا"),answer(title: "ابدا")]),
];
List<question> fare2questions = [
  question("قيادي حريص علي النتائج العمليه", [answer(title: "نعم"),answer(title: "لا")]),
  question("يستمتع بمخالطه الاخرين", [answer(title: "نعم"),answer(title: "لا")]),
  question("قيادي حريص علي النتائج العمليه", [answer(title: "نعم"),answer(title: "لا")]),
  question("يستمتع بمخالطه الاخرين", [answer(title: "نعم"),answer(title: "لا")]),
  question("قيادي حريص علي النتائج العمليه", [answer(title: "نعم"),answer(title: "لا")]),
  question("يستمتع بمخالطه ", [answer(title: "نعم"),answer(title: "لا")]),
];

class question
{
 String Question;
 List<answer>answers;
 String? selectedanswer ;
 int ? correctindex ;
 question(this.Question, this.answers , {this.selectedanswer,this.correctindex});
}
class answer
{
  String? title;
  int ?index ;
  bool selected =false;
  answer({this.title,this.index});
}