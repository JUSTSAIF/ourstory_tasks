import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/bindings/root_binding.dart';
import 'package:todo/controllers/authController.dart';
import 'package:todo/pages/home.dart';
import 'package:todo/pages/login.dart';
import 'package:todo/pages/profile.dart';
import 'package:todo/pages/register.dart';
import 'package:todo/pages/welcome.dart';

void main() async {
  // initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Run App
  runApp(GetMaterialApp(
    initialBinding: RootBinding(),
    title: "Todo !",
    initialRoute: AuthController().checkLogin(),
    getPages: [
      GetPage(name: '/welcome', page: () => Welcome()),
      GetPage(name: '/login', page: () => Login()),
      GetPage(name: '/register', page: () => Register()),
      GetPage(name: '/home', page: () => Home()),
      GetPage(name: '/profile', page: () => Profile())
    ],
  ));
}
