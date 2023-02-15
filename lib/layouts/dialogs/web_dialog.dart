import 'dart:ui';

import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';


class WebDialog extends StatefulWidget {
  final String? title, descriptions, text;
  Image? img;
  final Widget customWidget;


  WebDialog({Key? key,  this.title,  this.descriptions,  this.text,  this.img,required this.customWidget,}) : super(key: key);

  @override
  _WebDialogState createState() => _WebDialogState();

  static showMyDialog(WebDialog dialog,BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}

class _WebDialogState extends State<WebDialog> {

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
    Color backColor=Color(0XFFFFFFFF);
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 550,
          padding: EdgeInsets.only(left: 10,top: 10
              , right: 10,bottom: 10
          ),
          //    margin: EdgeInsets.only(top: 70),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: backColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
         //   mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(alignment: Alignment.topRight,
                child: InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: AppIcon(icon: AppIcon.CLOSE_PATH,size: 22,))
                ,),
              Container(
                  height:800,
                  child: widget.customWidget),
            ],
          ),
        ),



      ],
    );
  }
}