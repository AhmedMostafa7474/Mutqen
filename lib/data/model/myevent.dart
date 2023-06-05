class myevent
{
  String title;
  DateTime dateTime;
  bool iscertified;

  myevent(this.title, this.dateTime, this.iscertified);


}

List<myevent> myevents = [
  myevent("برنامج ( وازن ) جامعة بيشة", DateTime.now(), true),
  myevent("برنامج ( وازن ) جامعة بيشة", DateTime.now().add(Duration(days: 1)), false),
  myevent("برنامج ( وازن ) جامعة بيشة",  DateTime.now().add(Duration(days: 2)), true)
];