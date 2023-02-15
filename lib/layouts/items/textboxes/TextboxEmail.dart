import 'package:bsdealz/localization/language_constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';



class TextboxEmail extends StatefulWidget {

  final String text;
  String validator;
  final double margin,marginh;
  final TextEditingController controller;
   TextboxEmail({
    Key? key,
     required this.text,
     required this.margin,
     required this.marginh,
     required this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  _TextboxEmailState createState() => _TextboxEmailState();
}

class _TextboxEmailState extends State<TextboxEmail> {

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
   // widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(margin:EdgeInsets.only(top:widget.margin,right: widget.marginh,left: widget.marginh),
        child:TextFormField(
            controller:widget.controller,
      validator: (value) {
        if(widget.validator=='') {
          return EmailValidator.validate(value.toString())
              ? null
              : "${AppSettingTheme.getTheme(context,Config.EMAIL_INVALID_KEY,Config.EMAIL_INVALID_VALUE,)}"
              .toString();
        }else{
          return widget.validator;
        }
      },
      decoration: InputDecoration(
        hintText: "${AppSettingTheme.getTheme(context,Config.EMAIL_KEY,Config.EMAIL_VALUE,)}"
            .toString(),

        contentPadding: EdgeInsets.all(2),
      //  prefixIcon: Icon(Icons.mail_outline),
        labelText:"${AppSettingTheme.getTheme(context,Config.EMAIL_KEY,Config.EMAIL_VALUE,)}"
            .toString(),
        labelStyle:  TextStyle(
      color: Colors.grey,
      )

      ),
    ));

  }
}