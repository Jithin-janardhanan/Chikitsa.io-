import 'package:flutter/material.dart';
import '../dashboard/report_page.dart';
import 'statusitem.dart';

class TodayReportCard extends StatelessWidget {
  const TodayReportCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color.fromARGB(255, 2, 129, 233);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Report",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              StatusItem(count: "5", label: "Total", color: blueColor),
              StatusItem(count: "3", label: "Taken", color: blueColor),
              StatusItem(count: "1", label: "Missed", color: blueColor),
              StatusItem(count: "1", label: "Snoozed", color: blueColor),
            ],
          ),
        ],
      ),
    );
  }
}