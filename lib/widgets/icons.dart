import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme.dart';

class FlameIcon extends StatelessWidget {
  const FlameIcon({super.key, this.size = 16, this.color = AppColors.flame});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _FlamePainter(color));
  }
}

class _FlamePainter extends CustomPainter {
  const _FlamePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path()
      ..moveTo(w * 0.50, h * 0.96)
      ..cubicTo(w * 0.12, h * 0.68, w * 0.08, h * 0.38, w * 0.40, h * 0.14)
      ..cubicTo(w * 0.42, h * 0.36, w * 0.55, h * 0.30, w * 0.58, h * 0.05)
      ..cubicTo(w * 0.96, h * 0.40, w * 0.88, h * 0.74, w * 0.50, h * 0.96)
      ..close();
    canvas.drawPath(path, Paint()..color = color);
    final inner = Path()
      ..moveTo(w * 0.50, h * 0.88)
      ..cubicTo(w * 0.34, h * 0.70, w * 0.38, h * 0.52, w * 0.50, h * 0.40)
      ..cubicTo(w * 0.58, h * 0.54, w * 0.66, h * 0.62, w * 0.50, h * 0.88)
      ..close();
    canvas.drawPath(inner, Paint()..color = AppColors.marker);
  }

  @override
  bool shouldRepaint(covariant _FlamePainter oldDelegate) =>
      oldDelegate.color != color;
}

class CheckIcon extends StatelessWidget {
  const CheckIcon({super.key, this.size = 22, this.color = AppColors.marker});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _CheckPainter(color));
  }
}

class _CheckPainter extends CustomPainter {
  const _CheckPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.16
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final path = Path()
      ..moveTo(size.width * 0.16, size.height * 0.52)
      ..lineTo(size.width * 0.40, size.height * 0.76)
      ..lineTo(size.width * 0.84, size.height * 0.24);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _CheckPainter oldDelegate) =>
      oldDelegate.color != color;
}

class CalendarIcon extends StatelessWidget {
  const CalendarIcon({super.key, this.size = 18});

  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: const _CalendarPainter(),
    );
  }
}

class _CalendarPainter extends CustomPainter {
  const _CalendarPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.ink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round;
    final body = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.08,
        size.height * 0.22,
        size.width * 0.84,
        size.height * 0.70,
      ),
      const Radius.circular(3),
    );
    canvas.drawRRect(body, paint);
    canvas.drawLine(
      Offset(size.width * 0.08, size.height * 0.42),
      Offset(size.width * 0.92, size.height * 0.42),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.30, size.height * 0.08),
      Offset(size.width * 0.30, size.height * 0.30),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.70, size.height * 0.08),
      Offset(size.width * 0.70, size.height * 0.30),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// The little tree that leans on the add button in the frames.
class TreeDoodle extends StatelessWidget {
  const TreeDoodle({super.key, this.size = 34});

  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: const _TreePainter());
  }
}

class _TreePainter extends CustomPainter {
  const _TreePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final tree = Path()
      ..moveTo(w * 0.50, h * 0.30)
      ..lineTo(w * 0.78, h * 0.56)
      ..lineTo(w * 0.64, h * 0.56)
      ..lineTo(w * 0.88, h * 0.84)
      ..lineTo(w * 0.12, h * 0.84)
      ..lineTo(w * 0.36, h * 0.56)
      ..lineTo(w * 0.22, h * 0.56)
      ..close();
    final fill = Paint()..color = AppColors.tree;
    final ink = Paint()
      ..color = AppColors.ink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeJoin = StrokeJoin.round;
    canvas.drawPath(tree, fill);
    canvas.drawPath(tree, ink);
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(w * 0.50, h * 0.90),
        width: w * 0.12,
        height: h * 0.10,
      ),
      Paint()..color = AppColors.ink,
    );
    final star = _star(Offset(w * 0.50, h * 0.16), w * 0.16, w * 0.07);
    canvas.drawPath(star, Paint()..color = AppColors.marker);
    canvas.drawPath(star, ink);
  }

  Path _star(Offset center, double outer, double inner) {
    final path = Path();
    for (var i = 0; i < 10; i++) {
      final radius = i.isEven ? outer : inner;
      final angle = -math.pi / 2 + i * math.pi / 5;
      final point = center + Offset(math.cos(angle), math.sin(angle)) * radius;
      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }
    return path..close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
