import 'package:shopping_cart_provider/models/user.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  User? user;
  final List<String> _items = [];

  CartProvider({this.user});

  List<String>? get items => _items;
  
  void addItem(String item){
    _items.add(item);
    notifyListeners();
  }
}