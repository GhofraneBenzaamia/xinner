import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:xinner/Services/firestore_services.dart';
import 'package:xinner/control_view.dart';
import 'package:xinner/models/client_model.dart';
import 'package:xinner/utils/my_functions.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();
  final UserModel _loggedInUser = UserModel(
    email: "",
    phoneNumber: "",
    pic: "",
    userId: "",
    username: "",
    role: '',
  );
  void onInit() async {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
    if (_auth.currentUser == null) return;
    UserModel userModel = _loggedInUser.username == ""
        ? await FireStoreUser().getUser(FireStoreUser.getCurrentUser()!.uid)
        : _loggedInUser;
    _loggedInUser.setUser(userModel);
  }

  String? get user => _firebaseUser.value?.email;
  void signInWithEmailAndPassword(String email, String password) async {
    try {
      circularDialog();
      await _auth.signInWithEmailAndPassword(
          email: email ?? "", password: password ?? "");
      // _firebaseUser.value?.email = email;
      _loggedInUser.setUser(
          await FireStoreUser().getUser(FireStoreUser.getCurrentUser()!.uid));

      Get.offAll(() => ControlView());
    } on FirebaseException catch (e) {
      // ? close the dialog
      Get.back();
      switch (e.code) {
        default:
          snackBar(
              title: "Login Failed".tr,
              message: "Invalid Email or Password".tr);
      }
    }
  }

  void signOut() async {
    try {
      circularDialog();
      await _auth.signOut().then((value) {
        Get.deleteAll();
        Get.offAll(() => ControlView());
      });
    } catch (e) {}
  }
}
