
import 'dart:ui';

import 'package:flutter/material.dart';

class IsometricBoxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final fillPaint = Paint()
      ..color = Colors.black54
      ..style = PaintingStyle.fill;

    // Draw the isometric box
    final boxWidth = size.width * 0.7;
    final boxHeight = size.height * 0.6;
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Draw the box sides
    final path = Path();
    
    // Top rhombus
    path.moveTo(centerX - boxWidth / 2, centerY - boxHeight / 4);
    path.lineTo(centerX, centerY - boxHeight / 2);
    path.lineTo(centerX + boxWidth / 2, centerY - boxHeight / 4);
    path.lineTo(centerX, centerY);
    path.close();
    
    // Bottom sides
    path.moveTo(centerX - boxWidth / 2, centerY - boxHeight / 4);
    path.lineTo(centerX - boxWidth / 2, centerY + boxHeight / 4);
    path.lineTo(centerX, centerY + boxHeight / 2);
    path.lineTo(centerX + boxWidth / 2, centerY + boxHeight / 4);
    path.lineTo(centerX + boxWidth / 2, centerY - boxHeight / 4);
    
    // Connect bottom
    path.moveTo(centerX, centerY);
    path.lineTo(centerX, centerY + boxHeight / 2);
    
    // Top diamond fill
    final diamondPath = Path();
    diamondPath.moveTo(centerX - boxWidth / 2, centerY - boxHeight / 4);
    diamondPath.lineTo(centerX, centerY - boxHeight / 2);
    diamondPath.lineTo(centerX + boxWidth / 2, centerY - boxHeight / 4);
    diamondPath.lineTo(centerX, centerY);
    diamondPath.close();
    
    canvas.drawPath(diamondPath, fillPaint);
    canvas.drawPath(path, paint);
    
    // Draw the swirly/curly lines
    final swirlyPath1 = Path();
    swirlyPath1.moveTo(centerX - boxWidth / 8, centerY - boxHeight / 1.8);
    swirlyPath1.quadraticBezierTo(
      centerX - boxWidth / 20, centerY - boxHeight * 0.8, 
      centerX + boxWidth / 8, centerY - boxHeight * 0.7
    );
    
    final swirlyPath2 = Path();
    swirlyPath2.moveTo(centerX + boxWidth / 4, centerY - boxHeight / 2);
    swirlyPath2.quadraticBezierTo(
      centerX + boxWidth / 2, centerY - boxHeight * 0.8, 
      centerX + boxWidth / 1.6, centerY - boxHeight * 0.7
    );
    
    // Add small circles at the ends of swirly lines
    final circlePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
      
    canvas.drawCircle(
      Offset(centerX - boxWidth / 8, centerY - boxHeight / 1.8), 
      2, 
      circlePaint
    );
    
    canvas.drawCircle(
      Offset(centerX + boxWidth / 8, centerY - boxHeight * 0.7), 
      2, 
      circlePaint
    );
    
    canvas.drawCircle(
      Offset(centerX + boxWidth / 4, centerY - boxHeight / 2), 
      2, 
      circlePaint
    );
    
    canvas.drawCircle(
      Offset(centerX + boxWidth / 1.6, centerY - boxHeight * 0.7), 
      2, 
      circlePaint
    );
    
    canvas.drawPath(swirlyPath1, paint);
    canvas.drawPath(swirlyPath2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}