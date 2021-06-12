import 'package:flutter/material.dart';
import 'package:notepad/pages/nav.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  String title = "Loading Title ...";
  String note = "Loading Note ...";
  @override
  Widget build(BuildContext context) {
    setState(() {
      final route = ModalRoute.of(context);
      if (route != null) {
        var data = route.settings.arguments;
        if (data != null) {
          title = (data as Map)["title"].toString();
          note = (data as Map)["note"].toString();
        }
      }
    });

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Nav(),
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Note'),
        shadowColor: Colors.black,
        elevation: 100,
        backgroundColor: Colors.grey[600],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: Colors.teal[200],
            ),
            alignment: Alignment.topCenter,
            child: SelectableText(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.teal[400],
              ),
              alignment: Alignment.topLeft,
              child: SelectableText(
                note,
                style: TextStyle(
                    fontSize: 20,
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, -5))
                    ],
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red[300],
                    decorationThickness: 4,
                    decorationStyle: TextDecorationStyle.dashed,
                    fontFamily: 'BalooTammudu2'),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
