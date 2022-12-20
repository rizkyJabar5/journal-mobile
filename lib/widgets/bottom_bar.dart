import 'package:flutter/material.dart';
import 'package:journal_florist/screens/store.dart';
import 'package:journal_florist/screens/signout.dart';

import '../screens/ledger.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    LedgerPage(),
    SignOut(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.deepPurple[400],
        unselectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.space_dashboard_outlined),
            activeIcon: Icon(Icons.space_dashboard_rounded),
            tooltip: "Dashboard",
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart_outlined),
            activeIcon: Icon(Icons.monitor_heart),
            tooltip: "Ledger",
            label: "Ledger",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout_rounded),
            tooltip: "Logout",
            label: "Logout",
          ),
        ],
      ),
    );
  }
}
