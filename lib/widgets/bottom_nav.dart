import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,

      type: BottomNavigationBarType.fixed,

      backgroundColor: Colors.white,

      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,

      selectedFontSize: 11,
      unselectedFontSize: 10,

      elevation: 8,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.history_outlined),
          activeIcon: Icon(Icons.history),
          label: 'History',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt_outlined),
          activeIcon: Icon(Icons.camera_alt),
          label: 'Scan',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.eco_outlined),
          activeIcon: Icon(Icons.eco_outlined),
          label: 'Crops',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}