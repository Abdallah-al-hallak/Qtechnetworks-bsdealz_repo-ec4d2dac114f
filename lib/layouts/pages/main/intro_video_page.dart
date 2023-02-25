import 'dart:async';

import 'package:bsdealz/layouts/items/buttons/MainButton.dart';
import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/layouts/pages/credentials/login.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../utils/inherited/refresh_app_state.dart';
import '../../../utils/sharedprefs.dart';
import 'home_page.dart';
import 'language_page.dart';

class IntroVideoPage extends StatefulWidget {
  @override
  _IntroVideoPageState createState() => _IntroVideoPageState();
}

class _IntroVideoPageState extends State<IntroVideoPage> {
  bool isVideo = true;
  String videoUrl =
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
  String PlaceHolderAsset = AppIcon.VIDEO_PLACEHOLDER_PATH;
  String ImageUrl =
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();

    if (isVideo) {
      _controller = VideoPlayerController.network(videoUrl)
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          print("video -------------inisialized!!");
          setState(() {});
        });
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget backgroundContent;
    if (isVideo) {
      double defaultAspect = _controller.value.aspectRatio;
      double deviceAspect = MediaQuery.of(context).size.width /
          MediaQuery.of(context).size.height;
      backgroundContent = _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: deviceAspect,
              child: VideoPlayer(_controller),
            )
          : Container();
    } else {
      backgroundContent = Center(
        child: Container(
          alignment: Alignment.center,
          width: 400,
          height: 800,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(ImageUrl), //AssetImage(PlaceHolderAsset),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(),
        ),
      );
    }
    return Scaffold(
      body: Stack(
        children: [
          backgroundContent,
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 500),
              child: MainButton(
                  isActive: true,
                  text: "SKIP VIDEO",
                  onPressed: () {
                    if (RefreshApp.of(context)?.apiHeaders.token?.isNotEmpty ??
                        true) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login(destination: "1")));
                    }
                    // Navigator.pushReplacement(context, MaterialPageRoute(
                    //     builder: (context) => Login(destination: "1")));
                  }),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
