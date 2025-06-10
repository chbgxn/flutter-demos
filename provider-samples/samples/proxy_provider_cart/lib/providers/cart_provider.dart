import 'package:proxy_provider_cart/models/user.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  User? user;
  final List<String> _items = [];

  List<String>? get items => _items;
  
  void addItem(String item){
    _items.add(item);
    notifyListeners();
  }
}