import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xinner/patient_ui/screens/formulaire.dart';

// Doctor Screen Widget
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Screen'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('forms').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No forms available'));
          }

          List<Map<String, dynamic>> patientList = [];
          snapshot.data!.docs.forEach((document) {
            // Extract patient data from the document and add it to the patientList
            Map<String, dynamic> patientData = {
              'fullName': document.data()!['fullName'],
              //  'age': document.data()!['age'],
              // Add other patient data fields as needed
            };
            patientList.add(patientData);
          });

          return ListView.builder(
            itemCount: patientList.length,
            itemBuilder: (context, index) {
              // Display each patient as a ListTile
              return ListTile(
                title: Text(patientList[index]['fullName']),
                textColor: Colors.black,
                // You can also display the patient's photo here if available
                onTap: () {
                  // Navigate to the form details screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PatientFormDetailsScreen(patient: patientList[index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// Patient Form Details Screen Widget
class PatientFormDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> patient;

  const PatientFormDetailsScreen({required this.patient});

  @override
  Widget build(BuildContext context) {
    // Extract form data from the patient map
    // String fullName = patient['fullName'];
    // String dateOfSymptoms = patient['dateOfSymptoms'];
    // Extract other form fields as needed

    return Scaffold(
      appBar: AppBar(
        title: Text('Form Details - '),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name'),
            Text('dateOfSymptoms:'),
            // Display other form fields here
          ],
        ),
      ),
    );
  }
}
