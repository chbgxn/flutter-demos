import 'package:avatar_replacement/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp()
    ),
  );
  EasyLoading.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.blue
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.white
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(Colors.black)
          )
        )
      ),
      home: HomeScreen(),
      builder: EasyLoading.init(),
    );
  }
}