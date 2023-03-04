import 'dart:async';

import 'package:bsdealz/layouts/items/buttons/CustomButton.dart';
import 'package:bsdealz/localization/language_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({
    Key? key,
  }) : super(key: key);

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  _SuccessPageState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        body: SafeArea(
            child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: ListView(
        children: [
          // CheckoutBar(height: 35),
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 120,
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Container(
                  color: CupertinoColors.white,
                  child: Container(
                      margin: const EdgeInsets.all(15),
                      child: const Icon(
                        CupertinoIcons.checkmark_alt,
                        size: 90,
                        color: Colors.red,
                      ))),
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              getTranslated(context, 'orderP'),
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            width: 100,
            margin: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.center,
            child: Text(
              getTranslated(context, 'orderPS'),
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.normal,
                  height: 1.5),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                iconColor: Colors.white,
                color: Colors.redAccent,
                height: 50,
                width: 140,
                icon: Icons.keyboard_arrow_right,
                textColor: Colors.white,
                isCircleIcon: true,
                padding: 0,
                iconpadding: 0,
                margin: 15,
                radius: 30,
                fontSize: 14,
                ovalpadding: 0,
                text: getTranslated(context, 'Myorder'),
                onPressed: () {
                  // Validate returns true if the form is valid, otherwise false.

                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  // Navigator.popUntil(context, ModalRoute.withName('/login'));
                  Navigator.pop(context);
                  // Navigator.popUntil(context,ModalRoute.withName('/main_categories'));
                },
                hasIcon: false,
              ),
            ],
          ),
        ],
      ),
    )));
  }
}

// Define a custom Form widget.
class SuccessPageForm1 extends StatefulWidget {
  @override
  SuccessPageForm1State createState() {
    return SuccessPageForm1State();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class SuccessPageForm1State extends State<SuccessPageForm1> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MySuccessPageForm1State>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(key: _formKey, child: ListView(children: <Widget>[]));
  }
}
