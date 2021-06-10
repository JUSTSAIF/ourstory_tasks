import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String em = "";
  @override
  Widget build(BuildContext context) {
    setState(() {
      final route = ModalRoute.of(context);
      if (route != null) {
        var data = route.settings.arguments;
        if (data != null) {
          em = (data as Map)["email"].toString();
        }
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Task One | Done"),
        backgroundColor: Color.fromRGBO(128, 225, 209, 1),
        centerTitle: true,
      ),
      backgroundColor: Color.fromRGBO(120, 200, 200, 3),
      body: SafeArea(
          child: Center(
        child: Text(
          "Email : ${em}",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}
