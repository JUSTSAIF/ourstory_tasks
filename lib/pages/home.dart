import 'package:flutter/material.dart';
import 'nav.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: Center(
        child: Text(
          'There\'s Nothing Here ... 0w0',
          style: TextStyle(fontFamily: 'myFav1', fontSize: 20),
        ),
      ),
    );
  }
}
