import 'package:flutter/material.dart';
import 'empty_box.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: CustomPaint(
                size: const Size(100, 100),
                painter: IsometricBoxPainter(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Nothing Is Here, Add a Medicine',
            style: TextStyle(
              color: Colors.black45,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}