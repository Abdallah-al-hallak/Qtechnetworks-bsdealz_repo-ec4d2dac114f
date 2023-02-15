import 'package:bsdealz/layouts/items/texts/BaseText.dart';
import 'package:flutter/material.dart';


class FooterText extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final bool clickable;

  const FooterText( {
    Key? key,
    required this.text,
    required this.onPressed,
    required this.clickable,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BaseText(
     color: Color(0Xff707070),
     text:text,
     margin: 5,
     marginh: 10,
     fontSize: 13,
     onPressed: onPressed,
     fontWeight: FontWeight.bold, clickable: clickable,
   );

  }
}