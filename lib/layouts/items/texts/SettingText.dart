import 'package:bsdealz/layouts/items/texts/BaseText.dart';
import 'package:flutter/material.dart';


class SettingText extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final bool clickable;

  const SettingText( {
    Key? key,
    required this.text,
    required this.onPressed,
    required this.clickable,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BaseText(
     color: Color(0XFF707070),
     text:text,
     margin: 0,
     marginh: 10,
     fontSize: 17,
     onPressed: onPressed,
     fontWeight: FontWeight.normal, clickable: clickable,
   );

  }
}