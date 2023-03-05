import 'package:bsdealz/layouts/forms/Validator.dart';
import 'package:bsdealz/layouts/items/buttons/MainButton.dart';
import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/layouts/items/textboxes/BaseEditText.dart';
import 'package:bsdealz/layouts/items/textboxes/TextboxPassword.dart';
import 'package:bsdealz/layouts/items/texts/FooterText.dart';
import 'package:bsdealz/layouts/items/tobars/back_bar.dart';
import 'package:bsdealz/localization/language_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:bsdealz/network/HttpAPI.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  void initState() {
    super.initState();
  }

  static final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Container(
        width: 350,
        height: double.infinity,
        color: Colors.white, //Theme.of(context).primaryColor,
        child: ListView(
          children: [
            BackBar(
              height: 50,
              notificationsNumber: 0,
              title: "",
            ),
            SizedBox(
              height: 110,
            ),
            Center(child: AppIcon(icon: AppIcon.LOGO_PATH, size: 150)),
            Container(
              height: 400,
              width: 350,
              margin: EdgeInsets.all(5),
              child: //Container()
                  ResetPasswordForm1(),
            ),
          ],
        ),
      ),
    )));
  }
}

// Define a custom Form widget.
class ResetPasswordForm1 extends StatefulWidget {
  @override
  ResetPasswordForm1State createState() {
    return ResetPasswordForm1State();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class ResetPasswordForm1State extends State<ResetPasswordForm1> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyResetPasswordForm1State>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    TextboxPassword passwordEt = TextboxPassword(
        text: getTranslated(context, "New password"),
        margin: 20,
        marginh: 20,
        controller: TextEditingController(),
        validator: '',
        focusNode: FocusNode());
    TextboxPassword resetpasswsordEt = TextboxPassword(
        text: getTranslated(context, "Confirmnewpassword"),
        margin: 20,
        marginh: 20,
        controller: TextEditingController(),
        validator: '',
        focusNode: FocusNode());

    return Form(
        key: _formKey,
        child: Container(
          width: 350,
          child: ListView(children: <Widget>[
            passwordEt,
            resetpasswsordEt,
            Container(
              height: 40,
            ),
            MainButton(
              text: "Confirm",
              onPressed: () async {
                // Validate returns true if the form is valid, otherwise false.
                if (Validator.validateForm(context, [], [
                  passwordEt,
                  resetpasswsordEt,
                ])) {
                  Dio dio = HttpAPI().Inisalize(context);
                  var responce = await dio.post("/resetpassword", data: {
                    "password": passwordEt.controller.text.toString(),
                  });

                  if (HttpAPI().APIValidateResponce(responce)) {
                    //emailt.validator=null;
                    EasyLoading.showSuccess('passwrd changed Successfully!');
                    Navigator.pop(context);
                    //print("-----------"+responce.statusMessage+"------tokn:"+token);
                  } else {
                    EasyLoading.showError('wrong password!!');
                  }
                  _formKey.currentState!.validate();
                }
              },
              isActive: true,
            ),
          ]),
        ));
  }
}
