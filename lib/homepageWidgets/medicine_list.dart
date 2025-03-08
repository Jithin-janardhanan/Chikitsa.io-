// import 'package:flutter/material.dart';

// class MedicationSchedule extends StatelessWidget {
//   const MedicationSchedule({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildTimeSection('Morning 08:00 am', [
//               _buildMedicineItem('Calpol 500mg Tablet', 'Before Breakfast', 'Day 01', 'taken'),
//               _buildMedicineItem('Calpol 500mg Tablet', 'Before Breakfast', 'Day 27', 'missed'),
//             ]),
//             const SizedBox(height: 16),
//             _buildTimeSection('Afternoon 02:00 pm', [
//               _buildMedicineItem('Calpol 500mg Tablet', 'After Food', 'Day 01', 'snoozed'),
//             ]),
//             const SizedBox(height: 16),
//             _buildTimeSection('Night 09:00 pm', [
//               _buildMedicineItem('Calpol 500mg Tablet', 'Before Sleep', 'Day 03', 'left'),
//             ]),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTimeSection(String title, List<Widget> medicineItems) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 8),
//         ...medicineItems,
//       ],
//     );
//   }

//   Widget _buildMedicineItem(String name, String timing, String day, String status) {
//     Color bgColor;
//     IconData iconData;
//     Color iconColor;

//     switch (status) {
//       case 'taken':
//         bgColor = Colors.pink.shade100;
//         iconData = Icons.check_circle_outline;
//         iconColor = Colors.green;
//         break;
//       case 'missed':
//         bgColor = Colors.blue.shade100;
//         iconData = Icons.highlight_off;
//         iconColor = Colors.red;
//         break;
//       case 'snoozed':
//         bgColor = Colors.purple.shade100;
//         iconData = Icons.snooze;
//         iconColor = Colors.orange;
//         break;
//       case 'left':
//         bgColor = Colors.red.shade100;
//         iconData = Icons.notifications_none;
//         iconColor = Colors.grey;
//         break;
//       default:
//         bgColor = Colors.grey.shade100;
//         iconData = Icons.circle_outlined;
//         iconColor = Colors.black54;
//     }

//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 3,
//             offset: const Offset(0, 1),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: bgColor,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Icon(iconData, color: bgColor, size: 20),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       timing,
//                       style: TextStyle(
//                         color: Colors.grey.shade600,
//                         fontSize: 13,
//                       ),
//                     ),
//                     Text(
//                       ' · $day',
//                       style: TextStyle(
//                         color: Colors.grey.shade600,
//                         fontSize: 13,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Icon(iconData, color: iconColor),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

enum StatusType {
  taken,
  missed,
  snoozed,
  left,
}

class MedicationSchedule extends StatelessWidget {
  const MedicationSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MedicationTimeSection(
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
            MedicationTimeSection(
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
            MedicationTimeSection(
              title: "Night 09:00 pm",
              medications: [
                MedicationInfo(
                  medicine: "Calpol 500mg Tablet",
                  timing: "Before Sleep",
                  day: "Day 03",
                  iconColor: Colors.red.shade100,
                  status: StatusType.left,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
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
      case StatusType.left:
        icon = Icons.notifications_none_outlined;
        color = Colors.grey;
        label = "Upcoming";
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
