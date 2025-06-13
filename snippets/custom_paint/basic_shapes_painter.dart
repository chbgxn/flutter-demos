/*
- [EN] Control the Display and Disappearance of AppBar
- Introductions:
- use CustomPaint to draw basic graphics, including rectangle, rounded rectangle, 
circle, ellipse, point, line, path, and text.

- [CN] 使用 CustomPaint 绘制基本图形
- 介绍：
- 使用 CustomPaint 绘制基本图形，包括矩形、圆角矩形、圆形、椭圆、点、线、路径、文字。

- Author: chbgxn
*/

import 'dart:ui';
import 'package:flutter/material.dart';

class BasicShapesPainter extends StatelessWidget {
  const BasicShapesPainter ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('绘制基本图形')),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('正方形'),
              CustomPaint(
                painter: SquarePainter(),
                size: const Size(200, 200),
              ),
              SizedBox(height: 16),

              const Text('圆角矩形'),
              CustomPaint(
                painter: RRectPainter(),
                size: const Size(200, 200),
              ),
              SizedBox(height: 16),

              const Text('圆形'),
              CustomPaint(
                painter: CirclePainter(),
                size: const Size(200, 200),
              ),
              SizedBox(height: 16),

              const Text('椭圆'),
              CustomPaint(
                painter: OvalPainter(),
                size: const Size(200, 200),
              ),
              SizedBox(height: 16),

              const Text('绘制点'),
              CustomPaint(
                painter: DotPainter(),
                size: const Size(200, 200),
              ),
              SizedBox(height: 16),

              const Text('绘制线'),
              CustomPaint(
                painter: LinePainter(),
                size: const Size(200, 200),
              ),
              SizedBox(height: 16),

              const Text('绘制路径'),
              CustomPaint(
              painter: PathPainter(),
              size: const Size(200, 200),
              ),
              SizedBox(height: 16),

              const Text('绘制文字'),
              CustomPaint(
                painter: MyTextPainter(),
                size: const Size(200, 200),
              )
            ],  
          ),
        ),        
      ),
    );
  }
}

class SquarePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.fill;
    
    const rect = Rect.fromLTWH(0, 0, 200, 200);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(SquarePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SquarePainter oldDelegate) => false;
}

class RRectPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepOrange
      ..style = PaintingStyle.fill;
    
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, 200, 200),
      Radius.circular(8)
    );

    canvas.drawRRect(rect, paint);
  }

  @override
  bool shouldRepaint(RRectPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics( RRectPainter oldDelegate) => false;
}

class CirclePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    
    final center = Offset(size.width/2, size.height/2);
    final radius = size.width/2;

    canvas.drawCircle(center, radius, paint);

  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CirclePainter oldDelegate) => false;
}

class OvalPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    final rect = Rect.fromLTWH(0, 0, 200, 100);

    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(OvalPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(OvalPainter oldDelegate) => false;
}

class DotPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10;
    
    canvas.drawPoints(
      PointMode.points, 
      [
        Offset(10, 10),
        Offset(30, 30),
        Offset(50, 50),
        Offset(90, 90),
        Offset(150, 150),
        Offset(200, 200)
      ],
      paint
    );
  }

  @override
  bool shouldRepaint(DotPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(DotPainter oldDelegate) => false;
}

class LinePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5;

    canvas.drawLine(Offset(10, 10), Offset(150, 150), paint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(LinePainter oldDelegate) => false;
}

class PathPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5;

    var path = Path();
    path.moveTo(50, 50);
    path.lineTo(100, 100);
    path.lineTo(200, 50);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(PathPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(PathPainter oldDelegate) => false;
}

class MyTextPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: 'chbgxn',
        style: TextStyle(
          color: Colors.black,
          fontSize: 40,
          fontWeight: FontWeight.bold
        )
      ),
      textDirection: TextDirection.ltr
    )
      ..layout(
        minWidth: 0,
        maxWidth: size.width
      );

    final offset = Offset(
      (size.width - textPainter.width)/2,
      (size.height - textPainter.height)/2,
    );

    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(MyTextPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyTextPainter oldDelegate) => false;
}