import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart_riverpod/models/cart_notifier.dart';
import 'package:shopping_cart_riverpod/models/cart_state.dart';
import 'package:shopping_cart_riverpod/models/user.dart';

final cartProvider = StateNotifierProvider.family<CartNotifier, CartState, User>((ref, user){
  return CartNotifier();
});