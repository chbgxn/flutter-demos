import 'package:flutter/material.dart';
import 'package:theme_preference_demo/screens/home_screen.dart';
import 'package:theme_preference_demo/providers/user_provider.dart';
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
                userProvider.loginIn('000');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                );
              },
              child: const Text('Rex'),
            ),

            ElevatedButton(
              onPressed: () {
                userProvider.loginIn('001');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                );
              },
              child: const Text('Bree'),
            )
          ],
        ),
      ),
    );
  }
}