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
import 'package:intl/intl.dart';
import '../../../main.dart';
import '../../../network/models/ApiAddress.dart';
import '../../dialogs/main_dialog.dart';
import '../../forms/Validator.dart';
import '../../items/tobars/back_bar.dart';
import 'CheckoutPage.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PersonalDetailsPage extends StatefulWidget{
  @override
  _PersonalDetailsPageState createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
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
                    BackBar(height: 60,notificationsNumber: 0,title: "Personal Details",),
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


  late BaseEditText fname;
  late BaseEditText lname;
 // late BaseEditText dob;
  late FooterText dob;
  late BaseEditText city;
  late BaseEditText state;
  late BaseEditText street;
  late BaseEditText building;
  DateTime? pickedDate;
  @override
   initState()  {
    // TODO: implement initState
    super.initState();

    String d="Choose Date of Birth";
    if(RefreshApp.of(context)!.apiAppVariables.user!.dob!=null){
      d=RefreshApp.of(context)!.apiAppVariables.user!.dob.toString();
    }
     fname=BaseEditText(text: "first name", margin: 5, marginh: 20, focusNode:FocusNode(),isValidationDialog: true,validationType: ValidationType.TEXT, controller: TextEditingController(text: RefreshApp.of(context)!.apiAppVariables.user!.firstName), type: TextBoxType.TEXT, maxLines: 1, width: 305, height: 55);
     lname=BaseEditText(text: "last name", margin: 5, marginh: 20, focusNode:FocusNode(),isValidationDialog: true,validationType: ValidationType.TEXT, controller: TextEditingController(text: RefreshApp.of(context)!.apiAppVariables.user!.lastName), type: TextBoxType.TEXT, maxLines: 1, width: 305, height: 55);
    // dob=BaseEditText(text: "Date of Birth", margin: 5, marginh: 20, focusNode:FocusNode(),isValidationDialog: true,validationType: ValidationType.TEXT, controller: TextEditingController(text: RefreshApp.of(context)!.apiAppVariables.user!.dob), type: TextBoxType.DATETIME, maxLines: 1, width: 305, height: 55);
     dob=FooterText(text: d, onPressed: (){},clickable: false,);
     city=BaseEditText(text: "city", margin: 5, marginh: 20, focusNode:FocusNode(),isValidationDialog: true,validationType: ValidationType.TEXT, controller: TextEditingController(text: RefreshApp.of(context)!.apiAppVariables.user!.city), type: TextBoxType.TEXT, maxLines: 1, width: 305, height: 55);
     state=BaseEditText(text: "state", margin: 5, marginh: 20, focusNode:FocusNode(),isValidationDialog: true,validationType: ValidationType.TEXT, controller: TextEditingController(text: RefreshApp.of(context)!.apiAppVariables.user!.state), type: TextBoxType.TEXT, maxLines: 1, width: 305, height: 55);
     street=BaseEditText(text: "street", margin: 5, marginh: 20, focusNode:FocusNode(),isValidationDialog: true,validationType: ValidationType.TEXT, controller: TextEditingController(text: RefreshApp.of(context)!.apiAppVariables.user!.street), type: TextBoxType.TEXT, maxLines: 2, width: 305, height: 55);
     building=BaseEditText(text: "building", margin: 5, marginh: 20, focusNode:FocusNode(),isValidationDialog: true,validationType: ValidationType.TEXT, controller: TextEditingController(text: RefreshApp.of(context)!.apiAppVariables.user!.building), type: TextBoxType.TEXT, maxLines: 1, width: 305, height: 55);

  }


  @override
  Widget build(BuildContext context) {

    // Build a Form widget using the _formKey created above.
    ShapeBorder shapeBorder1=RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        side: BorderSide(width: 1, color: Colors.red));
    return
      Form(
          key: _formKey,

          child: ListView(

              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  alignment:Alignment.topLeft,
                  child: FooterText(text: "First Name",onPressed: (){},clickable: false,),
                ),
                Container(
                    margin: EdgeInsets.all(0),
                    child: fname),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  alignment:Alignment.topLeft,
                  child: FooterText(text: "Last Name",onPressed: (){},clickable: false,),
                ),
                Container(
                    margin: EdgeInsets.all(0),
                    child: lname),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  alignment:Alignment.topLeft,
                  child: FooterText(text: "Date of birth",onPressed: (){},clickable: false,),
                ),
                Container(
                    margin: EdgeInsets.all(0),
                    child: InkWell(
                        onTap: () async {

                           pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime(2006), //get today's date
                              firstDate: DateTime(1900), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2006)
                          ).then((value) {

                              print(value);  //get the picked date in the format => 2022-07-04 00:00:00.000
                              String formattedDate = DateFormat('yyyy-MM-dd').format(value!); // format date in required form here we use yyyy-MM-dd that means time is removed
                              print(formattedDate); //formatted date output using intl package =>  2022-07-04
                              //You can format date as per your need

                              setState(() {
                                dob =FooterText(text: formattedDate, onPressed: (){},clickable: false,);
                                   //set foratted date to TextField value.
                              });

                          });


                        },
                        child:   Container(
                          padding:  EdgeInsets.only(left:15,right: 15,top: 10,bottom: 15),
                          child: Card(
                              shape: shapeBorder1,child: Container(
                              margin: EdgeInsets.only(left:15,right: 15,top: 10,bottom: 15),

                              child: dob)),
                        ))),
                // Container(
                //   margin: EdgeInsets.all(10),
                //   alignment:Alignment.topLeft,
                //   child: SubTitleText(text: "Address",onPressed: (){},clickable: false,),
                // ),
                // Container(
                //   margin: EdgeInsets.only(left: 20,right: 20),
                //   alignment:Alignment.topLeft,
                //   child: FooterText(text: "City",onPressed: (){},clickable: false,),
                // ),
                // Container(
                //     margin: EdgeInsets.all(0),
                //     child: city),
                // Container(
                //   margin: EdgeInsets.only(left: 20,right: 20),
                //   alignment:Alignment.topLeft,
                //   child: FooterText(text: "state",onPressed: (){},clickable: false,),
                // ),
                // Container(
                //     margin: EdgeInsets.all(0),
                //     child: state),
                // Container(
                //   margin: EdgeInsets.only(left: 20,right: 20),
                //   alignment:Alignment.topLeft,
                //   child: FooterText(text: "street",onPressed: (){},clickable: false,),
                // ),
                // Container(
                //     margin: EdgeInsets.all(0),
                //     child: street),
                // Container(
                //   margin: EdgeInsets.only(left: 20,right: 20),
                //   alignment:Alignment.topLeft,
                //   child: FooterText(text: "building",onPressed: (){},clickable: false,),
                // ),
                // Container(
                //     margin: EdgeInsets.all(0),
                //     child: building),
                MainButton(
                  text: "SAVE",onPressed: () async {




                  if( Validator.validateForm(context,[fname,lname,city,state,street,building],[])) {
                    updateProfile();
                  }
                  _formKey.currentState!.validate();


                }, isActive: true,),

              ]
          )
      );
  }
  void _launchURL(_url) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not Open';

  updateProfile() async {
    EasyLoading.show();
    Dio dio=HttpAPI().Inisalize(context);
    var responce = await dio.post("profile",
        data: {"state":state.controller.text.toString(),
          "city":city.controller.text.toString(),
          "street":street.controller.text.toString(),
          "building":building.controller.text.toString(),
          "first_name":fname.controller.text.toString(),
          "last_name":lname.controller.text.toString(),
          "gender":"male",
          "dob":dob.text.toString()

        }).then((value){
      EasyLoading.dismiss();
      if (HttpAPI().APIValidateResponce(value)) {
        Navigator.of(context).pop();
        if(value.data['status']=='success'){
          ApiUser user= ApiUser.fromJson(value.data['data']);
          setState(() {
            RefreshApp.of(context)!.apiAppVariables.user=user;
          });
          MyApp.refreshApp(context);
        }
      }else{

        MainDialog.showMyDialog(MainDialog(title: "edit profile failed", descriptions: "edit profile Error", text: "", type: DialogType.ERROR, customWidget: Container())
            , context);
        //  EasyLoading.showError('Too many attempts.\n retry after few hours');
      }
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      log(error.toString());
      MainDialog.showMyDialog(MainDialog(title: "edit profile failed", descriptions: error.toString(), text: "", type: DialogType.ERROR, customWidget: Container())
          , context);
    });
  }


}
