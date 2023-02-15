import 'dart:async';
import 'dart:developer';

import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/layouts/items/texts/FooterText.dart';
import 'package:bsdealz/localization/language_constants.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../texts/BaseText.dart';


class TextboxPhone extends StatefulWidget {

   String? text,validator,countryCode;
  final double margin,marginh;
  final TextEditingController controller;

   TextboxPhone({
    Key? key,
    required this.text,
    required this.margin,
    required this.marginh,
    required this.validator,
    required this.controller,
    required this.countryCode,

  }) : super(key: key);

  @override
  _TextboxPhoneState createState() => _TextboxPhoneState();
}

class _TextboxPhoneState extends State<TextboxPhone> {

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(margin:EdgeInsets.only(top:widget.margin,right: widget.marginh,left: widget.marginh),
        child: Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly,],
        onChanged: (text){
            log("onChangedt"+text);
          if(text.startsWith('0')){
            Timer(Duration(milliseconds:50), (){
              widget.controller.clear();//='';//widget.controller.text.substring(1, widget.controller.text.length);


            });

          }
        },
        validator:  (value) {
          if(widget.validator==null){
            return null;
          }

            return widget.validator;

        },
            controller:widget.controller,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "*********",
                enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(width: 1, color: Colors.grey),
                  gapPadding: 2,
                  borderRadius: BorderRadius.circular(15),),
                prefixIcon: InkWell(
                  onTap: (){
                    showCountryPicker(
                      onSelect: (Country country){
                        setState(() {
                          log(country.phoneCode.toString());
                          widget.countryCode=country.phoneCode.toString();
                        });

                      },
                      context: context,
                      showPhoneCode: true,
                      favorite: ['IQ','AE','JO'],
                      // optional. Shows only country name and flag
                      exclude: <String>['IL'], //It takes a list of country code(iso2).

                    );
                  },
                  child: Container(
                    width: 60,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [Container(
                          width: 40,
                          height: 20,

                          child:Center(child: Text("+"+widget.countryCode.toString(),style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),)
                      ),
                      AppIcon(icon: AppIcon.ARROW_DOWN_PATH, size: 10)
                      ],
                    
                    ),
                  ),
                ),

                labelText: "${AppSettingTheme.getTheme(context,Config.PHONE_KEY,Config.PHONE_VALUE,)}"
                    .toString(),
                labelStyle:  TextStyle(
                  color: Colors.grey,
                )

            ),
          ),
        ));

  }

  bool isValidPhone(String phone) {
    if (phone == null || phone.isEmpty) {
      return false;
    }

    bool isValidPhone = phone.contains(new RegExp(r'(^(?:[+0]9[0-9]?)?([0-9]{10})$)'));


    return isValidPhone;
  }

  String? geterror(String phone) {
    if (phone == null || phone.isEmpty) {
      return "${AppSettingTheme.getTheme(context,Config.PHONE_INVALID_KEY,Config.PHONE_INVALID_VALUE,)}";
    }

    bool isValidPhone = phone.contains(new RegExp(r'(^(?:[+0]9[0-9]?)?([0-9]{10})$)'));
    if(!isValidPhone) {
      return "${AppSettingTheme.getTheme(context,Config.PHONE_INVALID_KEY,Config.PHONE_INVALID_VALUE,)}";
    }else{
      return null;
    }
  }
}

