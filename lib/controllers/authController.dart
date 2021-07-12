import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/service/database.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  DB db = DB();
  User? get user => _auth.currentUser;
  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Get.offAllNamed('/home');
      } else {
        Get.offAllNamed('/welcome');
      }
    });
    super.onInit();
  }

  // User Registration Method
  createUser(String name, String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password)
          .then((value) =>
              {user?.updateDisplayName(name).then((value) => db.newUser(name))})
          .then((u) => {
                Get.snackbar(
                  "Registration Success",
                  'Welcome ' + name,
                  backgroundColor: Colors.greenAccent[100],
                  snackPosition: SnackPosition.BOTTOM,
                )
              });
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Registration Failed",
        e.message.toString(),
        backgroundColor: Colors.redAccent[100],
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return true;
  }

  // User Login Method
  login(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email.trim(), password: password)
          .whenComplete(() => {
                if (user != null)
                  {
                    Get.snackbar(
                      "Login Success",
                      'Welcome ${user?.displayName}',
                      backgroundColor: Colors.greenAccent[100],
                      snackPosition: SnackPosition.BOTTOM,
                    ),
                  }
              });
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Login Failed",
        e.message.toString(),
        backgroundColor: Colors.redAccent[100],
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return true;
  }

  // User Logout
  void logout() async {
    try {
      await _auth.signOut().whenComplete(() => {
            Get.snackbar(
              "Logout",
              "𝑺𝑨𝒀𝑶𝑵𝑨𝑹𝑨",
              backgroundColor: Colors.greenAccent[100],
              snackPosition: SnackPosition.BOTTOM,
            ),
          });
      Get.offNamed('/welcome');
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Logout Failed",
        e.message.toString(),
        backgroundColor: Colors.redAccent[100],
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  String checkLogin() {
    if (user != null) {
      return '/home';
    }
    return '/welcome';
  }
}
