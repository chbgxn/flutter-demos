import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_preference_riverpod/providers/theme_provider.dart';
import 'package:theme_preference_riverpod/providers/user_provider.dart';
import 'package:theme_preference_riverpod/screens/login_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final currrentUser = ref.watch(userProvider);
        final themeState = ref.watch(themeProvider(currrentUser.id));
        return MaterialApp(
          theme: themeState ? ThemeData.light() : ThemeData.dark(),
          home: LoginScreen()
        );
      },
    );
  }
}
