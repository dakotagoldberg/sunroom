import 'package:flutter/material.dart';
import 'package:sunroom/screens/home_screen.dart';
import 'package:sunroom/screens/profile_screen.dart';

import '../screens/explore_screen.dart';

class BottomTabs extends StatefulWidget {
  final int index;
  const BottomTabs({
    super.key,
    required this.index,
  });

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    ExploreScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    _selectedIndex = widget.index;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: _widgetOptions[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.travel_explore_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: 'Home',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Color(0xFFFFF3F6),
            selectedIconTheme: const IconThemeData(
              size: 34,
              color: Color(0xFFFF909C),
            ),
            unselectedIconTheme: const IconThemeData(
              size: 28,
              color: Color(0xFFD8C1C4),
            ),
          ),
        ));
  }
}
