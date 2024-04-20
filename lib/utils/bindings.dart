import 'package:get/get.dart';

import 'package:xinner/controllers/auth_controller.dart';

class DataBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
