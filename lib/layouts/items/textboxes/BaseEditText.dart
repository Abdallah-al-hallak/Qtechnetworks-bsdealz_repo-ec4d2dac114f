import 'dart:developer';


import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';

enum TextBoxType{TEXT,EMAIL,PHONE,AMOUNT,NUMBER,DATETIME,ONE_NUMBER,PASSWORD}
enum ValidationType{EMAIL,PASSWORD,PHONE,TEXT,NUMBER,NO_VALIDATION,ONE_NUMBER}
class BaseEditText extends StatefulWidget {

  String? text;
  ValidationType validationType;
  bool isValidationDialog;
  BaseEditText? nextEditText;
  BaseEditText? preEditText;
  final double margin,marginh;
  final IconData ?iconData;
  final int maxLines;
   TextEditingController controller;
  final TextBoxType type;
  final double width;
  final double height;
  String ?countryCode;
  FocusNode? focusNode;

  BaseEditText({
    Key? key,
    required this.text,
    required this.margin,
    required this.marginh,
   required this.validationType,
    required this.controller,
    required this.type,
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
  _BaseEditTextState createState() => _BaseEditTextState();

  static getBox(int type){
    if(type==1)
      return RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)), side: BorderSide(width: 2, color: Color(0XFF174785)));
    return RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)), side: BorderSide(width: 0, color: Colors.grey));
  }
}

class _BaseEditTextState extends State<BaseEditText> {

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    // widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    TextInputType keyboardtype=TextInputType.text;
    TextBoxType textBoxType=widget.type;
    List<TextInputFormatter> formatter=[FilteringTextInputFormatter.singleLineFormatter];
    int maximumLength=150;
    TextAlign alignment=TextAlign.left;
    bool obscureText=false;
    bool enableSuggestions= true;
    bool autocorrect= true;
    InputDecoration inputDecoration=InputDecoration(
      hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[400]),
      counterText: '',
      hintText: widget.text,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.all(10),
      enabledBorder: OutlineInputBorder(
      borderSide:  BorderSide(width: 1, color: Colors.red),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(16),),
      border: OutlineInputBorder(
        borderSide:  BorderSide(width: 1, color: Colors.red),
        borderRadius: BorderRadius.circular(16),),
      focusedBorder:   OutlineInputBorder(
        borderSide:  BorderSide(width: 1, color: Colors.red),
        borderRadius: BorderRadius.circular(16),),);
    switch (textBoxType) {
      case TextBoxType.TEXT:
        keyboardtype=TextInputType.text;
        break;
        case TextBoxType.ONE_NUMBER:
          keyboardtype=TextInputType.numberWithOptions(decimal: false,signed: false);
          formatter=[FilteringTextInputFormatter.digitsOnly];
          maximumLength=1;
          alignment=TextAlign.center;
        break;
      case TextBoxType.NUMBER:
        keyboardtype=TextInputType.numberWithOptions(decimal: false,signed: false);
        formatter=[FilteringTextInputFormatter.digitsOnly];
        break;

      case TextBoxType.PHONE:
        keyboardtype=TextInputType.numberWithOptions(decimal: false,signed: true);
        formatter=[FilteringTextInputFormatter.digitsOnly];
        inputDecoration=InputDecoration(
            counterText: '',
            hintText: "*********",
            enabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(width: 1, color: Colors.red),
              gapPadding: 2,
              borderRadius: BorderRadius.circular(16),),
            border: OutlineInputBorder(
              borderSide:  BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(16),),
            focusedBorder:   OutlineInputBorder(
              borderSide:  BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(16),),
            prefixIcon: Container(
              //  width: 150,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    side: BorderSide(width: 0, color: Theme.of(context).primaryColor)),
                child: Container(
                  //width: 150,
                  color: Theme.of(context).cardColor,
                  child: InkWell(
                    onTap: (){
                      showCountryPicker(
                        onSelect: (Country country){
                          log(country.phoneCode.toString());
                          widget.countryCode=country.phoneCode.toString();
                        },
                        context: context,

                        favorite: ['+964','IRQ','+971','UAE','+962','JO'],
                        // optional. Shows only country name and flag
                        exclude: <String>['IL'], //It takes a list of country code(iso2).

                      );
                    },
                    child: Container(
                      //  width: 150,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            side: BorderSide(width: 0, color: Theme.of(context).primaryColor)),
                        child: Container(
                          //width: 150,
                          color: Theme.of(context).cardColor,
                          child:Text(widget.countryCode.toString()),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            labelText:"${AppSettingTheme.getTheme(context,Config.PHONE_KEY,Config.PHONE_VALUE,)}",
            labelStyle:  TextStyle(
              color: Colors.black,
            )

        );
        break;
      case TextBoxType.EMAIL:
        keyboardtype=TextInputType.emailAddress;
        inputDecoration= InputDecoration(
          counterText: '',
            hintText:"${AppSettingTheme.getTheme(context,Config.EMAIL_KEY,Config.EMAIL_VALUE,)}"
                .toString(),
            enabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(16),),
            border: OutlineInputBorder(
              borderSide:  BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(16),),
            contentPadding: EdgeInsets.all(2),
             prefixIcon: Icon(Icons.mail_outline),
            labelText: "${AppSettingTheme.getTheme(context,Config.EMAIL_KEY,Config.EMAIL_VALUE,)}"
                .toString(),
            labelStyle:  TextStyle(
              color: Colors.grey,
            ),
            focusedBorder:   OutlineInputBorder(
        borderSide:  BorderSide(width: 1, color: Colors.red),
    borderRadius: BorderRadius.circular(16),),
        );
        break;
      case TextBoxType.DATETIME:
        keyboardtype=TextInputType.datetime;
        break;
      case TextBoxType.AMOUNT:
        keyboardtype=TextInputType.numberWithOptions(decimal: true,signed: false);
        formatter=[FilteringTextInputFormatter.digitsOnly];
        break;
      case TextBoxType.PASSWORD:
        keyboardtype=TextInputType.text;
         obscureText= true;

         enableSuggestions= true;
          autocorrect= true;
        break;

    }

    return Container(
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

            if(textBoxType==TextBoxType.ONE_NUMBER) {
              if (text.isNotEmpty && text != '-') {
                // if( widget.nextEditText!.controller.text=='-')
                // widget.nextEditText!.controller=TextEditingController(text: "-");
                widget.nextEditText!.focusNode!.requestFocus();
              } else {
                widget.preEditText!.focusNode!.requestFocus();
                widget!.controller = TextEditingController(text: "-");
                setState(() {
                  widget.text = '-';
                });
              }
            }
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
        ));

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