import 'package:cloud_firestore/cloud_firestore.dart';

class AppointementModel {
  late String age;
  late String patientId;
  late String fullName;
  late String gender;
  late String phoneNumber;
  late String medicalPrescription;
  late String currentMedications;
  late String dateOfSymptoms;
  late String illnessesAndSurgeries;
  late String allergyHistory;
  AppointementModel({
    required this.age,
    required this.fullName,
    required this.gender,
    required this.phoneNumber,
    required this.medicalPrescription,
    required this.currentMedications,
    required this.dateOfSymptoms,
    required this.illnessesAndSurgeries,
    required this.patientId,
    required this.allergyHistory,
  });

  AppointementModel.fromJson(Map<dynamic, dynamic> map) {
    age = map['age'];
    fullName = map['fullname'];
    gender = map['gender'];
    patientId = map['patientId'];
    phoneNumber = map['phoneNumber'];
    medicalPrescription = map['medicalPrescriptionUrl'];
    currentMedications = map['currentMedications'];
    dateOfSymptoms = map['dateOfSymptoms'];
    illnessesAndSurgeries = map['illnessesAndSurgeries'];
    allergyHistory = map['allergyHistory'];
  }

  toJson() {
    return {
      'age': age,
      'patientId': patientId,
      'fullname': fullName,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'medicalPrescriptionUrl': medicalPrescription,
      'currentMedications': currentMedications,
      'dateOfSymptoms': dateOfSymptoms,
      'illnessesAndSurgeries': illnessesAndSurgeries,
      'allergyHistory': allergyHistory,
      'createdAt': FieldValue.serverTimestamp()
    };
  }
}
