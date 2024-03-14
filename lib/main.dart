import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xinner/app.dart';
import 'package:xinner/firebase_options.dart';


 // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) =>Get.put(AuthenticationRepository()));
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(App());
}



