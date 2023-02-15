
import 'package:flutter/material.dart';
import 'package:bsdealz/localization/language_constants.dart';

import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';


class TextboxPassword extends StatefulWidget {

   String? text,validator;
  final double margin,marginh;
  FocusNode? focusNode;
   final TextEditingController controller;
   TextboxPassword({
    Key? key,
    required this.text,
    required this.margin,
    required this.marginh,
    required this.validator,
    required this.controller,
     this.focusNode,
  }) : super(key: key);

  @override
  _TextboxPasswordState createState() => _TextboxPasswordState();
}

class _TextboxPasswordState extends State<TextboxPassword> {

  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {

    return Container(margin:EdgeInsets.only(top:widget.margin,right: widget.marginh,left: widget.marginh),
        child:TextFormField(
          focusNode: widget.focusNode,
          controller: widget.controller,

      validator: (value) {
        // if(widget.validator=='') {
        //   return this.isPasswordCompliant(value!) ? null : geterror(value);
        // }else{
        //   return widget.validator;
        // }
      },
          obscureText: _isHidden,

          enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(

        focusedBorder:   OutlineInputBorder(
          borderSide:  BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(16),),
        enabledBorder:   OutlineInputBorder(
          borderSide:  BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(16),),
          hintText:widget.text.toString(),
        contentPadding: EdgeInsets.all(10),
        suffix: InkWell(
          onTap: _togglePasswordView,  /// This is Magical Function
          child: Container(
            padding: EdgeInsets.all(0),
            child: Icon(
              _isHidden ?         /// CHeck Show & Hide.
              Icons.visibility_off :
              Icons.visibility,
            ),
          ),
        ),
          prefixIcon: Icon(Icons.lock_outline),
          labelText: widget.text,
          labelStyle:  TextStyle(
            color: Colors.grey,
          ),
      ),
    ));

  }
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    RegExp regExp = new RegExp(pattern);
  return true;
   // return regExp.hasMatch(value);
  }

  bool isPasswordCompliant(String password, [int minLength = 6]) {
    if (password == null || password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters = password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > minLength;

   // return true ;
    return hasDigits & hasUppercase & hasLowercase & hasSpecialCharacters & hasMinLength;
  }

  String geterror(String password, [int minLength = 6]) {
    if (password == null || password.isEmpty) {
      return "${AppSettingTheme.getTheme(context,Config.EMPTY_PASSWORD_KEY,Config.EMPTY_PASSWORD_VALUE,)}"
          .toString();
    }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters = password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length >= minLength;
    String error_msg="";
    if(!hasDigits){
      error_msg=error_msg+"${AppSettingTheme.getTheme(context,Config.HAS_DIGITS_KEY,Config.HAS_DIGITS_VALUE,)}\n";
    }
    if(!hasUppercase){
      error_msg=error_msg+"${AppSettingTheme.getTheme(context,Config.HAS_UPPERCASE_KEY,Config.HAS_UPPERCASE_VALUE,)}\n";
    }
    if(!hasLowercase){
      error_msg=error_msg+"${AppSettingTheme.getTheme(context,Config.HAS_LOWERCASE_KEY,Config.HAS_LOWERCASE_VALUE,)}\n";
    }
    if(!hasSpecialCharacters){
      error_msg=error_msg+"${AppSettingTheme.getTheme(context,Config.HAS_SPECIAL_CHARACTERS_KEY,Config.HAS_SPECIAL_CHARACTERS_VALUE,)}\n";
    }
    if(!hasMinLength){
      error_msg=error_msg+"${AppSettingTheme.getTheme(context,Config.HAS_MIN_LENGTH_KEY,Config.HAS_MIN_LENGTH_VALUE,)}";
    }

    return error_msg;
  }
}