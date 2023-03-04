import 'dart:async';
import 'dart:developer';
import 'package:bsdealz/layouts/items/buttons/MainButton.dart';

import 'package:bsdealz/layouts/items/textboxes/BaseEditText.dart';
import 'package:bsdealz/layouts/items/textboxes/CustomTextbox.dart';
import 'package:bsdealz/layouts/items/textboxes/TextboxEmail.dart';
import 'package:bsdealz/layouts/items/textboxes/TextboxPassword.dart';
import 'package:bsdealz/layouts/items/textboxes/TextboxPhone.dart';
import 'package:bsdealz/layouts/items/tobars/back_bar.dart';
import 'package:bsdealz/layouts/pages/credentials/login.dart';
import 'package:bsdealz/localization/language_constants.dart';
import 'package:bsdealz/network/HttpAPI.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../main.dart';
import '../../../network/models/ApiAddress.dart';
import '../../dialogs/main_dialog.dart';
import '../../forms/Validator.dart';
import 'CheckoutPage.dart';

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
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
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/images/AddAddress.png"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: AddressForm(),
        )));
  }
}

// Define a custom Form widget.
class AddressForm extends StatefulWidget {
  @override
  AddressFormState createState() {
    return AddressFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();

  BaseEditText nameet = BaseEditText(
      text: "Address name",
      margin: 5,
      marginh: 20,
      focusNode: FocusNode(),
      isValidationDialog: true,
      validationType: ValidationType.TEXT,
      controller: TextEditingController(),
      type: TextBoxType.TEXT,
      maxLines: 1,
      width: 305,
      height: 55);
  BaseEditText city = BaseEditText(
      text: "City",
      margin: 5,
      marginh: 20,
      focusNode: FocusNode(),
      isValidationDialog: true,
      validationType: ValidationType.TEXT,
      controller: TextEditingController(),
      type: TextBoxType.TEXT,
      maxLines: 1,
      width: 305,
      height: 55);
  BaseEditText state = BaseEditText(
      text: "State",
      margin: 5,
      marginh: 20,
      focusNode: FocusNode(),
      isValidationDialog: true,
      validationType: ValidationType.TEXT,
      controller: TextEditingController(),
      type: TextBoxType.TEXT,
      maxLines: 1,
      width: 305,
      height: 55);
  BaseEditText street = BaseEditText(
      text: "Street",
      margin: 5,
      marginh: 20,
      focusNode: FocusNode(),
      isValidationDialog: true,
      validationType: ValidationType.TEXT,
      controller: TextEditingController(),
      type: TextBoxType.TEXT,
      maxLines: 2,
      width: 305,
      height: 55);
  BaseEditText building = BaseEditText(
      text: "Building",
      margin: 5,
      marginh: 20,
      focusNode: FocusNode(),
      isValidationDialog: true,
      validationType: ValidationType.TEXT,
      controller: TextEditingController(),
      type: TextBoxType.TEXT,
      maxLines: 1,
      width: 305,
      height: 55);
  BaseEditText apartmentNumber = BaseEditText(
      text: "Apartment Number",
      margin: 5,
      marginh: 20,
      focusNode: FocusNode(),
      isValidationDialog: true,
      validationType: ValidationType.TEXT,
      controller: TextEditingController(),
      type: TextBoxType.TEXT,
      maxLines: 1,
      width: 305,
      height: 55);

  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    ShapeBorder shapeBorder1 = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        side: BorderSide(width: 1, color: Colors.red));
    return Form(
        key: _formKey,
        child: ListView(children: <Widget>[
          BackBar(
              height: 60,
              title: getTranslated(context, 'address'),
              notificationsNumber: 0),
          Container(margin: const EdgeInsets.all(10), child: nameet),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Card(
              shape: shapeBorder1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: SelectState(
                  // style: TextStyle(color: Colors.red),

                  onCountryChanged: (value) {
                    setState(() {
                      countryValue = value;
                    });
                  },
                  onStateChanged: (value) {
                    setState(() {
                      stateValue = value;
                    });
                  },
                  onCityChanged: (value) {
                    setState(() {
                      cityValue = value;
                    });
                  },
                ),
              ),
            ),
          ),
          // Container(
          //     margin: EdgeInsets.all(10),
          //     child: city),
          // Container(
          //     margin: EdgeInsets.all(10),
          //     child: state),
          Container(margin: const EdgeInsets.all(10), child: street),
          Container(margin: const EdgeInsets.all(10), child: building),
          Container(margin: const EdgeInsets.all(10), child: apartmentNumber),
          Container(
            height: 20,
          ),
          MainButton(
            text: getTranslated(context, 'save'),
            onPressed: () async {
              EasyLoading.show();
              if (validateForm([nameet, street, building], [])) {
                addAddress();
              }
              _formKey.currentState!.validate();
            },
            isActive: true,
          ),
        ]));
  }

  void _launchURL(_url) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not open';

  addAddress() async {
    Dio dio = HttpAPI().Inisalize(context);
    if (cityValue == "" || cityValue == null) {
      MainDialog.showMyDialog(
          MainDialog(
              title: getTranslated(context, 'addressfailed'),
              descriptions: getTranslated(context, 'city'),
              text: "",
              type: DialogType.ERROR,
              customWidget: Container()),
          context);
      return 0;
    }
    var responce = await dio.post("address", data: {
      "state": stateValue,
      "country": countryValue,
      "city": cityValue,
      "street": street.controller.text.toString(),
      "building": building.controller.text.toString(),
      "address": nameet.controller.text.toString(),
      "apartment_number": apartmentNumber.controller.text.toString()
    }).then((value) {
      EasyLoading.dismiss();
      if (HttpAPI().APIValidateResponce(value)) {
        Navigator.of(context).pop();
        if (value.data['status'] == 'success') {
          List<ApiAddress> addresses = List<ApiAddress>.from(
              value.data['data'].map((model) => ApiAddress.fromJson(model)));
          setState(() {
            RefreshApp.of(context)!.apiAppVariables.addresses = addresses;
            CheckoutPage.selectedAddress = addresses.first;
            CheckoutPage.selectedId = addresses.first.id;
          });
          MyApp.refreshApp(context);
        }
      } else {
        MainDialog.showMyDialog(
            MainDialog(
                title: getTranslated(context, 'addressfailed'),
                descriptions: getTranslated(context, 'addressfailed'),
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
              title: getTranslated(context, 'addressfailed'),
              descriptions: error.toString(),
              text: "",
              type: DialogType.ERROR,
              customWidget: Container()),
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
                text: getTranslated(context, 'Dis'),
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
              text: getTranslated(context, 'Dis'),
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
