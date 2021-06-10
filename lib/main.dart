import 'package:flutter/material.dart';
import 'package:uitask/pages/home.dart';
import 'package:uitask/pages/login.dart';
import 'package:uitask/pages/reg.dart';
import 'package:uitask/pages/welcome.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/welcome',
    routes: {
      '/welcome': (context) => Welcome(),
      '/reg': (context) => Reg(),
      '/login': (context) => Login(),
      '/home': (context) => Home(),
    },
  ));
}
