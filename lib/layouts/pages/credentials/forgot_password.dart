import 'package:bsdealz/layouts/forms/Validator.dart';
import 'package:bsdealz/layouts/items/buttons/MainButton.dart';
import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/layouts/items/textboxes/BaseEditText.dart';
import 'package:bsdealz/layouts/items/texts/FooterText.dart';
import 'package:bsdealz/layouts/items/tobars/back_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:bsdealz/network/HttpAPI.dart';

import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';


class ForgotPassword extends StatefulWidget{
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  void initState() {
    super.initState();

  }
  static final controller=PageController(
      initialPage: 1

  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Scaffold(body:SafeArea(
          child:Center(
            child: Container(

              width: 350,
              height: double.infinity,
              color: Colors.white,//Theme.of(context).primaryColor,
              child: ListView(
            children: [
              BackBar(height: 50,notificationsNumber: 0,title: "",),

              SizedBox(height: 110,),
              Center(child: AppIcon(icon: AppIcon.LOGO_PATH, size: 150)),

              Container(
                height: 400,
                width: 350,

                margin:EdgeInsets.all(5),child: //Container()
              ForgotPasswordForm1()
                ,),
            ],
              ),
            ),
          )));

  }


}
// Define a custom Form widget.
class ForgotPasswordForm1 extends StatefulWidget {
  @override
  ForgotPasswordForm1State createState() {
    return ForgotPasswordForm1State();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class ForgotPasswordForm1State extends State<ForgotPasswordForm1> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyForgotPasswordForm1State>.
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    BaseEditText emailEditText=BaseEditText(text: "${AppSettingTheme.getTheme(context,Config.EMAIL_KEY,Config.EMAIL_VALUE,)}", margin: 20, marginh: 20, focusNode:FocusNode(),isValidationDialog: true,validationType: ValidationType.EMAIL, controller: TextEditingController(), type: TextBoxType.EMAIL, maxLines: 1, width: 305, height: 55);
    BaseEditText phoneEditText=BaseEditText(text: "${AppSettingTheme.getTheme(context,Config.PHONE_KEY,Config.PHONE_VALUE,)}", margin: 20, marginh: 20, focusNode:FocusNode(),isValidationDialog: true,validationType: ValidationType.PHONE, controller: TextEditingController(), type: TextBoxType.PHONE, maxLines: 1, width: 305, height: 55);

    return
      Form(
          key: _formKey,

          child: Container(
            width: 350,
            child: ListView(

                children: <Widget>[
                  emailEditText,
                 //TODO remove comment if you want to add phone
                 // Center(child: FooterText(onPressed: (){},text: "or",clickable: false,)),
                  //phoneEditText,
                  Container(height: 40,),
                  MainButton(
                    text: "RESET PASSWORD",onPressed: () async {


                      // Validate returns true if the form is valid, otherwise false.
                    //TODO add phoneEditText if you want to add phone
                    if( Validator.validateForm(context,[emailEditText],[])) {
                        Dio dio=HttpAPI().Inisalize(context);
                        var responce = await dio.post("/forgot",
                            data: { "email": emailEditText.controller.text.toString(),});

                        if (HttpAPI().APIValidateResponce(responce)) {
                          //emailt.validator=null;
                          EasyLoading.showSuccess('Great Success!');
                          Navigator.pop(context);
                          //print("-----------"+responce.statusMessage+"------tokn:"+token);

                        }else{

                          EasyLoading.showError('wrong email!!');
                        }
                        _formKey.currentState!.validate();
                    }

                  }, isActive: true,),


                   ]
            ),
          )
      );
  }
}