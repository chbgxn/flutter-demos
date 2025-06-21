import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart_riverpod/models/user.dart';
import 'package:shopping_cart_riverpod/providers/user_provider.dart';
import 'package:shopping_cart_riverpod/screens/cart_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Please Login')),
      body: Center(
        child: Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedButton(
              onPressed: (){
                ref.read(userProvider.notifier).state = User(id: '100', name: 'Jack');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen())
                );
              },
              child: Text('Jack')
            ),
            OutlinedButton(
              onPressed: (){
                ref.read(userProvider.notifier).state = User(id: '200', name: 'Alice');
                Navigator.pushReplacement( 
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen())
                );
              },
              child: Text('Alice')
            )
          ],
        ),
      )
    );
  }
}