import 'package:flutter/material.dart';
import 'package:show_my_location/show_my_location.dart';

void main() => runApp(const MyApp());

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: ShowMyLocation()
    );
  }
}