import 'package:flutter/material.dart';
import 'package:theme_preference_riverpod/models/user.dart';
import 'package:theme_preference_riverpod/providers/user_provider.dart';
import 'package:theme_preference_riverpod/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final notifier = ref.read(userProvider.notifier);
        return Scaffold(
          appBar: AppBar(title: const Text('Please Login')),
          body: Center(
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    notifier.login(User(id: '000', name: 'Lily'));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => HomeScreen()),
                    );
                  },
                  child: const Text('Lily'),
                ),

                ElevatedButton(
                  onPressed: () {
                    notifier.login(User(id: '100', name: 'Alice'));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => HomeScreen()),
                    );
                  },
                  child: const Text('Alice'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}