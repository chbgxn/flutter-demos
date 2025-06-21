import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart_riverpod/models/cart_state.dart';

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier(): super(CartState());

  void addItem(String item){
    state = state.copyWith(items: [...state.items, item]);
  }
}