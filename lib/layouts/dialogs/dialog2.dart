import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bsdealz/layouts/pages/settings/page_lang.dart';


class CustomDialogBox2 extends StatefulWidget {
  final String title, descriptions, text;
  final Image img;

  const CustomDialogBox2({Key? key, required this.title, required this.descriptions, required this.text, required this.img}) : super(key: key);

  @override
  _CustomDialogBox2State createState() => _CustomDialogBox2State();
}

class _CustomDialogBox2State extends State<CustomDialogBox2> {
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
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10,top: 70
              , right: 10,bottom: 10
          ),
          margin: EdgeInsets.only(top: 70),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: PageLang()
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
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset("assets/images/red_success.png")
              ),
            ),
          ),
        ),
      ],
    );
  }
}