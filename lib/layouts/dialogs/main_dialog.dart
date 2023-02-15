import 'dart:async';
import 'dart:ui';

import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';

enum DialogType { INFO, SUCCESS, WARNING, ERROR }

class MainDialog extends StatefulWidget {
  final String title, descriptions, text;
  Image? img;
  final Widget customWidget;
  final DialogType type;

  MainDialog({
    Key? key,
    required this.title,
    required this.descriptions,
    required this.text,
    this.img,
    required this.type,
    required this.customWidget,
  }) : super(key: key);

  @override
  _MainDialogState createState() => _MainDialogState();

  static showMyDialog(MainDialog dialog, BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}

class _MainDialogState extends State<MainDialog> {
  Widget closeBtn = Container();
  @override
  Widget build(BuildContext context) {
    if (widget.type == DialogType.INFO) {
      closeBtn = Container(
        alignment: Alignment.topRight,
        child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: AppIcon(
              icon: AppIcon.CLOSE_PATH,
              size: 22,
            )),
      );
    } else {
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pop();
      });
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    Widget dialogIcon = AppIcon(
      icon: AppIcon.SUCCESS_PATH,
      size: 60,
    );
    Color themecolor = RefreshApp.of(context)!.info;
    Color backColor = Color(0XFFFFFFFF);
    if (widget.type == DialogType.INFO) {
      dialogIcon = AppIcon(
        icon: AppIcon.INFO_PATH,
        size: 60,
      );
      themecolor = RefreshApp.of(context)!.info;
      // backColor=Color(0XFFEBF6EE);
    }
    if (widget.type == DialogType.SUCCESS) {
      dialogIcon = AppIcon(
        icon: AppIcon.SUCCESS_PATH,
        size: 60,
      );
      themecolor = RefreshApp.of(context)!.success;
      // backColor=Color(0XFFDFF3E4);
    }
    if (widget.type == DialogType.WARNING) {
      dialogIcon = AppIcon(
        icon: AppIcon.WARNING_PATH,
        size: 60,
      );
      themecolor = RefreshApp.of(context)!.warning;
      //  backColor=Color(0XFFFFF2D8);
    }
    if (widget.type == DialogType.ERROR) {
      dialogIcon = AppIcon(
        icon: AppIcon.ERROR_PATH,
        size: 60,
      );
      themecolor = RefreshApp.of(context)!.danger;
      //   backColor=Color(0XFFFFDCD9);
    }
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 350,
          padding:
              const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
          //    margin: EdgeInsets.only(top: 70),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: backColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //TODO Close button
              closeBtn,
              SizedBox(
                width: 80,
                height: 80,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 0,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                      child: dialogIcon),
                ),
              ),
              Text(widget.title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: themecolor),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              widget.customWidget,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //
              //         height: 50,
              //         width: 150,
              //         alignment: Alignment.center,
              //         child:PhysicalModel(
              //           elevation: 3.3,
              //           color: Colors.transparent,
              //           borderRadius: BorderRadius.circular(8),
              //           shadowColor: Colors.black,
              //           child:ClipRRect(
              //             borderRadius: BorderRadius.circular(8),
              //             child:MaterialButton(
              //               onPressed: (){
              //                 Navigator.of(context).pop();
              //               },
              //               color:themecolor,
              //               child: Container(
              //                 padding: EdgeInsets.all(5),
              //
              //                 child:Stack(
              //                   children: <Widget>[
              //                     Align(
              //                       alignment: Alignment.center,
              //                       child:Text(widget.text,
              //                         textAlign: TextAlign.center,
              //                         style: TextStyle(fontSize: 18,
              //                           fontWeight: FontWeight.bold,
              //                           color: Colors.white,),
              //                       ),
              //                     ),
              //
              //                   ],
              //                 ),
              //               ),),),
              //
              //
              //         )),
              //   ],
              // )
            ],
          ),
        ),
      ],
    );
  }
}
