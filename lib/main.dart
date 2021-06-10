import 'package:flutter/material.dart';
import 'pages/myProfile.dart';
import 'pages/quotes.dart';
import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/quotes': (context) => quotes(),
      '/myProfile': (context) => myProfile(),
      '/home': (context) => Home(),
    },
  ));
}
