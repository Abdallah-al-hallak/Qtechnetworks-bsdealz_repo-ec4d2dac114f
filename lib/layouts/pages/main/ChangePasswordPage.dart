import 'dart:async';
import 'dart:developer';
import 'package:bsdealz/layouts/items/buttons/MainButton.dart';

import 'package:bsdealz/layouts/items/textboxes/BaseEditText.dart';
import 'package:bsdealz/layouts/items/textboxes/CustomTextbox.dart';
import 'package:bsdealz/layouts/items/textboxes/TextboxEmail.dart';
import 'package:bsdealz/layouts/items/textboxes/TextboxPassword.dart';
import 'package:bsdealz/layouts/items/textboxes/TextboxPhone.dart';
import 'package:bsdealz/layouts/items/texts/FooterText.dart';
import 'package:bsdealz/layouts/items/texts/SubTitleText.dart';
import 'package:bsdealz/layouts/pages/credentials/login.dart';
import 'package:bsdealz/network/HttpAPI.dart';
import 'package:bsdealz/network/models/APIUser.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../localization/language_constants.dart';
import '../../../main.dart';
import '../../../network/models/ApiAddress.dart';
import '../../dialogs/main_dialog.dart';
import '../../forms/Validator.dart';
import '../../items/tobars/back_bar.dart';
import 'CheckoutPage.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
          child: Column(
            children: [
              BackBar(
                height: 60,
                notificationsNumber: 0,
                title: "Personal Details",
              ),
              Expanded(child: ChangePasswordForm()),
            ],
          ),
        )));
  }
}

// Define a custom Form widget.
class ChangePasswordForm extends StatefulWidget {
  @override
  ChangePasswordFormState createState() {
    return ChangePasswordFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();

  late TextboxPassword currentp;
  late TextboxPassword newp;
  late TextboxPassword newpc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    currentp = TextboxPassword(
        text: "Current Password",
        margin: 20,
        marginh: 20,
        controller: TextEditingController(),
        validator: '',
        focusNode: FocusNode());

    newp = TextboxPassword(
        text: "New Password",
        margin: 20,
        marginh: 20,
        controller: TextEditingController(),
        validator: '',
        focusNode: FocusNode());

    newpc = TextboxPassword(
        text: "New Password confirmation",
        margin: 20,
        marginh: 20,
        controller: TextEditingController(),
        validator: '',
        focusNode: FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Form(
        key: _formKey,
        child: ListView(children: <Widget>[
          Container(margin: EdgeInsets.all(0), child: currentp),
          Container(margin: EdgeInsets.all(0), child: newp),
          Container(margin: EdgeInsets.all(0), child: newpc),
          MainButton(
            text: getTranslated(context, 'Save'),
            onPressed: () async {
              if (Validator.validateForm(
                  context, [], [currentp, newp, newpc])) {
                updatePassword();
              }
              _formKey.currentState!.validate();
            },
            isActive: true,
          ),
        ]));
  }

  void _launchURL(_url) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not Open';

  updatePassword() async {
    EasyLoading.show();
    Dio dio = HttpAPI().Inisalize(context);
    var responce = await dio.post("changepassword", data: {
      "old_password": currentp.controller.text.toString(),
      "password": newp.controller.text.toString(),
      "password_confirmation": newpc.controller.text.toString()
    }).then((value) {
      EasyLoading.dismiss();
      if (HttpAPI().APIValidateResponce(value)) {
        Navigator.of(context).pop();
        if (value.data['status'] == 'success') {
          ApiUser user = ApiUser.fromJson(value.data['data']);
          setState(() {
            RefreshApp.of(context)!.apiAppVariables.user = user;
          });
          //MyApp.refreshApp(context);
        }
      } else {
        MainDialog.showMyDialog(
            MainDialog(
                title: "Change password failed",
                descriptions: value.data['message'],
                text: "",
                type: DialogType.ERROR,
                customWidget: Container()),
            context);
        //  EasyLoading.showError('Too many attempts.\n retry after few hours');
      }
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      log(error.toString());
      MainDialog.showMyDialog(
          MainDialog(
              title: "Change password failed",
              descriptions: error.toString(),
              text: "",
              type: DialogType.ERROR,
              customWidget: Container()),
          context);
    });
  }
}
