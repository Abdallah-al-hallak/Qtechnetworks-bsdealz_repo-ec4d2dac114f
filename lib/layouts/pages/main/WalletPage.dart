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

import '../../../main.dart';
import '../../../network/models/ApiAddress.dart';
import '../../dialogs/main_dialog.dart';
import '../../forms/Validator.dart';
import '../../items/texts/BaseText.dart';
import '../../items/tobars/back_bar.dart';
import 'CheckoutPage.dart';



class WalletPage extends StatefulWidget{
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return

      Scaffold(
          resizeToAvoidBottomInset: false,
          body:SafeArea(
              child:Container(

                child: Column(

                  children: [
                    BackBar(height: 60,notificationsNumber: 0,title: "My Wallet",),
                    Expanded(child: PerasonalDetailsForm()),
                  ],
                ),
              )
          )
      );

  }


}
// Define a custom Form widget.
class PerasonalDetailsForm extends StatefulWidget {
  @override
  PerasonalDetailsFormState createState() {
    return PerasonalDetailsFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class PerasonalDetailsFormState extends State<PerasonalDetailsForm> {

  final _formKey = GlobalKey<FormState>();

  ShapeBorder shapeBorder1=RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      side: BorderSide(width: 1, color: Colors.grey));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  
  }
  @override
  Widget build(BuildContext context) {

    // Build a Form widget using the _formKey created above.

    return
      Form(
          key: _formKey,

          child: ListView(

              children: <Widget>[

                Container(

                  margin: EdgeInsets.only(top: 10,bottom: 200,left: 20,right: 20),
                  child: Card(
                    elevation: 0,
                    color: Colors.transparent,
                    shape: shapeBorder1,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: BaseText(
                              color: Colors.grey,
                              text:"Available Credit",
                              margin: 5,
                              marginh: 25,
                              fontSize: 12,
                              onPressed: (){},
                              fontWeight: FontWeight.normal, clickable: false,
                            ),
                          ),
                          BaseText(
                            color: Theme.of(context).primaryColor,
                            text:"${RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.pointsCurrencyAmount.toString()}",
                            margin: 5,
                            marginh: 25,
                            fontSize: 18,
                            onPressed: (){},
                            fontWeight: FontWeight.bold, clickable: false,
                          ),
                        
                
                        ],
                      ),
                    ),

                  ),
                ),
                
                MainButton(
                  text: "Recharge",onPressed: () async {
                    

                }, isActive: true,),

              ]
          )
      );
  }

}
