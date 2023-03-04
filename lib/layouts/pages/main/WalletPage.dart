import 'package:bsdealz/layouts/items/buttons/MainButton.dart';
import 'package:bsdealz/localization/language_constants.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:flutter/material.dart';

import '../../items/texts/BaseText.dart';
import '../../items/tobars/back_bar.dart';

class WalletPage extends StatefulWidget {
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
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
          child: Column(
            children: [
              BackBar(
                height: 60,
                notificationsNumber: 0,
                title: getTranslated(context, 'personalD'),
              ),
              Expanded(child: PerasonalDetailsForm()),
            ],
          ),
        )));
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

  ShapeBorder shapeBorder1 = const RoundedRectangleBorder(
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

    return Form(
        key: _formKey,
        child: ListView(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
                top: 10, bottom: 200, left: 20, right: 20),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              shape: shapeBorder1,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: BaseText(
                        color: Colors.grey,
                        text: getTranslated(context, 'availableCredit'),
                        margin: 5,
                        marginh: 25,
                        fontSize: 12,
                        onPressed: () {},
                        fontWeight: FontWeight.normal,
                        clickable: false,
                      ),
                    ),
                    BaseText(
                      color: Theme.of(context).primaryColor,
                      text:
                          "${RefreshApp.of(context)!.apiAppVariables.userCurrentLevel!.pointsCurrencyAmount.toString()}",
                      margin: 5,
                      marginh: 25,
                      fontSize: 18,
                      onPressed: () {},
                      fontWeight: FontWeight.bold,
                      clickable: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
          MainButton(
            text: getTranslated(context, 'Recharge'),
            onPressed: () async {},
            isActive: true,
          ),
        ]));
  }
}
