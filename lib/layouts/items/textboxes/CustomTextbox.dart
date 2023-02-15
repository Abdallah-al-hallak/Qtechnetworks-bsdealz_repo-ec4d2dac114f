import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';

enum cTextBoxType{TEXT,EMAIL,PHONE,AMOUNT,NUMBER,DATETIME}
class CustomTextbox extends StatefulWidget {

  final String text,validator;
  final double margin,marginh;
  final IconData ?iconData;
  final int maxLines;
  final TextEditingController controller;
  final cTextBoxType type;
   CustomTextbox({
    Key? key,
    required this.text,
    required this.margin,
    required this.marginh,
    required this.validator,
    required this.controller,
     required this.type,
     this.iconData,
    required this.maxLines,
  }) : super(key: key);

  @override
  _CustomTextboxState createState() => _CustomTextboxState();

  static getBox(int type){
    if(type==1)
      return RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)), side: BorderSide(width: 2, color: Color(0XFF174785)));
    return RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)), side: BorderSide(width: 0, color: Colors.grey));
  }
}

class _CustomTextboxState extends State<CustomTextbox> {

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
   // widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextInputType keyboardtype=TextInputType.text;
    cTextBoxType textBoxType=widget.type;
   List<TextInputFormatter> formatter=[FilteringTextInputFormatter.singleLineFormatter];
    switch (textBoxType) {
      case cTextBoxType.TEXT:
         keyboardtype=TextInputType.text;
        break;
      case cTextBoxType.NUMBER:
        keyboardtype=TextInputType.numberWithOptions(decimal: false,signed: false);
        formatter=[FilteringTextInputFormatter.digitsOnly];
        break;
      case cTextBoxType.PHONE:
       keyboardtype=TextInputType.numberWithOptions(decimal: false,signed: true);
       formatter=[FilteringTextInputFormatter.digitsOnly];
        break;
      case cTextBoxType.EMAIL:
        keyboardtype=TextInputType.emailAddress;
        break;
        case cTextBoxType.DATETIME:
      keyboardtype=TextInputType.datetime;
      break;
      case cTextBoxType.AMOUNT:
        keyboardtype=TextInputType.numberWithOptions(decimal: true,signed: false);
        formatter=[FilteringTextInputFormatter.digitsOnly];
        break;
    }
    return Container(
        height: 40,

        margin:EdgeInsets.only(top:widget.margin,right: widget.marginh,left: widget.marginh),
        child:TextFormField(
          keyboardType: keyboardtype,
          inputFormatters:formatter ,
          maxLines: widget.maxLines,
          controller:widget.controller,
          validator: (value) {
            if(widget.validator=='') {
              return true
                  ? null
                  : "Please enter a valid Value";
            }else{
              return widget.validator;
            }
          },
          decoration: InputDecoration(
              hintText: "${AppSettingTheme.getTheme(context,Config.VALID_VALUE_KEY,Config.VALID_VALUE_VALUE,)}",
              contentPadding: EdgeInsets.all(2),
             // prefixIcon: Icon(widget.iconData),
              labelText: widget.text,
                enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(width: 1, color: Colors.grey),

                  borderRadius: BorderRadius.circular(8),),
                labelStyle:  TextStyle(
                  color: Colors.grey,
                ),

          ),
        ));

  }
}