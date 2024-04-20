import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xinner/patient_ui/screens/success.dart';
import 'package:get/get.dart';
import 'package:xinner/utils/my_functions.dart';

void submitForm({
  required String age,
  required String fullName,
  required String gender,
  required String phoneNumber,
  required String medicalPrescription,
  required String currentMedications,
  required String dateOfSymptoms,
  required String illnessesAndSurgeries,
  required String allergyHistory,
}) async {
  //? if prescription isn't provided, don't do anything
  // if (medicalPrescription == "") {
  //   snackBar(
  //       title: "Error",
  //       message: "You must upload your medical prescription",
  //       isError: true);
  //   return;
  // }
  // Create a map with the form data

  // Store the form data in Firestore
  CollectionReference appointments =
      FirebaseFirestore.instance.collection('forms');

  // Add the medical prescription URL along with other form data to Firestore
  await appointments.add({
    'fullName': fullName,
    'age': int.parse(age),
    'phoneNumber': phoneNumber,
    'medicalPrescriptionUrl': medicalPrescription, // Store the URL in Firestore
    'currentMedications': currentMedications,
    'dateOfSymptoms': dateOfSymptoms,
    'patientId': FirebaseAuth.instance.currentUser!.uid,
    'illnessesAndSurgeries': illnessesAndSurgeries,
    'allergyHistory': allergyHistory,
    'timestamp': FieldValue.serverTimestamp(),
    // Add other fields as needed
  }).then((value) {
    print("Form data added with ID: ${value.id}");

    // Show success message or navigate to a different screen
  }).catchError((error) {
    print("Error adding form data: $error");
    // Show error message or handle error accordingly
  });
}
