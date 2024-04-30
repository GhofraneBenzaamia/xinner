import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:xinner/models/client_model.dart';
import 'package:xinner/utils/my_functions.dart';

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

  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } on FirebaseException catch (_) {
      snackBar(
          title: "Error",
          message: "Error while uploading files",
          isError: true);
      return null;
    }
  }

  UploadTask? task;
  Future<String?> uploadImage({File? photo, String? destination}) async {
    print("PHOTO");
    print(photo?.path);
    if (photo == null) return null;
    final fileName = photo.path.split('/').last;
    task = FireStoreUser.uploadFile('$destination/$fileName', photo);
    if (task == null) return null;
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    return urlDownload;
  }
}
