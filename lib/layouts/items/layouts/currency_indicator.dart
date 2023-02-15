import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/layouts/items/texts/BaseText.dart';
import 'package:bsdealz/layouts/pages/main/splash.dart';
import 'package:bsdealz/localization/Currency.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:bsdealz/utils/sharedprefs.dart';
import 'package:flutter/material.dart';



class CurrencyIndicator extends StatefulWidget implements PreferredSizeWidget {
  final double height;


  const CurrencyIndicator({Key? key, required this.height})
      : super(key: key);

  @override
  _CurrencyIndicatorState createState() => _CurrencyIndicatorState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _CurrencyIndicatorState extends State<CurrencyIndicator> {


  _CurrencyIndicatorState();

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ShortcutsItem(
        height: widget.height
    );
  }
}

// Define a custom Form widget.
class ShortcutsItem extends StatefulWidget {
  final double height;


  const ShortcutsItem({Key ?key, required this.height})
      : super(key: key);

  @override
  ShortcutsItemState createState() {
    return ShortcutsItemState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class ShortcutsItemState extends State<ShortcutsItem> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomBannerForm1State>.
  final _formKey = GlobalKey<FormState>();
  final controller = PageController(initialPage: 0);
  String selectedCurrency=  'USD';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrency();
  }
  void getCurrency() async {
    selectedCurrency=  RefreshApp.of(context)!.apiHeaders!.acceptCurrency.toString();
    print("acceptCurrency-----"+selectedCurrency);
    await CustomSharedPrefs().getV("currency").then((value) {
      if(value!=null&&value!=''){
        switch(value){
          case 'USD':
            setState(() {
              selectedCurrency='USD';
            });

            break;
          case 'AED':
            setState(() {
              selectedCurrency='AED';
            });

            break;

          case 'IQD':
            setState(() {
              selectedCurrency='IQD';
            });
            break;
          // case 'JOD':
          //   setState(() {
          //     selectedCurrency='JOD';
          //   });
          //   break;
        }

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double radius = 7;
    // Build a Form widget using the _formKey created above.

    return Container(
      margin: EdgeInsets.only(),
      height: widget.height,
      child: Container(height: widget.height,
          alignment: Alignment.center,
          child: DropdownButton<Currency>(
            iconSize: 15,
            borderRadius: BorderRadius.circular(21),
            underline: Container(),
            hint: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
              //  AppIcon(icon:AppIcon.GLOBE_PATH,size: 20, ),
                BaseText
                  (
                  color: Theme.of(context).primaryColor,
                  margin: 0,
                  marginh: 5,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  text: selectedCurrency,clickable: false,onPressed:(){},)

              ],
            ),
            onChanged: (Currency? currency) {
              _changeCurrency(currency);
              selectedCurrency=currency!.code.toString();
              //Navigator.of(context).pop();
            },
            items: Currency.currencyList()
                .map<DropdownMenuItem<Currency>>(
                  (e) => DropdownMenuItem<Currency>(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                 //   AppIcon(icon:AppIcon.GLOBE_PATH,size: 20, ),
                    BaseText
                      (
                      color: Theme.of(context).primaryColor,
                      margin: 0,
                      marginh: 0,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      text: e.code,clickable: false,onPressed:(){},)

                  ],
                ),
              ),
            )
                .toList(),
          )),

    );

  }
  void _changeCurrency(Currency? currency) async {
    RefreshApp.of(context)!.apiHeaders.acceptCurrency=currency!.code;
    CustomSharedPrefs().setVJson("APIHeaders",    RefreshApp.of(context)!.apiHeaders.toJson()).then((value) {
      CustomSharedPrefs().setV("currency", currency.code).then((value) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Splash()));
      });

    });
  }

}
