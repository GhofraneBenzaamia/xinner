import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:xinner/Doctor/patient_details_page.dart';
import 'package:xinner/models/appointement_model.dart';
import 'package:xinner/utils/constants/my_constants.dart';

class PatientRequest extends StatefulWidget {
  const PatientRequest({super.key});

  @override
  State<PatientRequest> createState() => _PatientRequestState();
}

class _PatientRequestState extends State<PatientRequest> {
  Future<void> setAppointements() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('forms')
        .where('status', isEqualTo: 1)
        .get();

    final List<DocumentSnapshot<Map<String, dynamic>>> documents =
        snapshot.docs.where((doc) => doc.exists).toList();
    print(documents.length);
    // Sort documents by urgency
    documents.sort((a, b) =>
        (b.data()?['isUrgent'] ? 1 : 0) - (a.data()?['isUrgent'] ? 1 : 0));

    // Update documents status to 3 and set appointmentDate
    DateTime tomorrow = DateTime.now().add(Duration(days: 1));
    DateTime appointmentTime =
        DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 8, 0);

    for (int i = 0; i < documents.length; i++) {
      String docId = documents[i].id;
      await FirebaseFirestore.instance.collection('forms').doc(docId).update({
        'status': 1,
        'appointmentDate': appointmentTime,
      });

      // Increment appointment time by 30 minutes for next document
      appointmentTime = appointmentTime.add(Duration(minutes: 30));
    }
  }

  List<Map<String, dynamic>> _patientsList = [];

  @override
  void initState() {
    super.initState();
    _fetchPatientsList(); // Fetch the initial list of patients
  }

  void _fetchPatientsList() {
    FirebaseFirestore.instance
        .collection('forms')
        .where("status", isNotEqualTo: 3)
        .snapshots()
        .listen((snapshot) {
      List<Map<String, dynamic>> updatedList = [];
      for (var doc in snapshot.docs) {
        updatedList.add(doc.data());
      }
      setState(() {
        _patientsList = updatedList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _patientsList.isEmpty
        ? Center(child: Text('No appointement requests available'))
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Incoming Appointement Requests",
              ),
            ),
            body: ListView.builder(
              itemCount: _patientsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, bottom: 10, top: 10),
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppointementModel.fromJson(
                                      _patientsList[index])
                                  .isRefused()
                              ? Colors.red
                              : AppointementModel.fromJson(_patientsList[index])
                                      .isSelected()
                                  ? Colors.green
                                  : Colors.amber,
                          border: Border.all(
                              width: 2,
                              color: AppointementModel.fromJson(
                                          _patientsList[index])
                                      .isSelected()
                                  ? Colors.green
                                  : Colors.transparent),
                          borderRadius: BorderRadius.circular(5)),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            _patientsList[index]['fullName'] ?? '',
                            style: TextStyle(
                                fontSize: 10,
                                color: AppointementModel.fromJson(
                                            _patientsList[index])
                                        .isRefused()
                                    ? Colors.white
                                    : AppointementModel.fromJson(
                                                _patientsList[index])
                                            .isSelected()
                                        ? Colors.white
                                        : Colors.black),
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward,
                          color:
                              AppointementModel.fromJson(_patientsList[index])
                                      .isSelected()
                                  ? Colors.white
                                  : Colors.black,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PatientDetailsScreen(
                                  patientData: AppointementModel.fromJson(
                                      _patientsList[index])),
                            ),
                          );
                        },
                      )),
                );
              },
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding, vertical: kVerticalPadding),
              child: ElevatedButton(
                onPressed: () {
                  setAppointements();
                },
                child: Text("Confirm Tomorrow's Appointements"),
              ),
            ),
          );
  }
}
