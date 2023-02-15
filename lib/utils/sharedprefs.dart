import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
  class CustomSharedPrefs {
  Future<Object> setV(String sharedName, Object sharedV) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(sharedName, sharedV.toString());
    return sharedV;
  }

  Future<Object?> getV(String sharedName) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
   // String sharedV = _prefs.getString(sharedName) ?? "error retrieving "+sharedName;
    String? sharedV = _prefs.getString(sharedName) ?? null;
    return sharedV;
  }
  Future<Object?> getVJson(String sharedName) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    // String sharedV = _prefs.getString(sharedName) ?? "error retrieving "+sharedName;
    Map <String,dynamic>? sharedV = jsonDecode(_prefs.getString(sharedName).toString());
    return sharedV;
  }
    Future<Object?> setVJson(String sharedName,Map <String,dynamic> sharedV) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    // String sharedV = _prefs.getString(sharedName) ?? "error retrieving "+sharedName;
    await _prefs.setString(sharedName, jsonEncode(sharedV));
    return jsonEncode(sharedV);
  }

  Future clear() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.clear();
  }

}

