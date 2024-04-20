import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:xinner/models/client_model.dart';

class FireStoreUser {
  String kNoUserUrlPicture =
      "https://firebasestorage.googleapis.com/v0/b/joperapp-48265.appspot.com/o/Users%2FR.png?alt=media&token=1f944333-ee05-4670-9640-ee794fd69752";
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<UserModel> getUser(String id) async {
    UserModel user = UserModel(
        email: "Unknown".tr,
        phoneNumber: "0000",
        pic: kNoUserUrlPicture,
        userId: null,
        username: "Unknown User".tr,
        role: '');

    await _userCollectionRef.doc(id).get().then((value) {
      if (value.exists) {
        user = UserModel.fromJson(value.data() as Map);
      }
    });
    return user;
  }

  static User? getCurrentUser() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return auth.currentUser;
  }
}
