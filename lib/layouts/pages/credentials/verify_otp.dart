import 'package:bsdealz/layouts/forms/Validator.dart';
import 'package:bsdealz/layouts/items/buttons/MainButton.dart';
import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/layouts/items/textboxes/BaseEditText.dart';
import 'package:bsdealz/layouts/items/texts/FooterText.dart';
import 'package:bsdealz/layouts/items/texts/SubTitleText.dart';
import 'package:bsdealz/layouts/items/tobars/back_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:bsdealz/network/HttpAPI.dart';


class VerifyOTP extends StatefulWidget{
  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
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
                  SizedBox(height: 34,),
                  Center(child: SubTitleText(text: "Enter the verification code", onPressed: (){}, clickable: false)),
                  SizedBox(height: 14,),
                  Container(
                    height: 400,
                    width: 350,

                    margin:EdgeInsets.all(5),child: //Container()
                  VerifyOTPForm1()
                    ,),

                ],
              ),
            ),
          )));

  }


}
// Define a custom Form widget.
class VerifyOTPForm1 extends StatefulWidget {
  @override
  VerifyOTPForm1State createState() {
    return VerifyOTPForm1State();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class VerifyOTPForm1State extends State<VerifyOTPForm1> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyVerifyOTPForm1State>.
  final _formKey = GlobalKey<FormState>();

  List<BaseEditText> otpEditTexts=[
  BaseEditText(text: "", margin: 1, marginh: 5, focusNode:FocusNode(),isValidationDialog: false,validationType: ValidationType.ONE_NUMBER, controller: TextEditingController(text: "-"), type: TextBoxType.ONE_NUMBER, maxLines: 1, width: 45, height: 60),
  BaseEditText(text: "", margin: 1, marginh: 5, focusNode:FocusNode(),isValidationDialog: false,validationType: ValidationType.ONE_NUMBER, controller: TextEditingController(text: "-"), type: TextBoxType.ONE_NUMBER, maxLines: 1, width: 45, height: 60),
  BaseEditText(text: "", margin: 1, marginh: 5, focusNode:FocusNode(),isValidationDialog: false,validationType: ValidationType.ONE_NUMBER, controller: TextEditingController(text: "-"), type: TextBoxType.ONE_NUMBER, maxLines: 1, width: 45, height: 60),
  BaseEditText(text: "", margin: 1, marginh: 5, focusNode:FocusNode(),isValidationDialog: false,validationType: ValidationType.ONE_NUMBER, controller: TextEditingController(text: "-"), type: TextBoxType.ONE_NUMBER, maxLines: 1, width: 45, height: 60),
  BaseEditText(text: "", margin: 1, marginh: 5, focusNode:FocusNode(),isValidationDialog: false,validationType: ValidationType.ONE_NUMBER, controller: TextEditingController(text: "-"), type: TextBoxType.ONE_NUMBER, maxLines: 1, width: 45, height: 60),
  BaseEditText(text: "", margin: 1, marginh: 5, focusNode:FocusNode(),isValidationDialog: false,validationType: ValidationType.ONE_NUMBER, controller: TextEditingController(text: "-"), type: TextBoxType.ONE_NUMBER, maxLines: 1, width: 45, height: 60),

  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<otpEditTexts.length-1;i++){
      otpEditTexts[i].nextEditText=otpEditTexts[i+1];
    }
    for(int i=otpEditTexts.length-1;i>0;i--){
      otpEditTexts[i].preEditText=otpEditTexts[i-1];
    }
  }
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.



    return
      Form(
          key: _formKey,

          child: Container(
            width: 350,
            child: ListView(

                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: otpEditTexts,),
                  Container(height: 11,),
                  MainButton(
                    text: "Verify",onPressed: () async {
                    // Validate returns true if the form is valid, otherwise false.
                    String code='';
                    for(int i=0;i<otpEditTexts.length;i++){
                      code=code+otpEditTexts[i].controller.text.toString();
                    }
                    print('$code');
                    if( Validator.validateForm(context,otpEditTexts,[])) {
                      Dio dio=HttpAPI().Inisalize(context);

                      var responce = await dio.post("/forgot",
                          data: { "code": code,});
                      if (HttpAPI().APIValidateResponce(responce)) {
                        EasyLoading.showSuccess('Great Success!');
                        Navigator.pop(context);
                      }else{
                        EasyLoading.showError('wrong email!!');
                      }
                      _formKey.currentState!.validate();
                    }

                  }, isActive: true,),
                  Container(height: 10,),
                  Center(child: FooterText(text: "Didn’t receive the code?\n Resend Code in 00:60", onPressed: (){}, clickable: false)),
                  Container(height: 20,),
                  InkWell(
                    onTap: (){
                  //TODO verify code
                    },
                    child: Container(alignment:Alignment.center,child:Text("RESEND",
                        style:TextStyle( fontSize: 14,  fontWeight: FontWeight.bold,color:Colors.red))),
                  )
                ]
            ),
          )
      );
  }
}