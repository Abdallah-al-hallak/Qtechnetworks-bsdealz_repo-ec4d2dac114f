import 'package:bsdealz/layouts/items/buttons/BaseButton.dart';
import 'package:flutter/material.dart';

import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';
import 'CustomButton.dart';

class MainButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final bool isActive;
  const MainButton( {
    Key? key,
    required this.onPressed,
    required this.text,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BaseButton(
     isfilled: true,
     isGradient: isActive,
     isActive:isActive,
     iconColor:Colors.white,
     color: Theme.of(context).primaryColor,
     height:55,
     text:text,
     icon: Icons.home,
     textColor:HexColor(AppSettingTheme.getTheme(context,Config.MAIN_BUTTON_TEXT_COLOR_KEY,Config.MAIN_BUTTON_TEXT_COLOR_VALUE,)),
     padding: 5,
     iconpadding: 5,
     margin: 10,
     radius: 19,
     fontSize: 16,
     ovalpadding:4,
     onPressed: onPressed,
     width: 305,
     startColor:HexColor(AppSettingTheme.getTheme(context,Config.MAIN_BUTTON_START_COLOR_KEY,Config.MAIN_BUTTON_START_COLOR_VALUE,)),
     endColor: HexColor(AppSettingTheme.getTheme(context,Config.MAIN_BUTTON_END_COLOR_KEY,Config.MAIN_BUTTON_END_COLOR_VALUE,)),
   );

  }
}