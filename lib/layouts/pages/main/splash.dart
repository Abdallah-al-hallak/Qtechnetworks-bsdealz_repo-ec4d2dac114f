import 'dart:async';
import 'dart:developer';

import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/layouts/pages/credentials/login.dart';
import 'package:bsdealz/layouts/pages/main/home_page.dart';
import 'package:bsdealz/layouts/pages/main/intro_video_page.dart';
import 'package:bsdealz/network/models/APIUser.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bsdealz/layouts/dialogs/dialog_language.dart';
import 'package:bsdealz/layouts/pages/main/language_page.dart';

import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:bsdealz/utils/sharedprefs.dart';

import 'package:video_player/video_player.dart';

import '../../../network/models/APIHeaders.dart';



class Splash extends StatefulWidget{
  @override
  _SplashState createState() => _SplashState();

}

class _SplashState extends State<Splash> {
  late VideoPlayerController _controller;
  bool animationFinished=false;
  bool serverFinished=false;
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getToken().then((value){
      // AppTranslation.getByKey("select_preferred_language").toString()
      print("FCM TOKEN:"+value.toString());
    });
    route();
    // startTimer();
    loadedChecker();
    if(!kIsWeb) {
       _controller = VideoPlayerController.asset(
          'assets/images/animation.mp4')
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          print("video -------------inisialized!!");
          setState(() {});
        });
       _controller.addListener(checkVideo);
      _controller.play();
    }

  }
  void checkVideo(){
    // Implement your calls inside these conditions' bodies :
    if(_controller.value.position == Duration(seconds: 0, minutes: 0, hours: 0)) {
      print('video Started');
    }

    if(_controller.value.position == _controller.value.duration) {
      print('video Ended');
      startTimer();
    }

  }
  startTimer() async {
    var duration=Duration(seconds:5);
    return Timer(duration, (){

      animationFinished=true;
    });
  }

  loadedChecker() async {
    var duration=Duration(seconds:1);
    return Timer(duration, (){
      if(animationFinished && serverFinished){
        if(RefreshApp.of(context)!.apiHeaders.token!.isNotEmpty) {
          CustomSharedPrefs().getV("language").then((value) {
            if (value != null && value != '') {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IntroVideoPage()));
              RefreshApp.of(context)!.apiHeaders.acceptLanguage = value.toString();
              CustomSharedPrefs().setVJson("APIHeaders", RefreshApp.of(context)!.apiHeaders.toJson());
            } else {
              if (kIsWeb) {
                CustomSharedPrefs().setV("language", "en").then((value) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                });
              } else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LanguagePage()));
              }
            }
          });
        }else{
          CustomSharedPrefs().getV("language").then((value) {
            if (value != null && value != '') {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IntroVideoPage()));
              RefreshApp.of(context)!.apiHeaders.acceptLanguage=value.toString();
              CustomSharedPrefs().setVJson("APIHeaders",  RefreshApp.of(context)!.apiHeaders.toJson());
            } else {
              if(kIsWeb){
                CustomSharedPrefs().setV("language","en").then((value) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(destination: "1",)));
                });
              }else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LanguagePage()));
              }
            }
          });
        }
      }else{
        loadedChecker();
      }
    });
  }
  route() async {
    ApiUser user;
    CustomSharedPrefs().getVJson("APIHeaders").then(( value) {
      if(value!=null&&value!='') {
        RefreshApp.of(context)!.apiHeaders = ApiHeaders.fromJson(value);

      if(RefreshApp.of(context)!.apiHeaders.token!.isNotEmpty){
    RefreshApp.of(context)!.fetchServerData("app-customer",context)!.then((value) {
      print("app-customer "+"----------------------------------");
      serverFinished=true;


        });
      }else{
        RefreshApp.of(context)!.fetchServerData("app-guest",context)!.then((value) {
          serverFinished=true;


        });

      }


      }else{
        RefreshApp.of(context)!.fetchServerData("app-guest",context)!.then((value) {
          serverFinished=true;
          // CustomSharedPrefs().getV("language").then((value) {
          //   if (value != null && value != '') {
          //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(destination: "1")));
          //     RefreshApp.of(context)!.apiHeaders.acceptLanguage=value.toString();
          //     CustomSharedPrefs().setVJson("APIHeaders",  RefreshApp.of(context)!.apiHeaders.toJson());
          //   } else {
          //     if(kIsWeb){
          //       CustomSharedPrefs().setV("language","en").then((value) {
          //
          //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(destination: "1")));
          //       });
          //     }else {
          //       Navigator.pushReplacement(context,
          //           MaterialPageRoute(builder: (context) => LanguagePage()));
          //     }
          //   }
          // });
        });

      }
      print("Getting Headers"+"----------------------------------"+RefreshApp.of(context)!.apiHeaders.toJson().toString());
    }).onError((error, stackTrace) {
      CustomSharedPrefs().setVJson("APIHeaders", RefreshApp.of(context)!.apiHeaders.toJson()).then((value) {

        print("Getting Headers"+"----------------------------------"+RefreshApp.of(context)!.apiHeaders.toJson().toString());
        RefreshApp.of(context)!. fetchServerData("app-guest",context)!.then((value) {
          serverFinished=true;
          // CustomSharedPrefs().getV("language").then((value) {
          //   if (value != null && value != '') {
          //     Navigator.pushReplacement(context, MaterialPageRoute(
          //         builder: (context) => Login(destination: "1")));
          //     RefreshApp.of(context)!.apiHeaders.acceptLanguage=value.toString();
          //     CustomSharedPrefs().setVJson("APIHeaders",  RefreshApp.of(context)!.apiHeaders.toJson());
          //   } else {
          //     if(kIsWeb){
          //       CustomSharedPrefs().setV("language","en").then((value) {
          //
          //         Navigator.pushReplacement(context,
          //             MaterialPageRoute(builder: (context) => Login(destination: "1")));
          //       });
          //     }else {
          //       Navigator.pushReplacement(context,
          //           MaterialPageRoute(builder: (context) => LanguagePage()));
          //     }
          //   }
          // });
        });

      });
    });

    //Cart.fromJson(value.data);
    //user = json.decode(await CustomSharedPrefs().getV("user") as String) as User;
    // print("-getting user-------");
    // await CustomSharedPrefs().getV("user").then((value) async {
    //   print("-user data-------"+value.toString());
    //
    //     user=ApiUser.fromJson(value);
    //     RefreshApp.of(context)!.currentUser=user;
    //   RefreshApp.of(context)!.fetchServerData("app-customer",context)!.then((value) {
    //     CustomSharedPrefs().getV("language").then((value) {
    //       if (value != null && value != '') {
    //         Navigator.pushReplacement(context, MaterialPageRoute(
    //             builder: (context) => HomePage()));
    //       } else {
    //         Navigator.pushReplacement(context,
    //             MaterialPageRoute(builder: (context) => LanguagePage()));
    //       }
    //     });
    //   }
    //       );
    //
    // }).onError((error, stackTrace) async {
    //   print("-getting user-----failed--");
    //   RefreshApp.of(context)!.fetchServerData("app-guest",context)!.then((value) {
    //     Navigator.pushReplacement(context, MaterialPageRoute(
    //         builder: (context) => Login(destination: "1")));
    //   });
    //
    //
    // });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget backgroundContent=AppIcon( icon: AppIcon.ANIMATION_PATH,size: 150,);
    // if(!kIsWeb) {
    //
    //   double defaultAspect=_controller.value.aspectRatio;
    //  // double deviceAspect=1;
    //   backgroundContent=_controller.value.isInitialized
    //       ? AspectRatio(
    //     aspectRatio: defaultAspect,
    //     child: VideoPlayer(_controller),
    //   )
    //       : Container();
    //
    // }


    return

       Scaffold(

        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/images/theme_bg.png"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: 30),
              width: 225,
              height: 225,
              child: Center(
                child: Column(
                  children: [backgroundContent
                    // Container(
                    //   margin: EdgeInsets.only(top: 20),
                    //     width:75
                    //     ,child: Image.asset("assets/images/logo_sub.png")),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  }


}