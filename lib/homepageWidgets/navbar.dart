import 'dart:ui';
import 'package:adhicine/dashboard/empty_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dashboard/report_page.dart';
import '../medicine_add.dart';
import 'navbar_items.dart'; // Import your ReportScreen

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const ReportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavBarItemWidget(
                icon: Icons.home,
                label: 'Home',
                isSelected: _currentIndex == 0,
                onTap: () => _changePage(0),
              ),
              NavBarItemWidget(
                icon: Icons.bar_chart,
                label: 'Report',
                isSelected: _currentIndex == 1,
                onTap: () => _changePage(1),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddMedicineScreen()),
            );
          },
          backgroundColor: Colors.black,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
