import 'dart:developer';


import 'package:bsdealz/layouts/forms/Validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';

enum TextBoxType{TEXT,EMAIL,PHONE,AMOUNT,NUMBER,DATETIME,ONE_NUMBER,PASSWORD}
enum ValidationType{EMAIL,PASSWORD,PHONE,TEXT,NUMBER,NO_VALIDATION,ONE_NUMBER}
class PromoCodeEditText extends StatefulWidget {

  String? text;

  bool isValidationDialog;
  PromoCodeEditText? nextEditText;
  PromoCodeEditText? preEditText;
  final double margin,marginh;
  final IconData ?iconData;
  final int maxLines;
  TextEditingController controller;

  final double width;
  final double height;
  String ?countryCode;
  FocusNode? focusNode;

  PromoCodeEditText({
    Key? key,
    required this.text,
    required this.margin,
    required this.marginh,

    required this.controller,

    this.iconData,
    this.countryCode,
    required this.maxLines,
    required this.width,
    required this.height,
    required this.isValidationDialog,
    this.focusNode,
    this.nextEditText,
    this.preEditText,

  }) : super(key: key);

  @override
  _PromoCodeEditTextState createState() => _PromoCodeEditTextState();

  static getBox(int type){
    if(type==1)
      return RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)), side: BorderSide(width: 2, color: Color(0XFF174785)));
    return RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)), side: BorderSide(width: 0, color: Colors.grey));
  }
}

class _PromoCodeEditTextState extends State<PromoCodeEditText> {

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    // widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    TextInputType keyboardtype=TextInputType.text;

    List<TextInputFormatter> formatter=[FilteringTextInputFormatter.singleLineFormatter];
    int maximumLength=50;
    TextAlign alignment=TextAlign.left;
    bool obscureText=false;
    bool enableSuggestions= true;
    bool autocorrect= true;
    InputDecoration inputDecoration=InputDecoration(
      counterText: '',
      hintText: widget.text,
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(10),
    );

        keyboardtype=TextInputType.text;



    return Card(
      elevation: 0,
      shape:RoundedRectangleBorder(
        // side: BorderSide(color: Colors.green, width: 0.5),
        //   F7F7F7
        //   E8E7E7
          borderRadius:BorderRadius.circular(22,)),
      child: Container(
          height: widget.height,
          width: widget.width,

          alignment: AlignmentDirectional.centerStart,
          margin:EdgeInsets.only(top:widget.margin,right: widget.marginh,left: widget.marginh),
          child:TextFormField(
            obscureText:obscureText,
            enableSuggestions:enableSuggestions,
            autocorrect:autocorrect,
            onChanged: (text){
              print("changed!! $text");

            },
            onEditingComplete: (){
              print("onEditingComplete!! ");
            },
            focusNode: widget.focusNode,
            keyboardType: keyboardtype,
            inputFormatters:formatter ,
            maxLines: widget.maxLines,
            controller:widget.controller,
            maxLength: maximumLength,
            textAlign: alignment,

            //style:TextStyle(backgroundColor: Colors.red),
            decoration:inputDecoration ,
          )),
    );

  }
}
// InputDecoration(
//             hintText: "Enter Valid Value",
//             contentPadding: EdgeInsets.all(2),
//             prefixIcon: Icon(widget.iconData),
//             labelText: widget.text,
//             enabledBorder: OutlineInputBorder(
//               borderSide:  BorderSide(width: 1, color: Colors.red),
//               borderRadius: BorderRadius.circular(16),),
//             border: OutlineInputBorder(
//               borderSide:  BorderSide(width: 1, color: Colors.red),
//               borderRadius: BorderRadius.circular(16),),
//             labelStyle:  TextStyle(
//               color: Colors.grey,
//             ),
//           )