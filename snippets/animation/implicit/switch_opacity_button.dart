/*
- [EN] Switch Opacity
- Introductions:
- An implicit animation component AnimatedOpacity was used to switch opacity.

- [ZH] 切换不透明度
- 介绍：
- 使用了隐式动画组件 AnimatedOpacity 实现切换不透明度。

- Author: chbgxn
*/

import 'package:flutter/material.dart';

class SwitchOpacityButton extends StatefulWidget {
  const SwitchOpacityButton({super.key});

  @override
  State<SwitchOpacityButton> createState() => _SwitchOpacityButtonState();
}

class _SwitchOpacityButtonState extends State<SwitchOpacityButton> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("切换不透明度")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              child: FlutterLogo(size: 100),
            ),

            SizedBox(height: 16),

            ElevatedButton(
              onPressed:() => setState(() {
                _opacity = _opacity == 1.0 ? 0.3 : 1.0;
              }),
              child: Text('切换不透明度'),
            ),
          ],
        ),
      ),
    );
  }
}
