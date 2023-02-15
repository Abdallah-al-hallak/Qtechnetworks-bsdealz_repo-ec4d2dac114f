import 'dart:async';
import 'dart:developer';
import 'package:bsdealz/layouts/items/buttons/MainButton.dart';

import 'package:bsdealz/layouts/items/textboxes/BaseEditText.dart';
import 'package:bsdealz/layouts/items/textboxes/CustomTextbox.dart';
import 'package:bsdealz/layouts/items/textboxes/TextboxEmail.dart';
import 'package:bsdealz/layouts/items/textboxes/TextboxPassword.dart';
import 'package:bsdealz/layouts/items/textboxes/TextboxPhone.dart';
import 'package:bsdealz/layouts/pages/credentials/login.dart';
import 'package:bsdealz/network/HttpAPI.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../../dialogs/main_dialog.dart';
import '../../forms/Validator.dart';



class Signup extends StatefulWidget{
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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

      Scaffold(
        resizeToAvoidBottomInset: false,
          body:SafeArea(
          child:Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/images/signup.png"),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: SignupForm1(),
      )
      )
      );

  }


}
// Define a custom Form widget.
class SignupForm1 extends StatefulWidget {
  @override
  SignupForm1State createState() {
    return SignupForm1State();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class SignupForm1State extends State<SignupForm1> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MySignupForm1State>.
  final _formKey = GlobalKey<FormState>();
  //FirebaseAuth auth = FirebaseAuth.instance;
  TextboxPhone phoneet=TextboxPhone(margin: 5,marginh: 20,controller: TextEditingController(), text: 'phone', validator: '',countryCode: '964');
  //BaseEditText nameet=BaseEditText(margin: 5,marginh: 20,controller: TextEditingController(), text: 'name', maxLines: 1, iconData: Icons.person, validationType: ValidationType.EMAIL, type:TextBoxType.EMAIL, width: null,);
  //TextboxEmail email=TextboxEmail(margin: 5,marginh: 20,controller: TextEditingController(), text: 'email', validator: '');
  TextboxPassword pass=TextboxPassword(text:"Password",margin: 10,marginh: 30,controller: TextEditingController(), validator: '',);
  TextboxPassword repass=TextboxPassword(text:"Confirm password",margin: 10,marginh: 30,controller: TextEditingController(), validator: '',);
  String token="";
  BaseEditText email=BaseEditText(text: "Email", margin: 5, marginh: 20, focusNode:FocusNode(),isValidationDialog: true,validationType: ValidationType.EMAIL, controller: TextEditingController(), type: TextBoxType.EMAIL, maxLines: 1, width: 305, height: 55);
  BaseEditText fname=BaseEditText(text: "First Name", margin: 0, marginh: 20, focusNode:FocusNode(),isValidationDialog: true,validationType: ValidationType.TEXT, controller: TextEditingController(), type: TextBoxType.TEXT, maxLines: 1, width: 305, height: 55);
  BaseEditText lname=BaseEditText(text: "Last Name", margin: 0, marginh: 20, focusNode:FocusNode(),isValidationDialog: true,validationType: ValidationType.TEXT, controller: TextEditingController(), type: TextBoxType.TEXT, maxLines: 1, width: 305, height: 55);
  //BaseEditText email=BaseEditText(text: "Name", margin: 20, marginh: 20, focusNode:FocusNode(),isValidationDialog: true,validationType: ValidationType.TEXT, controller: TextEditingController(), type: TextBoxType.TEXT, maxLines: 1, width: 305, height: 55);


  @override
  Widget build(BuildContext context) {

    // Build a Form widget using the _formKey created above.

    return
        Form(
        key: _formKey,

            child: ListView(

            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                alignment:Alignment.center,
                child: Text("Please enter your phone number \nYou’ll receive a 4-digit code to verify next",
                    style:TextStyle( color:Colors.grey[700],fontSize: 16)),
              ),

              Container(
                  margin: EdgeInsets.all(10),
                  child: fname),
              Container(
                  margin: EdgeInsets.all(10),
                  child: lname),

              Container(
              margin: EdgeInsets.all(10),
              child: email),
              Container(

                  margin: EdgeInsets.all(10),
                  child: phoneet),
               pass,
               repass,
              Container(height: 100,),
              GestureDetector(
                onTap: (){
                  _launchURL('https://bsdealz.com/privacy-policy.pdf');
                },
                child: Container(alignment:Alignment.center,
                  child: Text("By creating an account, you agree to our\n"
                      "Terms of Service & Privacy Policy",
                      style:TextStyle( color:Colors.grey[700],fontSize: 14),textAlign: TextAlign.center,),
                ),
              ),
              MainButton(
                text: "CONTINUE",onPressed: () async {

                if( validateForm([fname,lname,email],[pass,repass])) {
                 // register();
              if(phoneet.controller.text.length==9){



                EasyLoading.show(status: 'loading...', );

                // if(pass.controller.text.toString()!=repass.controller.text.toString()){
                //   repass.validator='* Passwords Mismatch';
                // }else{
                //   repass.validator=null;
                // }
                // phoneet.validator=null;
                // Validate returns true if the form is valid, otherwise false.
              //  if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  RefreshApp.of(context)!.phone=phoneet.countryCode.toString()+phoneet.controller.text.toString();
                  RefreshApp.of(context)!.password=pass.controller.text.toString();
                //  RefreshApp.of(context)!.name=lname.controller.text.toString();
                  //TODO OTP Request
                // requestOTP();
                  register();

                  //  _formKey.currentState!.validate();


                // }else{
                //   MainDialog.showMyDialog(MainDialog(title: "Failed",text: "Dismiss",
                //     descriptions: "Your input is not valid\n Please validate inputs!",type: DialogType.ERROR,customWidget: Container(),),context);
                //   EasyLoading.dismiss();
                //   //EasyLoading.showError('not valid inputs');
                // }
              }else{
                MainDialog.showMyDialog(MainDialog(title: "Failed",text: "Dismiss",
                  descriptions: "your phone not valid",type: DialogType.ERROR,customWidget: Container(),),context);
                EasyLoading.dismiss();
              }
                }
              }, isActive: true,),

              // Container(alignment: Alignment.center,margin:EdgeInsets.all(10),child:
              // SmoothPageIndicator(
              //     controller: _SignupState.controller,  // PageController
              //     count: 3,
              //     textDirection: TextDirection.ltr,
              //     effect:  WormEffect(
              //         spacing:  8.0,
              //         radius:  7.0,
              //         dotWidth:  7.0,
              //         dotHeight:  7.0,
              //         paintStyle:  PaintingStyle.fill,
              //         strokeWidth:  0.1,
              //         dotColor:  Colors.grey,
              //         activeDotColor:  Colors.grey
              //     ),
              //     onDotClicked: (index){
              //
              //     }
              // ),),

            ]
        )
    );
  }
  void _launchURL(_url) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not Open';

  register() async {

    Dio dio=HttpAPI().Inisalize(context);
    var responce = await dio.post("/register",
        data: {
          "first_name" : fname.controller.text.toString(),
          "last_name" : lname.controller.text.toString(),
          "email" : email.controller.text.toString(),
          "phone" :  RefreshApp.of(context)!.phone.toString(),
          "password" :pass.controller.text.toString(),
          "confirm_password" : repass.controller.text.toString()
        }).then((value){
      EasyLoading.dismiss();
      if (HttpAPI().APIValidateResponce(value)) {
        Navigator.popUntil(context, ModalRoute.withName('/login'));
        Navigator.push(context, MaterialPageRoute(builder: (context) => Login(destination: "1")));
        MainDialog.showMyDialog(MainDialog(title: "Register Success", descriptions: "continue to login", text: "", type: DialogType.SUCCESS, customWidget: Container())
            , context);

      }else{
        String message='';
        if(value.data['errors']['email']!=null){
          message=value.data['errors']['email'][0];
          (message!+"\n"+  value.data['errors']['email'][0]);
        }
        if(value.data['errors']['password']!=null){
          message=(message!+"\n"+ value.data['errors']['password'][0]);
        }
        if(value.data['errors']['confirm_password']!=null){
          message=(message!+"\n"+value.data['errors']['confirm_password'][0]);
        }
        MainDialog.showMyDialog(MainDialog(title: "Register Error", descriptions: message, text: "", type: DialogType.ERROR, customWidget: Container())
            , context);
      //  EasyLoading.showError('Too many attempts.\n retry after few hours');
      }
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      log(error.toString());
      MainDialog.showMyDialog(MainDialog(title: "Register Error", descriptions: error.toString(), text: "", type: DialogType.ERROR, customWidget: Container())
          , context);
    });
  }
  requestOTP() async {

    Dio dio=HttpAPI().Inisalize(context);
    var responce = await dio.post("/requestotp",
        data: {
          "phone":RefreshApp.of(context)!.phone.toString(),
        }).then((value){
      if (HttpAPI().APIValidateResponce(value)) {
        EasyLoading.dismiss();
       // Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneValidation()));


      }else{

        MainDialog.showMyDialog(MainDialog(title: "Register Error", descriptions: "already exists email", text: "", type: DialogType.ERROR, customWidget: Container())
            , context);
      }
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      log(error.toString());
      EasyLoading.showError(error.toString());
    });
  }
  bool validateForm(List<BaseEditText> editTexts,List<TextboxPassword> editPasswords){
    for(int i=0;i<editTexts.length;i++){
      BaseEditText currentEdittext=editTexts.elementAt(i);
      String v=Validator.validate(currentEdittext.controller.text.toString(),currentEdittext.validationType);
      if(v.isNotEmpty){
        if(currentEdittext.isValidationDialog){
          MainDialog.showMyDialog(MainDialog(title: currentEdittext.text.toString(),text: "${AppSettingTheme.getTheme(context,Config.DISMISS_KEY,Config.DISMISS_VALUE,)}",
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
    for(int i=0;i<editPasswords.length;i++){
      TextboxPassword currentEdittext=editPasswords.elementAt(i);
      String v=Validator.validate(currentEdittext.controller.text.toString(),ValidationType.PASSWORD);
      if(v.isNotEmpty){
        MainDialog.showMyDialog(MainDialog(title: currentEdittext.text.toString(),text: "${AppSettingTheme.getTheme(context,Config.DISMISS_KEY,Config.DISMISS_VALUE,)}",
          descriptions: v,type: DialogType.ERROR,customWidget: Container(),),context);
        currentEdittext.focusNode?.requestFocus();
        return false;
      }
    }
    return true;
  }

}
