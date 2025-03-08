import 'package:flutter/material.dart';

class WeekdaySelector extends StatelessWidget {
  const WeekdaySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        WeekDayItem(day: "SUN", date: "1", isSelected: true),
        WeekDayItem(day: "MON", date: "2", isSelected: false),
        WeekDayItem(day: "TUE", date: "3", isSelected: false),
        WeekDayItem(day: "WED", date: "4", isSelected: false),
        WeekDayItem(day: "THU", date: "5", isSelected: false),
        WeekDayItem(day: "FRI", date: "6", isSelected: false),
      ],
    );
  }
}

class WeekDayItem extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;

  const WeekDayItem({
    Key? key,
    required this.day,
    required this.date,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.shade400 : Colors.grey.shade100,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              date,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}