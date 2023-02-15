import 'package:bsdealz/localization/Language.dart';
import 'package:bsdealz/localization/language_constants.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';


class PageLang extends StatefulWidget {
  PageLang({Key? key}) : super(key: key);

  @override
  _PageLangState createState() => _PageLangState();
}

class _PageLangState extends State<PageLang> {
  void _changeLanguage(Language? language) async {
    Locale _locale = await setLocale(language!.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
        child: Center(
            child: DropdownButton<Language>(
              iconSize: 30,
              hint: Text(getTranslated(context, 'change_language')),
              onChanged: (Language? language) {
                _changeLanguage(language);
                Navigator.of(context).pop();
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      // Text(
                      //   e.flag,
                      //   style: TextStyle(fontSize: 30),
                      // ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
                  .toList(),
            )),
      );

  }
}