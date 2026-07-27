import 'package:flutter/material.dart';
import 'package:tail/pages/home_page.dart';
import 'package:tail/pages/index.dart';
import 'package:tail/pages/reports_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  void _navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    OrderPage(),
    ClientPage(),
    ReportsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _navigationBottomBar,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: "orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_1),
            label: "client",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart),
            label: "reports",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
        ],
      ),
    );
  }
}
