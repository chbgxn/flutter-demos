import 'package:flutter/material.dart';

class FadeButton extends StatefulWidget {
  const FadeButton({super.key});

  @override
  State<FadeButton> createState() => _FadeButtonState();
}

class _FadeButtonState extends State<FadeButton> {
  final double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('切换透明度')),
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
              child: const Text('切换透明度'),
            ),
          ],
        ),
      ),
    );
  }
}
