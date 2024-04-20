import 'package:flutter/material.dart';
import 'package:xinner/patient_ui/screens/home.dart';
import 'package:xinner/patient_ui/screens/formulaire.dart';
import 'package:xinner/patient_ui/screens/notification_page.dart';
import 'package:xinner/patient_ui/screens/doctor.dart';
import 'package:xinner/patient_ui/screens/profile/UserSetting.dart';

class Navigation_Bar extends StatefulWidget {
  const Navigation_Bar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<Navigation_Bar> {
  int _selectedIndex = 0;

  static List<Widget> _screens = <Widget>[
    HomeScreen(),
   SettingPageUI(),
    formulaire(),
    AppointScreen(),
    NotificationScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          // HomeScreen
          _selectedIndex = index;
          break;
        case 1:
          // ProfileScreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingPageUI()),
          );
          break;
        case 2:
          // NotificationScreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationScreen()),
          );
          break;
        case 3:
          // AppointScreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AppointScreen()),
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => formulaire()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
        foregroundColor: Colors.greenAccent,
        shape: CircleBorder(),
        elevation: 5,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
