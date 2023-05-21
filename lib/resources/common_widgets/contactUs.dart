import 'package:url_launcher/url_launcher.dart';

void launchCaller(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
void launchEmail(String emailAddress) async {
  // final url = "mailto:$emailAddress?subject=subject&body=body";
  final Uri params = Uri(
    scheme: 'mailto',
    path: emailAddress,
    query: 'subject=Support Request',
  );

  var url = params.toString();
  if (await canLaunchUrl(params)) {
    await launchUrl(params);
  } else {
    throw 'Could not launch $url';
  }
}
void launchMap() async {
  final url = 'https://www.google.com/maps/place/Basamh+Trading+Company/@21.553669,39.1675601,17z/data=!3m1!4b1!4m6!3m5!1s0x15c3d017484e5c6d:0xd6288fc6592c26cc!8m2!3d21.553664!4d39.170135!16s%2Fg%2F11b6206j2h';


  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}