import 'package:flutter/material.dart';
import 'package:xinner/Doctor/patients_requests_screen.dart';
import 'package:xinner/Doctor/today_job_screen.dart';

class DoctorMainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorMainScreen> {
  List<Widget> _screens = [
    TodayJob(),
    PatientRequest(),
  ];
  int _selectedScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreen,
        onTap: (index) {
          setState(() {
            _selectedScreen = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_information),
            label: 'Patients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Requests',
          ),
        ],
      ),
    );
  }
}
