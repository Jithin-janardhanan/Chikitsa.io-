import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../dashboard/report_page.dart';

class MedicationTimeSection extends StatelessWidget {
  final String title;
  final List<MedicationInfo> medications;

  const MedicationTimeSection({
    Key? key,
    required this.title,
    required this.medications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        ...medications.map((medication) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: MedicationCard(
                medicine: medication.medicine,
                timing: medication.timing,
                day: medication.day,
                iconColor: medication.iconColor,
                status: medication.status,
              ),
            )),
      ],
    );
  }
}

class MedicationInfo {
  final String medicine;
  final String timing;
  final String day;
  final Color iconColor;
  final StatusType status;

  const MedicationInfo({
    required this.medicine,
    required this.timing,
    required this.day,
    required this.iconColor,
    required this.status,
  });
}

class MedicationCard extends StatelessWidget {
  final String medicine;
  final String timing;
  final String day;
  final Color iconColor;
  final StatusType status;

  const MedicationCard({
    Key? key,
    required this.medicine,
    required this.timing,
    required this.day,
    required this.iconColor,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.water_drop,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicine,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      timing,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      day,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          StatusIndicator(status: status),
        ],
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