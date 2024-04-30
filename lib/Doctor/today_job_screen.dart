import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xinner/Doctor/patient_details_page.dart';
import 'package:xinner/Doctor/patient_session_screen.dart';
import 'package:xinner/Doctor/patients_requests_screen.dart';
import 'package:xinner/models/appointement_model.dart';

class TodayJob extends StatefulWidget {
  const TodayJob({super.key});

  @override
  State<TodayJob> createState() => _TodayJobState();
}

class _TodayJobState extends State<TodayJob> {
  late Stream<DocumentSnapshot<Map<String, dynamic>>> _stream;

  List<Map<String, dynamic>> _patientsList = [];

  @override
  void initState() {
    super.initState();
    _fetchPatientsList(); // Fetch the initial list of patients
  }

  late int patientCount;
  void _fetchPatientsList() {
    FirebaseFirestore.instance
        .collection('forms')
        .where("status", isEqualTo: 3)
        .snapshots()
        .listen((snapshot) {
      List<Map<String, dynamic>> updatedList = [];
      for (var doc in snapshot.docs) {
        updatedList.add(doc.data());
      }
      setState(() {
        _patientsList = updatedList;
        patientCount = _patientsList.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _patientsList.isEmpty
        ? Center(child: Text('There is no patient appointements for today'))
        : Scaffold(
            appBar: AppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your today's Appointements"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Patients : $patientCount"),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemCount: _patientsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        right: 20, left: 20, bottom: 10, top: 10),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5)),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              _patientsList[index]['fullName'] ?? '',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PatientSessionScreen(
                                    patientData: AppointementModel.fromJson(
                                        _patientsList[index])),
                              ),
                            );
                          },
                        )),
                  );
                },
              ),
            ),
          );
  }
}
