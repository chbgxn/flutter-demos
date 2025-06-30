import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_preference_riverpod/providers/theme_provider.dart';
import 'package:theme_preference_riverpod/providers/user_provider.dart';
import 'package:theme_preference_riverpod/screens/login_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(userProvider);
    final userNotifier = ref.read(userProvider.notifier);
    
    final themeNotifier = ref.read(themeProvider(currentUser.id).notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () => themeNotifier.toLight(), 
            icon: Icon(Icons.light_mode)
          ),
          IconButton(
            onPressed: () => themeNotifier.toDark(), 
            icon: Icon(Icons.dark_mode)
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Text('Hello, ${currentUser.name}'),
              
            OutlinedButton(
              onPressed: (){
                userNotifier.logOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen())
                );
              },
              child: const Text('Log Out')
            )
          ],
        ),
      )
    );
  }
}