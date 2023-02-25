import 'package:shared_preferences/shared_preferences.dart';

getTokenStorage() async {
  return await SharedFunc().getShared('token');
}

getId() async {
  return await SharedFunc().getId('id');
}

class SharedFunc {
  setToken(key, value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  setId(key, value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(key, value);
  }

  getShared(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  getId(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? "";
  }
}
