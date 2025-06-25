/*
- [EN] Animation Loaded on Progress Bar
- Introductions:
- Created a progress bar that continuously loops from start to finish.

- [ZH] 进度条加载的动画
- 介绍：
- 做了一个从开始到结束不断循环的条形进度条。

- Author: chbgxn
*/

import 'package:flutter/material.dart';

class ProgressAnimation extends StatefulWidget {
  const ProgressAnimation({super.key});

  @override
  State<ProgressAnimation> createState() => _ProgressAnimationState();
}

class _ProgressAnimationState extends State<ProgressAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progress;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this
    )..repeat();

    _progress = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() =>setState(() {})
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('进度条动画')),
      body: Center(
        child: SizedBox(
          height: 30,
          width: MediaQuery.of(context).size.width / 2,
          child: LinearProgressIndicator(
            value: _progress.value,
          ),
        ),
      ),
    );
  }
}
