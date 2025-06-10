import 'package:proxy_provider_cart/screen/cart_screen.dart';
import 'package:proxy_provider_cart/models/user.dart';
import 'package:proxy_provider_cart/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.read<UserProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: Center(
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                userProvider.loginIn(
                  User(id: '001', name: 'Mike')
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => CartScreen()),
                );
              },
              child: const Text('Mike'),
            ),
            ElevatedButton(
              onPressed: () {
                userProvider.loginIn(
                  User(id: '002', name: 'Alice')
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => CartScreen()),
                );
              },
              child: const Text('Alice'),
            )
          ],
        ),
      ),
    );
  }
}
