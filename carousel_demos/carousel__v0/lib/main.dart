import 'package:flutter/material.dart';
import 'widgets/carousel_v0.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("轮播图_V0_Author: @DevGalaxyCh")),
        body: CarouselV0(),
      ),
    );
  }
}
