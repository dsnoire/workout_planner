import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'bottom_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;

  void _onTap(int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/workouts');
        break;
      case 2:
        context.go('/statistics');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
          _onTap(value);
        },
        elevation: 0,
        backgroundColor: Colors.transparent,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            activeIcon: BottomNavigationBarItemIcon(
              path: 'assets/icons/home_filled.svg',
              color: Colors.black,
            ),
            icon: BottomNavigationBarItemIcon(
              path: 'assets/icons/home.svg',
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: BottomNavigationBarItemIcon(
              path: 'assets/icons/workout_filled.svg',
              color: Colors.black,
            ),
            icon: BottomNavigationBarItemIcon(
              path: 'assets/icons/workout.svg',
            ),
            label: 'Workouts',
          ),
          BottomNavigationBarItem(
            activeIcon: BottomNavigationBarItemIcon(
              path: 'assets/icons/statistics.svg',
              color: Colors.black,
            ),
            icon: BottomNavigationBarItemIcon(
              path: 'assets/icons/statistics.svg',
            ),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}
