import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget  implements PreferredSizeWidget{
  final double height,width;
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;
  final Color textColor;
  final double fontSize;
  final double radius,padding,margin,iconpadding,ovalpadding;
  final VoidCallback onPressed;
  final bool isCircleIcon;
  final bool hasIcon;
  const CustomButton({
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
    required this.hasIcon,
    required this.onPressed,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
     Widget customIcon;
     if(hasIcon) {
       if (isCircleIcon) {
         customIcon = ClipOval(
             child: Container(padding: EdgeInsets.all(ovalpadding),
                 color: iconColor, child: Icon(icon, color: color,)));
       } else {
         customIcon = Icon(icon, color: iconColor,);
       }
     }else{
       customIcon=Container();
     }
    Container button2=Container(
        margin:EdgeInsets.all(margin) ,
        height: height,
        width: width,
        child:PhysicalModel(
          elevation: 3.3,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(radius),
          shadowColor: Colors.black,
          child:ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child:MaterialButton(
              onPressed:onPressed,
              color:color,
              child: Container(
                padding: EdgeInsets.all(padding),

                child:Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child:Text(text,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: textColor,),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child:Container(
                        padding:EdgeInsets.only(right:iconpadding),
                        child: customIcon,
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