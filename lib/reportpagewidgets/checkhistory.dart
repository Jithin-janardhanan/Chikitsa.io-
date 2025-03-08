import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckHistoryHeader extends StatelessWidget {
  const CheckHistoryHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Check History",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Icon(Icons.chevron_right, color: Colors.grey.shade400),
      ],
    );
  }
}