import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

Widget ChangeStatusBarColor({Color color = Colors.white}) {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color));
  return SizedBox();
}
