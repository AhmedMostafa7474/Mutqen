import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/data/model/city.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../business/cityBloc/citytext_cubit.dart';

class city_dropdown_Widget extends StatefulWidget {
  final  TextEditingController userNameController;
  final String title ;
  final IconData iconData ;
  final String validate;
  final List<String> items;
  final List<City> cities;
  double height;
  String cityid;
  GlobalKey<State<StatefulWidget>>? bottomkey ;
  city_dropdown_Widget(this.userNameController,this.title , this.iconData ,this.validate,this.items,
      {Key? key,this.height = 0, this.bottomkey,this.cities = const [],this.cityid =""}) : super(key: key);

  @override
  State<city_dropdown_Widget> createState() => _city_dropdown_WidgetState();
}

class _city_dropdown_WidgetState extends State<city_dropdown_Widget> {
  bool shadowshowen = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitytextCubit, String>(
      builder: (context, state) {
        print(state +" ##############");
        return Container(
          height: widget.height == 0? null :widget.height,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: shadowshowen?Colors.grey.withOpacity(0.3): Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
              borderRadius: BorderRadius.circular(15)),
          child: DropdownButtonFormField<dynamic>(
              validator: (value) {
                shadowshowen = false;
                if (value == null ) {
                  return widget.validate + widget.title;
                }
                return null;
              },borderRadius: BorderRadius.circular(30),itemHeight: 55,style:const TextStyle(fontSize: 18,color: Colors.black,),menuMaxHeight: 250.h,
              autovalidateMode: AutovalidateMode.onUserInteraction,

              decoration: InputDecoration(
                labelText: widget.title,
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(width: 1, color: Colors.transparent)
                ) ,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(width: 2, color: Colors.greenAccent)
                ),
                prefixIcon: Icon(widget.iconData),

              ), onChanged: (value) {
            widget.userNameController.text = value.toString()!;
            state = value.toString();
            if(widget.bottomkey !=null)
            {
              print(widget.userNameController.text);
              widget.bottomkey!.currentState!.setState(() {
              });
            }
          },
              items: widget.items.isNotEmpty ? widget.items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList() :
              widget.cities.map((City item) {
                return DropdownMenuItem(
                  value: widget.cities.length ==1 || widget.cities[0] == item? 3889 : item.id,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.cities.length ==1 || widget.cities[0] == item? "اخري": item.name),
                    ],
                  ),
                );
              }).toList()
          ),
        );
      },
    );
  }
}