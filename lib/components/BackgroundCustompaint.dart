import 'package:flutter/material.dart';

class BackgroundCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color.fromARGB(255, 96, 181, 250);

    final bluePath = Path();
    bluePath.moveTo(0, 0);
    bluePath.lineTo(size.width * 0.76, 0); // 0.72 + 0.04

    bluePath.quadraticBezierTo(
      size.width * 0.74,
      size.height * 0.05, // 0.7 + 0.04
      size.width * 0.72,
      size.height * 0.1, // 0.68 + 0.04
    );
    bluePath.quadraticBezierTo(
      size.width * 0.70,
      size.height * 0.15,
      size.width * 0.68,
      size.height * 0.2,
    );
    bluePath.quadraticBezierTo(
      size.width * 0.66,
      size.height * 0.25,
      size.width * 0.64,
      size.height * 0.3,
    );
    bluePath.quadraticBezierTo(
      size.width * 0.62,
      size.height * 0.35,
      size.width * 0.60,
      size.height * 0.4,
    );
    bluePath.quadraticBezierTo(
      size.width * 0.58,
      size.height * 0.45,
      size.width * 0.54,
      size.height * 0.5,
    );
    bluePath.quadraticBezierTo(
      size.width * 0.58,
      size.height * 0.55,
      size.width * 0.60,
      size.height * 0.6,
    );
    bluePath.quadraticBezierTo(
      size.width * 0.62,
      size.height * 0.65,
      size.width * 0.64,
      size.height * 0.7,
    );
    bluePath.quadraticBezierTo(
      size.width * 0.66,
      size.height * 0.75,
      size.width * 0.68,
      size.height * 0.8,
    );
    bluePath.quadraticBezierTo(
      size.width * 0.70,
      size.height * 0.85,
      size.width * 0.72,
      size.height * 0.9,
    );
    bluePath.quadraticBezierTo(
      size.width * 0.74,
      size.height * 0.95,
      size.width * 0.76,
      size.height,
    );

    bluePath.lineTo(0, size.height);
    bluePath.close();

    canvas.drawPath(bluePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
