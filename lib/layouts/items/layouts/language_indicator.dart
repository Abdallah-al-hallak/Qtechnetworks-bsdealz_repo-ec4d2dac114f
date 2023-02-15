import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/layouts/items/texts/BaseText.dart';
import 'package:bsdealz/layouts/items/texts/FooterText.dart';
import 'package:bsdealz/layouts/items/texts/SubTitleText.dart';
import 'package:bsdealz/layouts/pages/main/splash.dart';
import 'package:bsdealz/localization/Language.dart';
import 'package:bsdealz/localization/language_constants.dart';
import 'package:bsdealz/main.dart';
import 'package:bsdealz/network/models/APIHeaders.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:bsdealz/utils/sharedprefs.dart';
import 'package:flutter/material.dart';



class LanguageIndicator extends StatefulWidget implements PreferredSizeWidget {
  final double height;


  const LanguageIndicator({Key? key, required this.height})
      : super(key: key);

  @override
  _LanguageIndicatorState createState() => _LanguageIndicatorState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _LanguageIndicatorState extends State<LanguageIndicator> {


  _LanguageIndicatorState();

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
  String selectedLanguage=  'en';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocale();
  }
  void getLocale() async {
     selectedLanguage=  RefreshApp.of(context)!.apiHeaders!.acceptLanguage.toString();
     print("selectedLanguage-----"+selectedLanguage);
    await CustomSharedPrefs().getV("language").then((value) {
      if(value!=null&&value!=''){
        switch(value){
          case 'en':
            setState(() {
              selectedLanguage='en';
            });

            break;
          case 'ar':
            setState(() {
              selectedLanguage='ar';
            });

            break;
          case 'ku':
            setState(() {
              selectedLanguage='ku';
            });

            break;
        }

      }
    });
}
  @override
  Widget build(BuildContext context) {
    double radius = 7;
    // Build a Form widget using the _formKey created above.

    Widget englishCard=   InkWell(
      hoverColor: Colors.transparent,
      focusColor:Colors.transparent,
      onTap: (){
      setState(() {
        selectedLanguage='en';
        _changeLanguage(Language.languageList()[0]);
      });
    },
      child: Card(
        elevation: 2,
        color: Colors.red,
        shape: const CircleBorder(),
        child: Container(alignment: Alignment.center,  width:widget.height-5,height:widget.height-5,child: BaseText
          (
          color: Colors.white,
          margin: 0,
          marginh: 0,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          text: "en",clickable: false,onPressed:(){},),),
      ),
    );
    Widget arabicCard=                   InkWell(
      hoverColor: Colors.transparent,
      focusColor:Colors.transparent,
      onTap: (){
        setState(() {
          selectedLanguage='ar';
          _changeLanguage(Language.languageList()[1]);
        });

      }
      ,
      child: Card(
        elevation: 2,
        color: Colors.red,
        shape: const CircleBorder(),
        child: Container(alignment: Alignment.center,  width:widget.height-5,height:widget.height-5,child: BaseText
          (
          color: Colors.white,
          margin: 0,
          marginh: 0,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          text: "ar",clickable: false,onPressed:(){},),),
      ),
    );
    Widget kurdishCard=                   InkWell(
      hoverColor: Colors.transparent,
      focusColor:Colors.transparent,
      onTap: (){
        setState(() {
          selectedLanguage='ku';
          _changeLanguage(Language.languageList()[2]);
        });
      },
      child: Card(
        elevation: 2,
        color: Colors.red,
        shape: const CircleBorder(),
        child: Container(alignment: Alignment.center,  width:widget.height-5,height:widget.height-5,child: BaseText
          (
          color: Colors.white,
          margin: 0,
          marginh: 0,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          text: "ku",clickable: false,onPressed:(){

        },),),
      ),
    );

    List<Widget> languagesWidgets=[englishCard,arabicCard,kurdishCard];
    switch(selectedLanguage){

      case 'en':
        englishCard=Container(width: 0,height: 0,);
        languagesWidgets.remove(englishCard);
        break;
      case 'ar':
        arabicCard=Container(width: 0,height: 0,);
        languagesWidgets.remove(arabicCard);
        break;
      case 'ku':
        kurdishCard=Container(width: 0,height: 0,);
        languagesWidgets.remove(kurdishCard);
        break;
    }

    return Container(
      margin: EdgeInsets.only(),
      height: widget.height,
      child: Container(height: widget.height,
        alignment: Alignment.center,
        child: DropdownButton<Language>(
          iconSize: 15,
          borderRadius: BorderRadius.circular(21),
          underline: Container(),
          hint: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              AppIcon(icon:AppIcon.GLOBE_PATH,size: 20, ),
              BaseText
                (
                color: Theme.of(context).primaryColor,
                margin: 0,
                marginh: 5,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                text: selectedLanguage,clickable: false,onPressed:(){},)

            ],
          ),
          onChanged: (Language? language) {
            _changeLanguage(language);
            selectedLanguage=language!.languageCode.toString();
            //Navigator.of(context).pop();
          },
          items: Language.languageList()
              .map<DropdownMenuItem<Language>>(
                (e) => DropdownMenuItem<Language>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  AppIcon(icon:AppIcon.GLOBE_PATH,size: 20, ),
                  BaseText
                    (
                    color: Theme.of(context).primaryColor,
                    margin: 0,
                    marginh: 0,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    text: e.languageCode,clickable: false,onPressed:(){},)

                ],
              ),
            ),
          )
              .toList(),
        )),
     //TODO Style 2

        // child: ListView(
        //   shrinkWrap: true,
        //   reverse: true,
        //   scrollDirection: Axis.horizontal,
        //   children: [englishCard,arabicCard,kurdishCard
        //   ],),),
    );

  }
  void _changeLanguage(Language? language) async {
    Locale _locale = await setLocale(language!.languageCode);
    MyApp.setLocale(context, _locale);
    RefreshApp.of(context)!.apiHeaders.acceptLanguage=language!.languageCode;
    CustomSharedPrefs().setVJson("APIHeaders",    RefreshApp.of(context)!.apiHeaders.toJson()).then((value) {
      CustomSharedPrefs().setV("language", language!.languageCode).then((value) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Splash()));
      });

    });
  }

}
