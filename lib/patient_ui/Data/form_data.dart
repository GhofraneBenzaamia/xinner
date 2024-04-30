import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xinner/Services/firestore_services.dart';
import 'package:xinner/patient_ui/screens/success.dart';
import 'package:get/get.dart';

void submitForm(
    {required String fileNme,
    required String uid,
    required String age,
    required String fullName,
    required String gender,
    required String phoneNumber,
    required String medicalPrescription,
    required String currentMedications,
    required String dateOfSymptoms,
    required String illnessesAndSurgeries,
    required String allergyHistory,
    required File file}) async {
  // Create a map with the form data

  // Store the form data in Firestore
  CollectionReference appointments =
      FirebaseFirestore.instance.collection('forms');
  // await appointments.add({'id': "sss"});
  // Add the medical prescription URL along with other form data to Firestore
  String? persp = await FireStoreUser()
      .uploadImage(photo: file, destination: "Prescription");
  String id = await appointments.doc().id;
  await appointments.doc(id).set({
    'gender': gender,
    'fileName': fileNme,
    'id': id,
    'fullName': fullName,
    'age': int.parse(age),
    'phoneNumber': phoneNumber,
    'medicalPrescriptionUrl': persp, // Store the URL in Firestore
    'currentMedications': currentMedications,
    'dateOfSymptoms': dateOfSymptoms,
    'illnessesAndSurgeries': illnessesAndSurgeries,
    'allergyHistory': allergyHistory,
    'appointmentDate': "",
    'createdAt': FieldValue.serverTimestamp(),
    'patientId': FireStoreUser.getCurrentUser()!.uid,
    'status': 0
  });
}
