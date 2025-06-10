import 'package:proxy_provider_cart/screen/login_screen.dart';
import 'package:proxy_provider_cart/providers/cart_provider.dart';
import 'package:proxy_provider_cart/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final cart = context.watch<CartProvider>();

    return Scaffold(
     appBar: AppBar(title: Text('${userProvider.currentUser?.name}的购物车')),
      body: Center(
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            cart.items!.isEmpty
              ? const Text('购物车为空')
              : SizedBox.shrink(),
            
            ...cart.items!.map((item) => Text(item)),

            ElevatedButton(
              onPressed: () => cart.addItem('商品${cart.items!.length + 1}'),
              child: const Text('添加商品'),
            ),

            ElevatedButton(
              onPressed: (){
                userProvider.loginOut();
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (_)=> LoginScreen())
                );
              },
              child: const Text('退出登录'),
            ),
          ],
        ),
      )
    );
  }
}