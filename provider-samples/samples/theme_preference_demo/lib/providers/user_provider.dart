import 'package:flutter/material.dart';
import 'package:theme_preference_demo/models/user.dart';

class UserProvider extends ChangeNotifier{
  User? _user;
  bool _isLoggedIn = false;

  User? get user => _user;
  bool get isLoggedIn => _isLoggedIn;

  void loginIn(String id){
    final name = id=='000'?'Rex':'Bree';
    _user = User(id: id, name: name);
    _isLoggedIn = true;
    notifyListeners();
  }

  void loginOut(){
    _user = null;
    _isLoggedIn = false;
    notifyListeners();
  }
}