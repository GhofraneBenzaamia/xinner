import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
        foregroundColor: Colors.greenAccent,
        shape: CircleBorder(),
        elevation: 5,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Set the background color to white
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!, // Set the shadow color to light grey
              blurRadius: 12,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: BottomAppBar(
          elevation: 0,
          notchMargin: 6.0,
          shape: CircularNotchedRectangle(),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: bottomNavItems.map((item) {
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  item["icon"],
                  size: item["size"],
                  color: Colors.black45,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> bottomNavItems = [
  {"icon": Icons.home_outlined, "size": 30.0},
  {"icon": Icons.info_outline, "size": 30.0},
  {"icon": Icons.notifications_none, "size": 30.0},
  {"icon": Icons.person_outline_rounded, "size": 30.0},
];
