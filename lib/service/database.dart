import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DB {
  final users = FirebaseFirestore.instance.collection('users');
  // Create User Database
  void newUser(String? uid) async {
    try {
      await users.doc(uid).set({
        "uid": uid,
      });
    } catch (e) {
      Get.snackbar("Error", "Please Restart App");
    }
  }

  // Get User DB data
  getUser(String? uid) async {
    try {
      DocumentSnapshot u = await users.doc(uid).get();
      return u;
    } catch (e) {
      Get.snackbar("Error", "Please Restart App");
      return null;
    }
  }
}
