import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bottombar extends StatefulWidget {
  Bottombar({Key? key}) : super(key: key);

  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Text("Dashboard"),
    const Text("Customers"),
    const Text("Ledger"),
    const Text("Logout"),
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
        selectedItemColor: Colors.purple[300],
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
            icon: Icon(Icons.people_outlined),
            activeIcon: Icon(Icons.people_rounded),
            tooltip: "Customers",
            label: "Customers",
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
