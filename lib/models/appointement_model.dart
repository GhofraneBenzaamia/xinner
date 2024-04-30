import 'package:cloud_firestore/cloud_firestore.dart';

class AppointementModel {
  late int? age;
  late String? id;
  late String? patientId;
  late String? fullName;
  late String? gender;
  late String? phoneNumber;
  late String? medicalPrescription;
  late String? currentMedications;
  late String? dateOfSymptoms;
  late String? illnessesAndSurgeries;
  late String? allergyHistory;
  late DateTime? appointmentDate;
  late int? patients;
  late int? price;
  late int? status;
  late String? fileName;

  String? reasonForRefuse;
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

  bool isSelected() {
    if (status == 3) {
      return true;
    }
    return false;
  }

  bool isRefused() {
    if (status == 2) {
      return true;
    }
    return false;
  }

  AppointementModel.fromJson(dynamic map) {
    if (map == null) {
      return;
    }
    age = map['age'];
    fullName = map['fullName'];
    gender = map['gender'];
    id = map['id'];
    patientId = map['patientId'];
    status = map['status'];
    phoneNumber = map['phoneNumber'];
    medicalPrescription = map['medicalPrescriptionUrl'];
    currentMedications = map['currentMedications'];
    dateOfSymptoms = map['dateOfSymptoms'];
    appointmentDate = (status == 0 || status == 3 || status == 2)
        ? null
        : map['appointmentDate'].toDate();
    illnessesAndSurgeries = map['illnessesAndSurgeries'];
    allergyHistory = map['allergyHistory'];
    patients = map['patients'];
    price = map['price'];

    fileName = map['fileName'];
    reasonForRefuse = map['reasonForRefuse'];
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
