import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart_riverpod/providers/cart_provider.dart';
import 'package:shopping_cart_riverpod/providers/user_provider.dart';
import 'package:shopping_cart_riverpod/screens/login_screen.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(userProvider);
    final cart = ref.watch(cartProvider(currentUser!));
    final notifier = ref.read(cartProvider(currentUser).notifier);
    return Scaffold(
      appBar: AppBar(title: Text('Cart of ${currentUser.name} (Riverpod)')),
      body: Center(
        child: Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return UnconstrainedBox(
                    child: Text(cart.items[index])
                  );
                },
              ),
            ),
            OutlinedButton(
              onPressed: () =>notifier.addItem('new item'), 
              child: Text('add')
            ),
            OutlinedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen())
              ),
              child: Text('Log Out')
            ),
          ],
        )
      ),
    );
  }
}