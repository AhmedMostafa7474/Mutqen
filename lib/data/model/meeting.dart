import 'package:mutqen/resources/assets_manager.dart';

class meeting
{
  String instructor_name;
  String instructor_image;
  DateTime meeting_time;
  String meetingn_subject;

  meeting(this.instructor_name, this.instructor_image, this.meeting_time,
      this.meetingn_subject);
}
List<meeting> Meetings=[
  meeting("خالد حيدر عبدالله", ImageAssets.meetingimage, DateTime.now(), "ملتقي كافيه ملتقي كافيه ملتقي كافيه ملتقي كافيه ملتقي كافيه ملتقي كافيه ملتقي كافيه ملتقي كافيه ملتقي كافيه ملتقي كافيه ملتقي كافيه"),
  meeting("محمد غنيم", ImageAssets.meetingimage, DateTime.now().add(Duration(hours: 2)), "ملتقي التوجيه المهني"),
  meeting("مها بنت نوح المطيري", ImageAssets.meetingimage, DateTime.now().add(Duration(days: 1)), "وازن")
];
List<String>meetingtitle=["الموعد","الموضوع"];