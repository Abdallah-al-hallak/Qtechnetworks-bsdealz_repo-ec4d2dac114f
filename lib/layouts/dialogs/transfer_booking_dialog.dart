import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';

class TransferBookingDialog extends StatefulWidget {
  final String title, descriptions, text,type;
  Image? img;
  final Widget customWidget;

  TransferBookingDialog({Key? key, required this.title, required this.descriptions, required this.text,  this.img,required this.type,required this.customWidget}) : super(key: key);

  @override
  _TransferBookingDialogState createState() => _TransferBookingDialogState();
}

class _TransferBookingDialogState extends State<TransferBookingDialog> {

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
    Widget dialogIcon=Container(width:70,height: 70,child:Image.asset("assets/images/dialog_info.png"));
    Color themecolor=RefreshApp.of(context)!.info;
    Color backColor=Color(0XFFDFF3E4);
    if(widget.type=="1"){
      dialogIcon=Container(width:70,height: 70,child: Image.asset("assets/images/dialog_info.png"));
      themecolor=RefreshApp.of(context)!.info;
      backColor=Color(0XFFEBF6EE);
    }
    if(widget.type=="2"){
      dialogIcon=Container(width:70,height: 70,child: Image.asset("assets/images/dialog_success.png"));
      themecolor=RefreshApp.of(context)!.success;
      backColor=Color(0XFFDFF3E4);
    }
    if(widget.type=="3"){
      dialogIcon=Container(width:70,height: 70,child: Image.asset("assets/images/dialog_warning.png"));
      themecolor=RefreshApp.of(context)!.warning;
      backColor=Color(0XFFFFF2D8);
    }
    if(widget.type=="4"){
      dialogIcon=Container(width:70,height: 70,child: Image.asset("assets/images/dialog_danger.png"));
      themecolor=RefreshApp.of(context)!.danger;
      backColor=Color(0XFFFFDCD9);
    }
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(

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
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 80,
                height: 80,

                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 20,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: dialogIcon
                  ),
                ),
              ),
              Text(widget.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: themecolor),textAlign: TextAlign.center),
              SizedBox(height: 15,),
              Text(widget.descriptions,style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
              SizedBox(height: 22,),
              widget.customWidget,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(

                      height: 45,
                      width: 110,
                      alignment: Alignment.center,
                      child:PhysicalModel(
                        elevation: 3.3,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        shadowColor: Colors.black,
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child:MaterialButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            color:themecolor,
                            child: Container(
                              padding: EdgeInsets.all(5),

                              child:Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child:Text(widget.text,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,),
                                    ),
                                  ),

                                ],
                              ),
                            ),),),


                      )),
                ],
              )
            ],
          ),
        ),



      ],
    );
  }
}