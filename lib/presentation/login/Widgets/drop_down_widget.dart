import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mutqen/business/collegeBloc/college_cubit.dart';
import 'package:mutqen/data/model/city.dart';
import 'package:mutqen/data/model/college.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class Drop_Down_Widget extends StatefulWidget {
  final  TextEditingController userNameController;
  final String title ;
  final IconData iconData ;
  final String validate;
  final List<String> items;
  final List<City> cities;
  final List<College> colleges;
  double height;
  String cityid;

  GlobalKey<State<StatefulWidget>>? bottomkey ;
  Drop_Down_Widget(this.userNameController,this.title , this.iconData ,this.validate,this.items,
      {Key? key,this.height = 0, this.bottomkey,this.cities = const []
        ,this.cityid ="",this.colleges = const []}) : super(key: key);

  @override
  State<Drop_Down_Widget> createState() => _Drop_Down_WidgetState();
}

class _Drop_Down_WidgetState extends State<Drop_Down_Widget> {
  bool shadowshowen = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
        widget.cityid = value.toString();
        widget.userNameController.text = value.toString()!;
        if(widget.bottomkey !=null)
        {
          widget.bottomkey!.currentState!.setState(() {
          });
        }
        if(widget.title == AppStrings.university.tr())
          {
            print(value);
            BlocProvider.of<CollegeCubit>(context).GetColleges(value.toString());
          }
      },

          value: widget.userNameController.text.isNotEmpty && widget.title == AppStrings.city.tr() ?
          int.parse(widget.userNameController.text) : null,
          items: widget.items.isNotEmpty ? widget.items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList() :
          widget.cities.isNotEmpty?
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
          :
          widget.colleges.map((College item) {
            return DropdownMenuItem(
              value: item.id ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(item.name)
                ],
              ),
            );
          }).toList()
      ),
    );
  }
}