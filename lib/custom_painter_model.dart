import 'package:flutter/material.dart';

class Chart extends CustomPainter {
  final double firstPercent;
  final double secondPercent;
  final double thirdPercent;

  Chart({
    required this.firstPercent,
    required this.secondPercent,
    required this.thirdPercent,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 20
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final mildinePaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke;

    final width1 = size.width * firstPercent / 100;
    final width2 = size.width * secondPercent / 100;
    final width3 = size.width * thirdPercent / 100;

    if (firstPercent == 0) {
      return;
    } else {
      canvas.drawLine(
        Offset(0, size.height / 2),
        Offset(width1, size.height / 2),
        paint,
      );
    }
    if (secondPercent == 0) {
      return;
    } else {
      canvas.drawLine(
        Offset(width1 + width2, size.height / 2),
        Offset(width1 + width2 + width3, size.height / 2),
        paint..color = Colors.blue,
      );
    }

    if (thirdPercent == 0) {
      return;
    } else {
      canvas.drawLine(
        Offset(width1, size.height / 2),
        Offset(width1 + width2, size.height / 2),
        mildinePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
