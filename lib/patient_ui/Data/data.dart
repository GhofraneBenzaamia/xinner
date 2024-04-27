

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xinner/doctor_ui/main_screen.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart'; 
import 'package:firebase_storage/firebase_storage.dart';



class DoctorScreenn extends StatefulWidget {
  @override
  State <StatefulWidget> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State <DoctorScreenn>{

late Stream<DocumentSnapshot<Map<String, dynamic>>> _stream;

  List<Map<String, dynamic>> _patientsList = [];

  @override
  void initState() {
    super.initState();
    _fetchPatientsList(); // Fetch the initial list of patients
  }

  void _fetchPatientsList() {
    FirebaseFirestore.instance.collection('forms').snapshots().listen((snapshot) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Screen'),
      ),
      body: _patientsList.isEmpty
          ? Center(child: Text('No patients available'))
          : ListView.builder(
              itemCount: _patientsList.length,
              itemBuilder: (context, index) {

                return Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20 , bottom: 10, top:10),
                  child: Container(decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(5)),
                  child: 
                   ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only( left : 8.0),
                      child: Text(_patientsList[index]['fullName'] ?? '', style: TextStyle(fontSize: 10),),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientDetailsScreen(patientData: _patientsList[index]),
                        ),
                      );
                    },
                  )),
                );
              },
            ),
    );
  }
}

class PatientDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> patientData;
 // final  selectedFileName= patientData['allergyHistory']; 

   PatientDetailsScreen({Key? key, required this.patientData}) : super(key: key);
  
  Future<String?> getFileNameFromFirestore(String patientId) async {
    try {
      // Replace 'forms' with your actual Firestore collection name
      var snapshot = await FirebaseFirestore.instance
          .collection('forms')
          .doc(patientId) // Assuming 'patientId' is the document ID where the file name is stored
          .get();

      if (snapshot.exists) {
        var data = snapshot.data()!;
        return data['file_name'];
      } else {
        return null; // Document not found
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
//    String? fileName = await getFileNameFromFirestore(patientData['id']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          
          ListTile(
            title: Text('Full Name'),
            subtitle: Text(patientData['fullName'] ?? ''),
          ),
          ListTile(
            title: Text('Age'),
            subtitle: Text(patientData['age']?.toString() ?? ''),
          ),
          ListTile(
            title: Text('Allergy History'),
            subtitle: Text(patientData['allergyHistory'] ?? ''),
          ),
          ListTile(
            title: Text('Current Medications'),
            subtitle: Text(patientData['currentMedications'] ?? ''),
          ),
           
                    ElevatedButton(
  onPressed: () async {
    String? fileName = await getFileNameFromFirestore(patientData['id']);
    if (fileName != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MedicalFileViewScreen(
            patientId: patientData['id'],
            filName: fileName,
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('File name not found in Firestore.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  },
  child: Text('View Medical File'),
),

          // Add more ListTile widgets for other patient details as needed
        ],
      ),
    );
  }
}


class MedicalFileViewScreen extends StatelessWidget {
  final String patientId;
  final String filName;
  const MedicalFileViewScreen({Key? key, required this.patientId, required this.filName}) : super(key: key);
  
  Future<String> getFileUrlFromStorage(String selectedFile) async {
    final storageRef = FirebaseStorage.instance.ref();
   // final file = selectedFile;
   final fileRef = storageRef.child("medicalFiles/$patientId"); // Adjust file path as needed
    final downloadUrl = await fileRef.getDownloadURL();
    return downloadUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical File'),
      ),
      body: FutureBuilder<String>(
        future: getFileUrlFromStorage(filName), // Assuming the file is in PDF format
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No PDF file available'));
          } else {
            return PDFView(
              filePath: snapshot.data!,
              onPageChanged: (int? page, int? total) {
                print('page change: $page/$total');
              },
              onViewCreated: (PDFViewController pdfViewController) {
                // You can use the pdfViewController for additional functionalities
              },
            
            );
          }
        },
      ),
    );
  }
}
