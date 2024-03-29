import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:xinner/authentication/screens/home.dart';
import 'package:xinner/patient_ui/screens/doctor_ui.dart';
import 'package:xinner/patient_ui/screens/assistant-ui.dart';

Future<String?> getUserRole(User? user) async{

  try{
    DocumentSnapshot userSnapshot = await  FirebaseFirestore .instance.collection("users").doc(user!.uid).get();
    if(userSnapshot.exists){
       Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;
        if (userData != null) {
          String? role = userData['role'];
          return role;
        }
    }
  }catch(e){
  print('Error getting user role: $e');
    return null;
  }}

void CheckUserRole(User? user) async{
if (user != null){
  String? role = await  getUserRole(user);

  if(role == "doctor") {
    Get.off(DoctorUi());
  } else if (role == 'patient'){ Get.off(HomePage());}
  else if(role == "assistant"){Get.off(AssistantrUi());}
}
}