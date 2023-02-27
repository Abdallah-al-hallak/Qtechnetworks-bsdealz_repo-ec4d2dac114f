import 'package:flutter/material.dart';


class BaseText extends StatefulWidget {

  final String text;
  final double margin,marginh;
  final VoidCallback onPressed;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final bool clickable;
  final  FontStyle? fontStyle;
  const BaseText({
    Key? key,
    required this.text,
    required this.margin,
    required this.marginh,
    required this.color,
    required this.fontSize,
    required this.onPressed,
    required this.fontWeight,
    required this.clickable,
    this.fontStyle
  }) : super(key: key);

  @override
  _BaseTextState createState() => _BaseTextState();
}

class _BaseTextState extends State<BaseText> {

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    // widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(widget.clickable){
      return InkWell(
        hoverColor: Colors.transparent,
        focusColor:Colors.transparent,
        onTap: widget.onPressed,
        child: Container(
            margin:EdgeInsets.only(top:widget.margin,right: widget.marginh,left: widget.marginh),
            child:Text(widget.text,style: TextStyle(color: widget.color,fontSize: widget.fontSize,fontWeight:widget.fontWeight ),
            )),
      );
    }else{
      return Container(
          margin:EdgeInsets.only(top:widget.margin,right: widget.marginh,left: widget.marginh),
          child:Text(widget.text,style: TextStyle(color: widget.color,fontSize: widget.fontSize,fontWeight:widget.fontWeight,height: 0.9 ,fontStyle: widget.fontStyle),
          ));
    }
  }
}