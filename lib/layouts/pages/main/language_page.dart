import 'package:bsdealz/layouts/items/buttons/MainButton.dart';
import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/layouts/items/texts/SubTitleText.dart';
import 'package:bsdealz/layouts/pages/main/intro_video_page.dart';
import 'package:flutter/material.dart';
import 'package:bsdealz/layouts/items/buttons/Button1.dart';
import 'package:bsdealz/localization/Language.dart';
import 'package:bsdealz/localization/language_constants.dart';
import 'package:bsdealz/utils/sharedprefs.dart';
import '../../../main.dart';



class LanguagePage extends StatefulWidget{
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {

  @override
  void initState() {
    super.initState();

  }
  int language=1;
  void _changeLanguage(Language? language) async {
    Locale _locale = await setLocale(language!.languageCode);
    MyApp.setLocale(context, _locale);

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    bool isEnglish=true;
    bool isArabic=false;
    bool isKurdish=false;
    switch(language){
      case 1:
         isEnglish=true;
         isArabic=false;
         isKurdish=false;
        break;
      case 2:
         isEnglish=false;
         isArabic=true;
         isKurdish=false;
        break;
      case 3:
         isEnglish=false;
         isArabic=false;
         isKurdish=true;
        break;
    }
    print("----------------");
    return

      Scaffold(

        body: Center(
          child: Column(
            children: [
              Container(

                height: MediaQuery.of(context).size.height-200,
                width: 305,
                margin: EdgeInsets.only(top: 100),
                alignment: Alignment.center,
                child: ListView(
                  children: [
                      AppIcon(icon: AppIcon.LOGO_PATH, size: 150),
                    Center(
                      child: Container(

                        padding: EdgeInsets.only(top: 50,bottom: 20),
                          child: SubTitleText(clickable:false,text: "SELECT PREFERRED LANGUAGE",onPressed: (){}),),
                    ),

                     MainButton(onPressed: (){  setState(() {
                       language=1;
                     });},text: "English", isActive: isEnglish,),


                     MainButton(onPressed: (){   setState(() {
                       language=2;
                     });},text: "عربي",isActive: isArabic,),

                      MainButton(onPressed: (){  setState(() {
                        language=3;
                      });},text: "كوردى",isActive: isKurdish,),



                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(20),
                child: GestureDetector(child: SubTitleText(clickable:true,text: "NEXT",onPressed: (){
                  switch(language) {
                    case 1:{
                      _changeLanguage(Language.languageList()[0]);
                      CustomSharedPrefs().setV("language", 'en').then((value) {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => IntroVideoPage()));
                      });
                    }
                    break;
                    case 2:{
                      _changeLanguage(Language.languageList()[1]);
                      CustomSharedPrefs().setV("language", 'ar').then((value) {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => IntroVideoPage()));
                      });
                      break;
                    }
                    case 3:{
                      _changeLanguage(Language.languageList()[1]);
                      CustomSharedPrefs().setV("language", 'ku').then((value) {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => IntroVideoPage()));
                      });
                      break;
                    }
                  }
                }, ),),
              )
            ],
          ),

        ),
      );

  }


}