import 'package:flutter/material.dart';
import 'package:theme_preference_demo/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeProvider extends ChangeNotifier{
  User? user;
  bool _themeMode  = false; //true:night-mode, false:light-mode

  ThemeModeProvider({this.user}){
    _loadPrefenceData();
  }

  bool? get themeMode => _themeMode;

  Future<void> _loadPrefenceData() async{
    final pref = await SharedPreferences.getInstance();
    _themeMode = pref.getBool('themeMode_${user?.id}') ?? false;
    notifyListeners();
  }

  Future<void> lightMode() async{
    _themeMode = false;
    final pref = await SharedPreferences.getInstance();
    pref.setBool('themeMode_${user?.id}', _themeMode);
    notifyListeners();
  }

  Future<void> darkMode() async{
    _themeMode = true;
    final pref = await SharedPreferences.getInstance();
    pref.setBool('themeMode_${user?.id}', _themeMode);
    notifyListeners();
  }
}