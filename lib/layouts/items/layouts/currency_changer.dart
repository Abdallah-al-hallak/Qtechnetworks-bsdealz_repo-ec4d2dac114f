import 'package:bsdealz/layouts/items/texts/FooterText.dart';
import 'package:bsdealz/layouts/items/texts/SubTitleText.dart';
import 'package:bsdealz/layouts/pages/main/splash.dart';
import 'package:bsdealz/localization/Language.dart';
import 'package:bsdealz/localization/language_constants.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../utils/sharedprefs.dart';

class CurrencyChanger extends StatefulWidget {
  final double height;
  CurrencyChanger({Key? key, required this.height}) : super(key: key);

  @override
  _CurrencyChangerState createState() => _CurrencyChangerState();
}

class _CurrencyChangerState extends State<CurrencyChanger> {
  void _changeCurrency(Currency currency) async {
    // Locale _locale = await setLocale(language!.languageCode);
    MyApp.setCurrency(context, currency);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: () {
        showCurrencyPicker(
          context: context,
          showSearchField: true,
          showCurrencyName: true,
          showCurrencyCode: true,
          onSelect: (Currency currency) {
            RefreshApp.of(context)!.currency = currency;
            RefreshApp.of(context)!.apiHeaders.acceptCurrency = currency.code;
            CustomSharedPrefs()
                .setVJson(
                    "APIHeaders", RefreshApp.of(context)!.apiHeaders.toJson())
                .then((value) {
              CustomSharedPrefs().setV("currency", currency.code).then((value) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Splash()));
              });
            });
            print('Select currency: ${currency.name}');
          },
          theme: CurrencyPickerThemeData(
            flagSize: 25,
            titleTextStyle: const TextStyle(fontSize: 17),
            subtitleTextStyle:
                TextStyle(fontSize: 15, color: Theme.of(context).hintColor),
            bottomSheetHeight: MediaQuery.of(context).size.height / 2,
          ),
          currencyFilter: <String>[
            'IQD',
            'AED',
            'USD',
          ],
        );
      },
      child: Container(
        height: widget.height,
        alignment: Alignment.center,
        child: Row(
          children: [
            SubTitleText(
              text: RefreshApp.of(context)!.currency.code.toString() == null
                  ? "Select Currency"
                  : RefreshApp.of(context)!.currency.code.toString(),
              onPressed: () {},
              clickable: false,
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}
