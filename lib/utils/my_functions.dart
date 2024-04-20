import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xinner/utils/constants/colors.dart';

Future<dynamic> circularDialog() {
  return Get.dialog(
    const Center(
      child: CircularProgressIndicator(),
    ),
    barrierDismissible: false,
  );
}

SnackbarController snackBar(
    {required String title,
    required String message,
    Color titleColor = Colors.white,
    bool isError = false,
    SnackPosition snackPosition = SnackPosition.BOTTOM}) {
  return Get.snackbar("", '',
      backgroundColor: isError ? Colors.red : Colors.green,
      borderRadius: 20,
      titleText: Text(
        title.tr,
        textAlign: TextAlign.center,
        style: TextStyle(color: titleColor, fontSize: 18),
      ),
      messageText: Text(
        message.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      snackPosition: snackPosition,
      colorText: Colors.black,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10));
}
