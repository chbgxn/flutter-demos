import 'package:flutter/material.dart';
import 'package:theme_preference_demo/screens/login_screen.dart';
import 'package:theme_preference_demo/providers/theme_mode_provider.dart';
import 'package:theme_preference_demo/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModeProvider = context.watch<ThemeModeProvider>();
    final userProvider = context.read<UserProvider>();
    final currentUser = userProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () => themeModeProvider.lightMode(), 
            icon: Icon(Icons.light_mode)
          ),
          IconButton(
            onPressed: () => themeModeProvider.darkMode(), 
            icon: Icon(Icons.dark_mode)
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            currentUser!=null
              ?Text('Hello, ${currentUser.name}')
              :SizedBox.shrink(),
            OutlinedButton(
              onPressed: (){
                userProvider.loginOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen())
                );
              },
              child: const Text('退出')
            )
          ],
        ),
      )
    );
  }
}