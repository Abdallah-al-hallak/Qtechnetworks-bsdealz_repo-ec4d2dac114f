import 'package:flutter/material.dart';

class DialogBtn extends StatelessWidget  implements PreferredSizeWidget{
  final double height,width;
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;
  final Color textColor;
  final double fontSize;
  final double radius,padding,margin,iconpadding,ovalpadding;
  final VoidCallback onPressed;
  final Color shadowColor;
  final bool isCircleIcon;
  const DialogBtn({
    Key? key,
    required this.height,
    required this.width,
    required this.icon,
    required this.text,
    required this.color,
    required this.iconColor,
    required this.textColor,
    required this.fontSize,
    required this.radius,
    required this.padding,
    required this.iconpadding,
    required this.ovalpadding,
    required this.margin,
    required this.isCircleIcon,
    required this.onPressed,
    required this.shadowColor
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget customIcon;
    if(isCircleIcon){
      customIcon=ClipOval(
          child:Container(padding:EdgeInsets.all(ovalpadding),
              color:iconColor,child:Icon(icon,color:color,)));
    }else{
      customIcon=Icon(icon,color: iconColor,);
    }
    Container button2=Container(
        margin:EdgeInsets.all(margin) ,
        height: height,
        width: width,
        child:PhysicalModel(
          elevation: 4.0,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(radius),
          shadowColor: shadowColor,
          child:ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child:MaterialButton(
              onPressed:onPressed,
              color:color,
              child: Container(
                padding: EdgeInsets.all(padding),

                child:Row(
                  children: <Widget>[
                    Expanded(
                      child:Text(text,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: textColor,),
                      ),
                    ),
                  ],
                ),
              ),),),


        ));
    return button2;
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}