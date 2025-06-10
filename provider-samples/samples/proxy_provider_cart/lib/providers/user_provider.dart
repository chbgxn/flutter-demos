import 'package:proxy_provider_cart/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  User? _currentUser;

  User? get currentUser => _currentUser;

  void loginIn(User user){
    _currentUser = user;
    notifyListeners();
  }

  void loginOut(){
    _currentUser = null;
    notifyListeners();
  }

}