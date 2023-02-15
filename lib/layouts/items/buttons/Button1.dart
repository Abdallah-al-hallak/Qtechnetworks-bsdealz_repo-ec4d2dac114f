import 'package:flutter/material.dart';

import 'CustomButton.dart';

class Button1 extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final hasIcon;
  final color;
  final fontColor;
  const Button1( {
    Key? key,
    required this.onPressed,
    required this.text,
    required this.hasIcon,
    required this.color,
    required this.fontColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return CustomButton(
     hasIcon: hasIcon,
     iconColor:Colors.white,
     color: color,
     height:50,
     text:text,
     icon: Icons.keyboard_arrow_right,
     textColor: fontColor,
     isCircleIcon: false,
     padding: 5,
     iconpadding: 5,
     margin: 20,
     radius: 8,
     fontSize: 16,
     ovalpadding:4,
     onPressed: onPressed, width: MediaQuery.of(context).size.width,
   );

  }
}