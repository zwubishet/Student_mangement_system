import 'package:flutter/material.dart';

class BlueBackgroundCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blue;

    final bluePath = Path();
    bluePath.moveTo(0, 0); // Top-left corner
    bluePath.lineTo(size.width * 0.7, 0);

    bluePath.quadraticBezierTo(
      size.width * 0.68,
      size.height * 0.05,
      size.width * 0.66,
      size.height * 0.1,
    );
    bluePath.quadraticBezierTo(
      size.width * 0.64,
      size.height * 0.15,
      size.width * 0.62,
      size.height * 0.2,
    );
    bluePath.quadraticBezierTo(
      size.width * 0.60,
      size.height * 0.25,
      size.width * 0.58,
      size.height * 0.3,
    );
    bluePath.quadraticBezierTo(
      size.width * 0.56,
      size.height * 0.35,
      size.width * 0.54,
      size.height * 0.4,
    );

    bluePath.quadraticBezierTo(
      size.width * 0.52,
      size.height * 0.45,
      size.width * 0.50,
      size.height * 0.5,
    );

    bluePath.quadraticBezierTo(
      size.width * 0.52,
      size.height * 0.55,
      size.width * 0.54,
      size.height * 0.6,
    );

    bluePath.quadraticBezierTo(
      size.width * 0.56,
      size.height * 0.65,
      size.width * 0.58,
      size.height * 0.7,
    );

    bluePath.quadraticBezierTo(
      size.width * 0.6,
      size.height * 0.75,
      size.width * 0.62,
      size.height * 0.8,
    );

    bluePath.quadraticBezierTo(
      size.width * 0.64,
      size.height * 0.85,
      size.width * 0.66,
      size.height * 0.9,
    );

    bluePath.quadraticBezierTo(
      size.width * 0.68,
      size.height * 0.95,
      size.width * 0.7,
      size.height,
    );

    bluePath.lineTo(0, size.height); // Bottom-left
    bluePath.close(); // Close the path to form a shape

    canvas.drawPath(bluePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
