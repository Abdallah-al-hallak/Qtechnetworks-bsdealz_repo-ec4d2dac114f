import 'dart:ui';

import 'package:bsdealz/layouts/pages/main/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bsdealz/layouts/items/buttons/dialog_btn.dart';

import 'package:bsdealz/localization/language_constants.dart';
import 'package:bsdealz/utils/sharedprefs.dart';

import '../../main.dart';

class DialogLanguage extends StatefulWidget {
  const DialogLanguage({
    Key? key,
  }) : super(key: key);

  @override
  _DialogLanguageState createState() => _DialogLanguageState();
}

class _DialogLanguageState extends State<DialogLanguage> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  void _changeLanguage(String? language) async {
    Locale _locale = await setLocale(language!);
    MyApp.setLocale(context, _locale);
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding:
              const EdgeInsets.only(left: 10, top: 70, right: 10, bottom: 10),
          margin: const EdgeInsets.only(top: 70),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 4), blurRadius: 5),
              ]),
          child: SizedBox(
            height: 200,
            child: ListView(
              children: [
                Container(
                    alignment: Alignment.center,
                    height: 100,
                    child: const Text(
                      "Language",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
                    )),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: DialogBtn(
                          shadowColor: Colors.black,
                          iconColor: Theme.of(context).primaryColor,
                          color: Theme.of(context).primaryColor,
                          height: 50,
                          textColor: Colors.white,
                          isCircleIcon: true,
                          padding: 0,
                          iconpadding: 0,
                          margin: 15,
                          radius: 30,
                          fontSize: 14,
                          ovalpadding: 4,
                          text: "العربية",
                          onPressed: () {
                            // Validate returns true if the form is valid, otherwise false.

                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            _changeLanguage('ar');
                            CustomSharedPrefs()
                                .setV("language", 'ar')
                                .then((value) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Splash()));
                            });
                          },
                          icon: Icons.info_outline,
                          width: 150,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: DialogBtn(
                          shadowColor: Colors.black,
                          iconColor: Theme.of(context).primaryColor,
                          color: Theme.of(context).primaryColor,
                          height: 50,
                          textColor: Colors.white,
                          isCircleIcon: true,
                          padding: 0,
                          iconpadding: 0,
                          margin: 15,
                          radius: 30,
                          fontSize: 14,
                          ovalpadding: 0,
                          text: "English",
                          onPressed: () {
                            _changeLanguage('en');
                            CustomSharedPrefs()
                                .setV("language", 'en')
                                .then((value) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Splash()));
                            });
                          },
                          icon: Icons.info_outline,
                          width: 150,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          top: 10,
          child: Container(
            width: 100,
            height: 100,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 20,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.asset("assets/images/info.png")),
            ),
          ),
        ),
      ],
    );
  }
}
