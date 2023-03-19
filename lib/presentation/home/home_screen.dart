import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/model/user.dart';

class home_page extends StatefulWidget {
  User user;
  home_page(this.user, {Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState(user);
}

class _home_pageState extends State<home_page> {
  User user;
  _home_pageState(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Hello "+ user.name!),),
    );
  }
}
