import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_provider/providers/cart_provider.dart';
import 'package:shopping_cart_provider/providers/user_provider.dart';
import 'package:shopping_cart_provider/screens/login_screen.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>UserProvider()),
        ChangeNotifierProxyProvider<UserProvider, CartProvider>(
          create: (_) => CartProvider(),
          update: (_, userProvider, __) => CartProvider(user: userProvider.currentUser)
        )
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen()
    );
  }
}