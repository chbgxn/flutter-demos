import 'package:flutter/material.dart';
import 'package:theme_preference_demo/screens/login_screen.dart';
import 'package:theme_preference_demo/providers/theme_mode_provider.dart';
import 'package:theme_preference_demo/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProxyProvider<UserProvider, ThemeModeProvider>(
          create: (_) => ThemeModeProvider(),
          update: (context, userProvider, _) => ThemeModeProvider(user: userProvider.user)
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
    final themeModeProvider = context.watch<ThemeModeProvider>();
    return MaterialApp(
      theme: themeModeProvider.themeMode! ? ThemeData.dark() : ThemeData.light(),
      home: LoginScreen(),
    );
  }
}