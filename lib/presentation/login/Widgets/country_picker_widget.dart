import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mutqen/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class Country_Picker_Widget extends StatefulWidget {
  final  TextEditingController userNameController;
  final String title ;
  final IconData iconData ;
  final String validate;
  Country_Picker_Widget(this.userNameController,this.title , this.iconData ,this.validate, {Key? key}) : super(key: key);

  @override
  State<Country_Picker_Widget> createState() => _Country_Picker_WidgetState();
}

class _Country_Picker_WidgetState extends State<Country_Picker_Widget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 5,
          offset: const Offset(0, 5),
        )
      ],
          borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        readOnly: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.validate + widget.title;
          }
          return null;
        },
        onTap: () async {
          showCountryPicker(
            context: context,
            countryListTheme: CountryListThemeData(
              flagSize: 25,
              backgroundColor: Colors.white,
              textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
              bottomSheetHeight: 500, // Optional. Country list modal height
              //Optional. Sets the border radius for the bottomsheet.
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              //Optional. Styles the search field.
              inputDecoration: InputDecoration(
                labelText: 'بحث',
                hintText: 'ابحث عن دولتك',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xFF8C98A8).withOpacity(0.2),
                  ),
                ),
              ),
            ),
            onSelect: (Country country) => widget.userNameController.text=country.nameLocalized!,
          );
        },
        controller: widget.userNameController,
        textInputAction: widget.title == AppStrings.password.tr() ? TextInputAction.done:TextInputAction.next,
        decoration: InputDecoration(
          labelText: widget.title,
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 1, color: Colors.transparent)
          ) ,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 3, color: Colors.greenAccent)
          ),
          prefixIcon: Icon(widget.iconData),
        ),
      ),
    );
  }
}
