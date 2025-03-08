
import 'dart:ui';

import 'package:flutter/material.dart';

import '../reportpagewidgets/checkhistory.dart';
import '../reportpagewidgets/dashboardcard.dart';
import '../reportpagewidgets/medication.dart';
import '../reportpagewidgets/todayreport.dart';
import '../reportpagewidgets/weekday.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Report',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const TodayReportCard(),
                const SizedBox(height: 16),
                const DashboardCard(),
                const SizedBox(height: 16),
                const CheckHistoryHeader(),
                const SizedBox(height: 16),
                const WeekdaySelector(),
                const SizedBox(height: 24),
                const MedicationTimeSection(
                  title: "Morning 08:00 am",
                  medications: [
                    MedicationInfo(
                      medicine: "Calpol 500mg Tablet",
                      timing: "Before Breakfast",
                      day: "Day 01",
                      iconColor: Color.fromARGB(255, 168, 141, 210),
                      status: StatusType.taken,
                    ),
                    MedicationInfo(
                      medicine: "Calpol 500mg Tablet",
                      timing: "Before Breakfast",
                      day: "Day 27",
                      iconColor: Color(0xFFD1C4E9), // purple.shade100 equivalent
                      status: StatusType.missed,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const MedicationTimeSection(
                  title: "Afternoon 02:00 pm",
                  medications: [
                    MedicationInfo(
                      medicine: "Calpol 500mg Tablet",
                      timing: "After Food",
                      day: "Day 01",
                      iconColor: Color.fromARGB(255, 160, 131, 214),
                      status: StatusType.snoozed,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatusIndicator extends StatelessWidget {
  final StatusType status;

  const StatusIndicator({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color color;
    String label;

    switch (status) {
      case StatusType.taken:
        icon = Icons.notifications_none_outlined;
        color = Colors.green;
        label = "Taken";
        break;
      case StatusType.missed:
        icon = Icons.notifications_none_outlined;
        color = Colors.red;
        label = "Missed";
        break;
      case StatusType.snoozed:
        icon = Icons.notifications_active_outlined;
        color = Colors.orange;
        label = "Snoozed";
        break;
    }

    return Column(
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: color,
          ),
        ),
      ],
    );
  }
}

enum StatusType {
  taken,
  missed,
  snoozed,
}


class IsometricBoxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
   
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..style = PaintingStyle.fill;
    
    // Draw a simple box as placeholder
    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.2);
    path.lineTo(size.width * 0.8, size.height * 0.35);
    path.lineTo(size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width * 0.2, size.height * 0.35);
    path.close();
    
    canvas.drawPath(path, paint);
    
    // Top face
    final topPath = Path();
    topPath.moveTo(size.width * 0.5, size.height * 0.2);
    topPath.lineTo(size.width * 0.8, size.height * 0.35);
    topPath.lineTo(size.width * 0.5, size.height * 0.5);
    topPath.lineTo(size.width * 0.2, size.height * 0.35);
    topPath.close();
    
    final topPaint = Paint()
      ..color = Colors.blue.withOpacity(0.7)
      ..style = PaintingStyle.fill;
    
    canvas.drawPath(topPath, topPaint);
    
    // Right face
    final rightPath = Path();
    rightPath.moveTo(size.width * 0.8, size.height * 0.35);
    rightPath.lineTo(size.width * 0.8, size.height * 0.65);
    rightPath.lineTo(size.width * 0.5, size.height * 0.8);
    rightPath.lineTo(size.width * 0.5, size.height * 0.5);
    rightPath.close();
    
    final rightPaint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..style = PaintingStyle.fill;
    
    canvas.drawPath(rightPath, rightPaint);
    
    // Left face
    final leftPath = Path();
    leftPath.moveTo(size.width * 0.5, size.height * 0.5);
    leftPath.lineTo(size.width * 0.2, size.height * 0.35);
    leftPath.lineTo(size.width * 0.2, size.height * 0.65);
    leftPath.lineTo(size.width * 0.5, size.height * 0.8);
    leftPath.close();
    
    final leftPaint = Paint()
      ..color = Colors.blue.withOpacity(0.3)
      ..style = PaintingStyle.fill;
    
    canvas.drawPath(leftPath, leftPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}