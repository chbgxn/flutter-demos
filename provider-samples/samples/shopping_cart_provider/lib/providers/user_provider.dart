import 'package:flutter/material.dart';
import 'package:shopping_cart_provider/models/user.dart';

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