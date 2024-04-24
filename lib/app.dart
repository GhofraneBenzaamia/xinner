import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:xinner/authentication/screens/home.dart';
import 'package:xinner/authentication/screens/onbording_screen.dart';
import 'package:xinner/splash_screen';

import 'package:xinner/utils/constants/text_strings.dart';
import 'package:xinner/theme/theme.dart';
import 'package:xinner/authentication/screens/onbording_screen.dart';
import 'package:xinner/authentication/controlers/sign-up-controler.dart';
import 'package:xinner/patient_ui/screens/bottom_nav_bar.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // initialBinding: GeneralBindings(),
      home:SplashScreen());
      
  }
}