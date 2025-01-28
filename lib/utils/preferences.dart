import 'package:shared_preferences/shared_preferences.dart';
import '../constants/stringConstants.dart';

class AppPreferences {
  Future setStringPreference(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  logoutPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  setProfileStringPreference(String token, String name, String email, String status,
      String city, String country, dob, mobile, gender, id, partyCode, otp, appType, info, phoneValue, msg) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(StringConstants.email, email);
    prefs.setString('otp', otp);
    prefs.setString('appType', appType);
    prefs.setString('info', info);
    prefs.setString('msg', msg);
    prefs.setString('phone', phoneValue);
  }

  setBooleanPreference(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<String> getStringPreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefValue = prefs.getString(key) ?? '';
    return prefValue;
  }

  Future<bool> getBoolPreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool prefValue = prefs.getBool(key) ?? false;

    return prefValue;
  }
}
