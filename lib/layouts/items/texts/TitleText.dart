import 'package:bsdealz/layouts/items/texts/BaseText.dart';
import 'package:flutter/material.dart';


class TitleText extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final bool clickable;

  const TitleText( {
    Key? key,
    required this.text,
    required this.onPressed,
    required this.clickable,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BaseText(
     color: Theme.of(context).primaryColor,
     text:text,
     margin: 20,
     marginh: 20,
     fontSize: 24,
     onPressed: onPressed,
     fontWeight: FontWeight.bold, clickable: clickable,fontStyle: FontStyle.italic,
   );

  }
}