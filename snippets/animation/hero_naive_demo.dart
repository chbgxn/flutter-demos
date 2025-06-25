/*
- [EN] Hero Animation
- Introductions:
- An naive Hero animation for personal learning.

- [ZH] Hero 动画
- 介绍：
- 一个简单的 Hero 动画，用于个人学习。

- Author: chbgxn
*/

import 'package:flutter/material.dart';

class HeroNaiveDemo extends StatelessWidget {
  const HeroNaiveDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('页面1')),
      body: Center(
        child: GestureDetector(
          onTap:() => Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>const NewPage())
          ),
          child: Hero(
            tag: 'img_example', 
            child: Image.asset('assets/images/example.jpg', height: 100),
          ),
        )
        
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('页面2')),
      body: Center(
        child: Hero(
          tag: 'img_example',  
          child: Image.asset('assets/images/example.jpg', height: 300),
        ),
      ),
    );
  }
}
