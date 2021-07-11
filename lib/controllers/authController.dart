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
  void createUser(String name, String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password)
          .then((u) => {
                Get.snackbar(
                  "Registration Success",
                  'Welcome ${user?.displayName}',
                  backgroundColor: Colors.greenAccent[100],
                  snackPosition: SnackPosition.BOTTOM,
                )
              })
          .whenComplete(() => {
                user
                    ?.updateDisplayName(name)
                    .then((value) => db.newUser(user?.uid))
                    .then((value) => {Get.toNamed('/home')})
              });
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Registration Failed",
        e.message.toString(),
        backgroundColor: Colors.redAccent[100],
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // User Login Method
  void login(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email.trim(), password: password)
          .whenComplete(() => {
                Get.snackbar(
                  "Login Success",
                  'Welcome ${user?.displayName}',
                  backgroundColor: Colors.greenAccent[100],
                  snackPosition: SnackPosition.BOTTOM,
                ),
                // Get.offNamed('/home')
              });
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Login Failed",
        e.message.toString(),
        backgroundColor: Colors.redAccent[100],
        snackPosition: SnackPosition.BOTTOM,
      );
    }
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
