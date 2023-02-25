import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:flutter/cupertino.dart';

class AppSettingTheme {
  static String getSetting(
      BuildContext context, String key, String defaultValue) {
    for (int i = 0; i < 2; i++) {
      if (key ==
          RefreshApp.of(context)!
              .apiAppVariables
              .setting
              ?.elementAt(i)
              .name
              .toString()) {
        return RefreshApp.of(context)!
            .apiAppVariables
            .setting!
            .elementAt(i)
            .svalue
            .toString();
      }
    }
    return defaultValue;
  }

  static String getTheme(
      BuildContext context, String key, String defaultValue) {
    for (int i = 0; i < 2; i++) {
      if (key ==
          RefreshApp.of(context)!
              .apiAppVariables
              .theme
              ?.elementAt(i)
              .name
              .toString()) {
        return RefreshApp.of(context)!
            .apiAppVariables
            .theme!
            .elementAt(i)
            .value
            .toString();
      }
    }
    return defaultValue;
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
