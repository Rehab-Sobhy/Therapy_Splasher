import 'package:flutter/material.dart';
import 'package:therapy_splasher/add_medicine/add%20medicine.dart';
import 'package:therapy_splasher/home/home_screen.dart';
import 'package:therapy_splasher/notification_screen.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          HomeScreen(),
          AddMedicine(),
          NotificationScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alarm),
            label: 'My Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            label: 'Favorite',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
