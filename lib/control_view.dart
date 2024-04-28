import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xinner/assistante_ui/AboutPatientAss.dart';

import 'package:xinner/authentication/screens/login_screen.dart';
import 'package:xinner/controllers/auth_controller.dart';
import 'package:xinner/patient_ui/screens/bottom_nav_bar.dart';

class ControlView extends GetWidget<AuthController> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ! check if user is already logged in or not
    return Obx(
      () {
        return (Get.find<AuthController>().user == null)
            ? const LoginScreen()
            :
            // what role is the user
            BottomNavBar();
      },
    );
  }
}
