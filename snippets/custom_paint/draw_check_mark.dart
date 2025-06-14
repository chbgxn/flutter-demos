/*
- [EN] Stroke Animation
- Introductions:
- Implemented a check mark using CustomPainter and added an animation for the ticking action.

- [CN] 打勾动画
- 介绍：
- 使用 CustomPainter 实现绘制对号，并添加了打勾的动画。

- Author: chbgxn
*/

import 'package:flutter/material.dart';

class DrawCheckMark extends StatefulWidget {
  const DrawCheckMark({super.key});

  @override
  State<DrawCheckMark> createState() => _DrawCheckMarkState();
}

class _DrawCheckMarkState extends State<DrawCheckMark> with SingleTickerProviderStateMixin{
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =  AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('打勾动画')),
      body: Center(
        child: CustomPaint(
          painter: AnimatedPathPainter(animation: _animationController),
          size: const Size(200, 200),  
        ) 
      )
    );
  }
}

class AnimatedPathPainter extends CustomPainter {
  final Animation<double> animation;
  AnimatedPathPainter({required this.animation}):super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..color = Colors.lightGreenAccent
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(100, 100), size.width/2, circlePaint);

    final pathPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, 100)
      ..lineTo(100, 180)
      ..lineTo(182, 47);
    
    final metrics = path.computeMetrics();

    for(final metric in metrics){
      final pathSegment = metric.extractPath(
        0.0,
        metric.length * animation.value
      );
      canvas.drawPath(pathSegment, pathPaint);
    }
  }

  @override
  bool shouldRepaint(AnimatedPathPainter oldDelegate){
    return oldDelegate.animation != animation;
  }

  @override
  bool shouldRebuildSemantics(AnimatedPathPainter oldDelegate) => false;
}
