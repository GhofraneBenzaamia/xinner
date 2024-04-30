import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:xinner/models/appointement_model.dart';
import 'package:xinner/utils/constants/my_constants.dart';
import 'package:xinner/widgets/custom_text_field_widget.dart';

class PatientSessionScreen extends StatelessWidget {
  final AppointementModel patientData;
  // final  selectedFileName= patientData['allergyHistory'];

  PatientSessionScreen({Key? key, required this.patientData}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  Future<String?> getFileNameFromFirestore(String patientId) async {
    try {
      // Replace 'forms' with your actual Firestore collection name
      var snapshot = await FirebaseFirestore.instance
          .collection('forms')
          .doc(
              patientId) // Assuming 'patientId' is the document ID where the file name is stored
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

  late String price;
//    String? fileName = await getFileNameFromFirestore(patientData['id']);
  bool urgetCase = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding, vertical: kVerticalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Full Name'),
                subtitle: Text(patientData.fullName ?? ''),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Age'),
                subtitle: Text(patientData.age?.toString() ?? ''),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Allergy History'),
                subtitle: Text(patientData.allergyHistory ?? ''),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Current Medications'),
                subtitle: Text(patientData.currentMedications ?? ''),
              ),

              ElevatedButton(
                onPressed: () async {
                  Get.dialog(
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Container(
                        decoration: kButtonBoxDecoration.copyWith(
                          color: Colors.black,
                          image: DecorationImage(
                            image:
                                NetworkImage(patientData.medicalPrescription!),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            color: kPrimaryColor,
                            margin: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text('View Patient Prescription'),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 20,
              ),

              // Add more ListTile widgets for other patient details as needed
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin:
            EdgeInsets.symmetric(horizontal: kHorizontalPadding, vertical: 50),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.green),
          ),
          onPressed: () async {
            FirebaseFirestore.instance
                .collection('forms')
                .doc(patientData.id)
                .update({
              'status': 4,
            });
            Get.back();
          },
          child: Text('Session is Done'),
        ),
      ),
    );
  }
}

// class CheckBoxWidget extends StatefulWidget {
//   const CheckBoxWidget({super.key, required this.isSelected});
//   final bool isSelected;

//   @override
//   State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
// }

// class _CheckBoxWidgetState extends State<CheckBoxWidget> {
//   bool isSelected = false;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text("Urgent Case"),
//         Checkbox(value: isSelected, onChanged: (val) {})
//       ],
//     );
//   }
// }

class MedicalFileViewScreen extends StatelessWidget {
  final String patientId;
  final String filName;
  const MedicalFileViewScreen(
      {Key? key, required this.patientId, required this.filName})
      : super(key: key);

  Future<String> getFileUrlFromStorage(String selectedFile) async {
    final storageRef = FirebaseStorage.instance.ref();
    // final file = selectedFile;
    final fileRef = storageRef
        .child("medicalFiles/$patientId"); // Adjust file path as needed
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
        future: getFileUrlFromStorage(
            filName), // Assuming the file is in PDF format
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
