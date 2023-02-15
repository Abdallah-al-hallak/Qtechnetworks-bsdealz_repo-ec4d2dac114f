import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget  implements PreferredSizeWidget{
  final double height,width;
  final IconData icon;
  final String text;
  final Color color;
  final Color startColor;
  final Color endColor;
  final Color iconColor;
  final Color textColor;
  final double fontSize;
  final double radius,padding,margin,iconpadding,ovalpadding;
  final VoidCallback onPressed;
  final bool isGradient;
  final bool isfilled;
  final bool isActive;

  const ToggleButton({
    Key? key,
    required this.height,
    required this.width,
    required this.icon,
    required this.text,
    required this.color,
    required this.startColor,
    required this.endColor,
    required this.iconColor,
    required this.textColor,
    required this.fontSize,
    required this.radius,
    required this.padding,
    required this.iconpadding,
    required this.ovalpadding,
    required this.margin,
    required this.isGradient,
    required this.isfilled,
    required this.isActive,
    required this.onPressed,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration cDecoration;
    ShapeBorder shapeBorder1=RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(19.0)),
      side: BorderSide(width: 0.3, color: Colors.grey[300]!),

    );
    Color s=startColor;
    Color e=endColor;
    Color tcolor=textColor;
    if(!isActive){
      s=color;
      e=color;
      tcolor=textColor;
    }else{
      s=color;
      e=color;
      tcolor=textColor;
    }
    Widget button2=Container(
        width: width,
        height: height,
        margin:EdgeInsets.all(margin),
        child:MaterialButton(
          onPressed: onPressed,
          shape: shapeBorder1,
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [s, e],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(19.0)
            ),
            child: Container(
              constraints: BoxConstraints(maxWidth: width, minHeight: height),
              alignment: Alignment.center,
              child: Center(
                child: Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: tcolor,),
                ),
              ),
            ),
          ),
        ));

    if(!isfilled) {

      button2=Container(
        padding: EdgeInsets.only(left: 7,right: 7),
        child: Card(
          elevation: 8.0,
          shape: shapeBorder1,
          child: Center(
            child: Text( text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }
    return button2;
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}