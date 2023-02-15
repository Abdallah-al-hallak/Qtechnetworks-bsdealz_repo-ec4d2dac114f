import 'package:bsdealz/layouts/dialogs/main_dialog.dart';
import 'package:bsdealz/layouts/forms/Validator.dart';
import 'package:bsdealz/layouts/items/textboxes/BaseEditText.dart';
import 'package:bsdealz/layouts/items/textboxes/TextboxPassword.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Validator{


  static String validate(String input,ValidationType validationType){
    switch(validationType){
      case ValidationType.EMAIL:
        return isValidEmail(input);
        break;
      case ValidationType.PASSWORD:
        return isValidPassword(input);
        break;
      case ValidationType.PHONE:
        return isValidPhone(input);
        break;
      case ValidationType.TEXT:
        return isValidText(input);
        break;
      case ValidationType.NUMBER:
        return isValidNumber(input);
        break;
      case ValidationType.ONE_NUMBER:
        return isValidOneNumber(input);
        break;
      case ValidationType.NO_VALIDATION:
        return '';
        break;
    }
    return '';
  }
  static String isValidOneNumber(String number) {
    if (number == null || number.isEmpty) {
      return "shouldn't be empty";
    }
    bool isValid = number.contains(new RegExp(r'[0-9]{1}'));
    if (!isValid) {
      return "should be one number";
    }
    return '';
  }
  static String isValidNumber(String number) {
    if (number == null || number.isEmpty) {
      return "shouldn't be empty";
    }

    bool isValid = number.contains(new RegExp(r'[0-9]'));
    if(!isValid){
      return "should be a number";
    }
    return '';
  }
  static String isValidText(String text) {
    if (text == null || text.isEmpty) {
      return "shouldn't be empty";
    }
    return '';
  }
  static String isValidEmail(String email){
    if (email == null || email.isEmpty) {
      return "shouldn't be empty";
    }
    if(!EmailValidator.validate(email)){
      return "should be a valid one";
    }
    return '';
  }
  static String isValidPhone(String phone) {
    if (phone == null || phone.isEmpty) {
      return "shouldn't be empty";
    }
    if(phone.startsWith('0')){
      return "shouldn't start with '0'";
    }
    bool isValidPhone = phone.contains(new RegExp(r'(^(?:[+0]9[0-9]?)?([0-9]{9})$)'));
    if(!isValidPhone){
      return "should be a valid one";
    }
    return '';
  }

static String isValidPassword(String password) {
    int minLength = 6;
    if (password == null || password.isEmpty) {
      return "shouldn't be empty";
    }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters = password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length >= minLength;
    String error_msg="";
    if(!hasDigits){
      error_msg=error_msg+"* Should contain Digits.\n";
    }
    if(!hasUppercase){
      error_msg=error_msg+"* Should contain Uppercase.\n";
    }
    if(!hasLowercase){
      error_msg=error_msg+"* Should contain Lowercase.\n";
    }
    if(!hasSpecialCharacters){
      error_msg=error_msg+"* Should contain Special Characters.\n";
    }
    if(!hasMinLength){
      error_msg=error_msg+"* MinLength is $minLength.";
    }

    return error_msg;
  }

 static bool validateForm(BuildContext context,List<BaseEditText> editTexts,List<TextboxPassword> editPasswords){
    for(int i=0;i<editTexts.length;i++){
      BaseEditText currentEdittext=editTexts.elementAt(i);
      String v=validate(currentEdittext.controller.text.toString(),currentEdittext.validationType);
      if(v.isNotEmpty){
        if(currentEdittext.isValidationDialog){
          MainDialog.showMyDialog(MainDialog(title: currentEdittext.text.toString(),text: "Dismiss",
            descriptions: v,type: DialogType.ERROR,customWidget: Container(),),context);
        }else{
          Fluttertoast.showToast(
              msg: "${currentEdittext.text} $v",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
        currentEdittext.focusNode?.requestFocus();

        return false;
      }
    }

    String passwordHolder='';
    for(int i=0;i<editPasswords.length;i++){

      TextboxPassword currentEdittext=editPasswords.elementAt(i);

      print("passwordHolder $passwordHolder");
      String v=Validator.validate(currentEdittext.controller.text.toString(),ValidationType.PASSWORD);
      if(v.isNotEmpty){
        MainDialog.showMyDialog(MainDialog(title: currentEdittext.text.toString(),text: "Dismiss",
          descriptions: v,type: DialogType.INFO,customWidget: Container(),),context);
        currentEdittext.focusNode?.requestFocus();
        return false;
      }
      if((editPasswords.length==2) && (i>0)|| (editPasswords.length==3) && (i>1)){
        print("pas check $passwordHolder  ${currentEdittext.controller.text.toString()}");
        if(currentEdittext.controller.text.toString()!=passwordHolder){
          MainDialog.showMyDialog(MainDialog(title: currentEdittext.text.toString(),text: "Dismiss",
            descriptions: "password and confirm password do not match",type: DialogType.INFO,customWidget: Container(),),context);
          currentEdittext.focusNode?.requestFocus();
          return false;
        }
      }
      passwordHolder=currentEdittext.controller.text.toString();
    }
    return true;
  }
}