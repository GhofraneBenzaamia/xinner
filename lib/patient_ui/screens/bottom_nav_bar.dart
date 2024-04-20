import 'package:flutter/material.dart';
import 'package:xinner/authentication/screens/home.dart';
import 'package:xinner/patient_ui/screens/home.dart';
import 'package:xinner/patient_ui/screens/formulaire.dart';
import 'package:xinner/patient_ui/screens/notification_page.dart';
import 'package:xinner/patient_ui/screens/doctor.dart';
import 'package:xinner/patient_ui/screens/profile/UserSetting.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static List<Widget> _screens = <Widget>[
    HomePage(
      title: 'Yo',
    ),
    SettingPageUI(),
    NotificationScreen(),

    AppointScreen(),
    // NotificationScreen(),
  ];

  void _onItemTapped(int index) {
    debugPrint(index.toString());
    setState(() {
      switch (index) {
        case 0:
          // HomeScreen
          _selectedIndex = 0;
          break;
        case 1:
          // ProfileScreen
          _selectedIndex = 1;
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => SettingPageUI()),
          // );
          break;
        case 2:
          // NotificationScreen
          _selectedIndex = 2;
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => NotificationScreen()),
        // );
        // break;
        case 3:
          // AppointScreen
          _selectedIndex = 3;
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => AppointScreen()),
          // );
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
