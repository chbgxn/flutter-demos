/*
- [EN] Breathable Button
- Introductions:
- A square can automatically increase its size from 0.5 times to 1.5 times, 
then decrease to 0.5 times, and so on, making it looks like breathing.

- [ZH] 呼吸按钮
- 介绍：
- 一个正方形可以自动将其大小从0.5倍增加到1.5倍，然后减小到0.5倍，如此循环反复，看起来就像在呼吸。

- Author: @chbgxn
*/

import 'package:flutter/material.dart';

class BreathableButton extends StatefulWidget {
  const BreathableButton({super.key});

  @override
  State<BreathableButton> createState() => _BreathableButtonState();
}

class _BreathableButtonState extends State<BreathableButton> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this
    )..repeat(reverse:true);

    _animation = Tween(begin: 0.5, end: 1.5).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('呼吸按钮')),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(8)
            ),
          ),
        ),
      ),
    );
  }
}