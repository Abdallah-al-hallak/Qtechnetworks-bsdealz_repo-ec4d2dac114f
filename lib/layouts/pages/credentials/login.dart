import 'dart:async';
import 'dart:developer';
import 'package:bsdealz/layouts/dialogs/main_dialog.dart';
import 'package:bsdealz/layouts/forms/Validator.dart';

import 'package:bsdealz/layouts/items/buttons/MainButton.dart';
import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/layouts/items/textboxes/BaseEditText.dart';
import 'package:bsdealz/layouts/items/texts/FooterText.dart';
import 'package:bsdealz/layouts/pages/main/home_page.dart';
import 'package:bsdealz/layouts/pages/main/splash.dart';
import 'package:bsdealz/network/models/APIHeaders.dart';
import 'package:bsdealz/network/models/APIUser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:bsdealz/layouts/items/textboxes/TextboxPassword.dart';
import 'package:bsdealz/layouts/items/textboxes/TextboxPhone.dart';
import 'package:bsdealz/layouts/pages/credentials/signup.dart';
import 'package:bsdealz/localization/language_constants.dart';
import 'package:bsdealz/network/HttpAPI.dart';

import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:bsdealz/utils/sharedprefs.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import '../../../utils/shared_func.dart';
import 'forgot_password.dart';

class Login extends StatefulWidget {
  final String destination;
  const Login({Key? key, required this.destination}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  static final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: Container(
            width: 350,
            height: double.infinity,
            //color: Colors.white,//Theme.of(context).primaryColor,
            child: ListView(
              children: [
                SizedBox(
                  height: 110,
                ),
                Center(child: AppIcon(icon: AppIcon.LOGO_PATH, size: 150)),
                // Align(
                //   alignment: Alignment.topCenter,
                //   child: Container(margin:EdgeInsets.all(10),child:Image.asset("assets/images/logo.png",width:MediaQuery.of(context).size.width*0.35,),),
                // ),

                Container(
                  height: 400,
                  width: 350,
                  margin: EdgeInsets.all(5),
                  child: //Container()
                      LoginForm1(
                    destination: widget.destination,
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}

// Define a custom Form widget.
class LoginForm1 extends StatefulWidget {
  final String destination;
  const LoginForm1({Key? key, required this.destination}) : super(key: key);
  @override
  LoginForm1State createState() {
    return LoginForm1State();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class LoginForm1State extends State<LoginForm1> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyLoginForm1State>.
  final _formKey = GlobalKey<FormState>();
  // TextboxPhone phone=TextboxPhone(text:"phone",margin: 5,marginh: 20,controller: TextEditingController(), validator: '', countryCode: '+962',);
  BaseEditText emailEditText = BaseEditText(
      text: "Email",
      margin: 20,
      marginh: 20,
      focusNode: FocusNode(),
      isValidationDialog: true,
      validationType: ValidationType.EMAIL,
      controller: TextEditingController(),
      type: TextBoxType.EMAIL,
      maxLines: 1,
      width: 305,
      height: 55);
  //Text(text:"Email",margin: 5,marginh: 20,controller: TextEditingController(), validator: '', countryCode: '+962', type: TextBoxType.EMAIL,);
  TextboxPassword pass = TextboxPassword(
      text: "pasword",
      margin: 20,
      marginh: 20,
      controller: TextEditingController(),
      validator: '',
      focusNode: FocusNode());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailEditText = BaseEditText(
        text: "${AppSettingTheme.getTheme(
          context,
          Config.EMAIL_KEY,
          Config.EMAIL_VALUE,
        )}",
        margin: 20,
        marginh: 20,
        focusNode: FocusNode(),
        isValidationDialog: true,
        validationType: ValidationType.EMAIL,
        controller: TextEditingController(),
        type: TextBoxType.EMAIL,
        maxLines: 1,
        width: 305,
        height: 55);
    //Text(text:"Email",margin: 5,marginh: 20,controller: TextEditingController(), validator: '', countryCode: '+962', type: TextBoxType.EMAIL,);
    pass = TextboxPassword(
        text: "${AppSettingTheme.getTheme(
          context,
          Config.PASSWORD_KEY,
          Config.PASSWORD_VALUE,
        )}",
        margin: 10,
        marginh: 20,
        controller: TextEditingController(),
        validator: '',
        focusNode: FocusNode());
  }

  String? token = null;
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    pass.text = "${AppSettingTheme.getTheme(
      context,
      Config.PASSWORD_KEY,
      Config.PASSWORD_VALUE,
    )}";
    // phone.text=getTranslated(context, "phone");

    return Form(
        key: _formKey,
        child: Container(
          width: 350,
          child: ListView(children: <Widget>[
            emailEditText,
            pass,
            Container(
                padding: EdgeInsets.only(right: 10, bottom: 20),
                margin: EdgeInsets.all(2),
                alignment: Alignment.centerRight,
                child: FooterText(
                  text: "${AppSettingTheme.getTheme(
                    context,
                    Config.FORGOT_PASSWORD_KEY,
                    Config.FORGOT_PASSWORD_VALUE,
                  )}",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                  },
                  clickable: true,
                )),
            MainButton(
              text: "${AppSettingTheme.getTheme(
                context,
                Config.LOGIN_KEY,
                Config.LOGIN_KEY,
              )}",
              onPressed: () async {
                setState(() {});

                // Validate returns true if the form is valid, otherwise false.
                //  if (_formKey.currentState!.validate()) {
                //   if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                //  loginRequest();

                //TODO Uncomment this
                if (validateForm([emailEditText], [pass])) {
                  loginRequest();
                }

                //   }
              },
              isActive: true,
            ),
            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
            MainButton(
              text: "CONTINUE AS GUEST",
              onPressed: () {
                // Validate returns true if the form is valid, otherwise false.

                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ApiUser? user = RefreshApp.of(context)!.currentUser;

                if (widget.destination == "1") {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
                if (widget.destination == "2") {
                  Navigator.pop(context);
                } else {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
              isActive: true,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      alignment: Alignment.center,
                      child: Text(
                          "${AppSettingTheme.getTheme(
                            context,
                            Config.DONT_HAVE_ACCOUNT_KEY,
                            Config.DONT_HAVE_ACCOUNT_VALUE,
                          )}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]))),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                            "${AppSettingTheme.getTheme(
                              context,
                              Config.CREATE_ONE_KEY,
                              Config.CREATE_ONE_VALUE,
                            )}",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.red))),
                  )
                ],
              ),
            )
          ]),
        ));
  }

  void loginRequest() {
    Dio dio = HttpAPI().Inisalize(context);
    EasyLoading.show();

    var response = dio.post("/login", data: {
      "email": emailEditText.controller.text.toString(),
      "password": pass.controller.text.toString(),
    }).then((value) async {
      setState(() {
        if ((value.statusCode!) < 300) {
          token = value.data["data"]["token"];
          SharedFunc().setToken(token, 'token');
          log("token=${token}");
          ApiUser user = ApiUser.fromJson(value.data["data"]["user"]);
          // print("---user login ---"+jsonEncode(user.toJson()));
          RefreshApp.of(context)!.apiHeaders.token = token;

          CustomSharedPrefs().setVJson(
              "APIHeaders", RefreshApp.of(context)!.apiHeaders.toJson());
          CustomSharedPrefs().setV("token", token!);
          CustomSharedPrefs().setVJson("user", user.toJson());
          RefreshApp.of(context)!.currentUser = user;

          if (widget.destination == "1") {
            RefreshApp.of(context)!
                .fetchServerData("app-customer", context)!
                .then((value2) {
              EasyLoading.dismiss();

              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            });
          }
          if (widget.destination == "2") {
            EasyLoading.dismiss();
            Navigator.pop(context);
          }
        } else {
          EasyLoading.dismiss();
          MainDialog.showMyDialog(
              MainDialog(
                title: "${AppSettingTheme.getTheme(
                  context,
                  Config.FAILED_KEY,
                  Config.FAILED_VALUE,
                )}",
                text: "${value.data['message'].toString()}",
                descriptions: "${value.data['message'].toString()}",
                type: DialogType.INFO,
                customWidget: Container(),
              ),
              context);
        }
        _formKey.currentState!.validate();
      });
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      print(error.toString() + stackTrace.toString());
      MainDialog.showMyDialog(
          MainDialog(
            title: "Failed",
            text: "Dismiss",
            descriptions: "Request Error!",
            type: DialogType.ERROR,
            customWidget: Container(),
          ),
          context);
    });
  }

  bool validateForm(
      List<BaseEditText> editTexts, List<TextboxPassword> editPasswords) {
    for (int i = 0; i < editTexts.length; i++) {
      BaseEditText currentEdittext = editTexts.elementAt(i);
      String v = Validator.validate(currentEdittext.controller.text.toString(),
          currentEdittext.validationType);
      if (v.isNotEmpty) {
        if (currentEdittext.isValidationDialog) {
          MainDialog.showMyDialog(
              MainDialog(
                title: currentEdittext.text.toString(),
                text: "${AppSettingTheme.getTheme(
                  context,
                  Config.DISMISS_KEY,
                  Config.DISMISS_VALUE,
                )}",
                descriptions: v,
                type: DialogType.ERROR,
                customWidget: Container(),
              ),
              context);
        } else {
          Fluttertoast.showToast(
              msg: "${currentEdittext.text} $v",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        currentEdittext.focusNode?.requestFocus();

        return false;
      }
    }
    for (int i = 0; i < editPasswords.length; i++) {
      TextboxPassword currentEdittext = editPasswords.elementAt(i);
      String v = Validator.validate(
          currentEdittext.controller.text.toString(), ValidationType.PASSWORD);
      if (v.isNotEmpty) {
        MainDialog.showMyDialog(
            MainDialog(
              title: currentEdittext.text.toString(),
              text: "${AppSettingTheme.getTheme(
                context,
                Config.DISMISS_KEY,
                Config.DISMISS_VALUE,
              )}",
              descriptions: v,
              type: DialogType.ERROR,
              customWidget: Container(),
            ),
            context);
        currentEdittext.focusNode?.requestFocus();
        return false;
      }
    }
    return true;
  }
}
