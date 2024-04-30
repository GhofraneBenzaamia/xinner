import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:xinner/app.dart';
import 'package:xinner/firebase_options.dart';
import 'package:xinner/utils/bindings.dart';

// await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) =>Get.put(AuthenticationRepository()));

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // FlutterAppBadger.updateBadgeCount(1);

  debugPrint("MESSAGE : " + message.notification!.body.toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  DataBindings().dependencies();
  runApp(App());
}
