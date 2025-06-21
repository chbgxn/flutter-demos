import 'package:shopping_cart_provider/screens/login_screen.dart';
import 'package:shopping_cart_provider/providers/cart_provider.dart';
import 'package:shopping_cart_provider/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final cartProvider = context.watch<CartProvider>();

    return Scaffold(
     appBar: AppBar(title: Text('Cart of ${userProvider.currentUser?.name} (Provider)')),
      body: Center(
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            cartProvider.items!.isEmpty
              ? const Text('Empty')
              : SizedBox.shrink(),
            
            ...cartProvider.items!.map((item) => Text(item)),

            ElevatedButton(
              onPressed: () => cartProvider.addItem('New Item'),
              child: const Text('Add Item'),
            ),

            ElevatedButton(
              onPressed: (){
                userProvider.loginOut();
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (_) => LoginScreen())
                );
              },
              child: const Text('Log Out'),
            ),
          ],
        ),
      )
    );
  }
}