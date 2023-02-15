import 'package:bsdealz/layouts/items/texts/BaseText.dart';
import 'package:flutter/material.dart';


class SubTitleText extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool clickable;

  const SubTitleText( {
    Key? key,
    required this.text,
    required this.onPressed,
    required this.clickable,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BaseText(
     color:Colors.black,
     text:text,
     margin: 0,
     marginh: 20,
     fontSize: 15,
     onPressed: onPressed,
     clickable: clickable,
     fontWeight: FontWeight.bold,
   );

  }
}