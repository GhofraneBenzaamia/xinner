import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:xinner/authentication/screens/home.dart';
import 'package:xinner/patient_ui/screens/doctor_ui.dart';
import 'package:xinner/patient_ui/screens/assistant-ui.dart';
import 'package:xinner/patient_ui/screens/home.dart';

Future<void> checkUserRole(User? user) async {
  if (user != null) {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    if (userDoc.exists) {
      print("user id exixts ");
      Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?; // Casting to Map<String, dynamic>
      if (userData != null && userData.containsKey('role')) {
        String? userRole = userData['role'];
        if (userRole != null) {
          print("navigation donnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnne££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££");
          navigateBasedOnRole(userRole);
        } else {
          print("'role' field is null or missing in data") ;
        }
      } else {
       print("'role' field is missing in document") ;
      }
    } else {
    print("user document doesn't exist"); 
    }
  } else {
    print("another errrrorooo");
}
}
  
void navigateBasedOnRole (String? role) async{
  switch (role) {
    case 'doctor':
     Get.to(DoctorUi());
      break;
    case 'patient':
      Get.to(HomePage());
      break;
    case 'assistant':
      Get.to(HomeScreen());
      break;  

    default:
      // Handle unknown user role
      break;
  }
}
Future checkkUserRole(User? user) async {
   
    if (user != null) {
        // Get the user's ID token result
        IdTokenResult idTokenResult = await user.getIdTokenResult();

        // Access custom claims directly from the ID token result
        String? userRole = idTokenResult.claims?['role'];

        // Use the user's role for role-based navigation or access control
        navigateBasedOnRole(userRole);
    } else {
        // Handle unauthenticated user
    }
}