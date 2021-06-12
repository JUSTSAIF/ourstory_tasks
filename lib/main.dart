import 'package:flutter/material.dart';
import 'package:notepad/pages/create.dart';
import 'package:notepad/pages/home.dart';
import 'package:notepad/pages/login.dart';
import 'package:notepad/pages/reg.dart';
import 'package:notepad/pages/update.dart';
import 'package:notepad/pages/view.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/home': (context) => Home(),
      '/login': (context) => Login(),
      '/reg': (context) => Register(),
      '/create': (context) => Create(),
      '/update': (context) => Update(),
      '/view': (context) => View(),
    },
  ));
}
