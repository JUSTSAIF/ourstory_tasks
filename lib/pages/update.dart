import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notepad/pages/nav.dart';
import 'package:flutter/services.dart';
import 'package:notepad/pages/onii.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController title = new TextEditingController();
  TextEditingController note = new TextEditingController();
  var noteId;

  @override
  Widget build(BuildContext context) {
    setState(() {
      final route = ModalRoute.of(context);
      if (route != null) {
        var data = route.settings.arguments;
        print(data);
        if (data != null) {
          title.text = (data as Map)["title"].toString();
          note.text = (data as Map)["note"].toString();
          noteId = (data as Map)["id"].toString();
        }
      }
    });
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Edit Note"),
          shadowColor: Colors.black,
          elevation: 100,
          backgroundColor: Colors.grey[600],
        ),
        drawer: Nav(),
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: title,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Title',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: TextField(
                  controller: note,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1000),
                  ],
                  maxLines: 23,
                  decoration: InputDecoration(
                    hintText: "my note ...",
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 14),
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () async {
                    if (note.text.isNotEmpty && title.text.isNotEmpty) {
                      await FirebaseFirestore.instance
                          .collection("data")
                          .doc(noteId)
                          .update({
                        'title': title.text,
                        'note': note.text,
                      });
                      Navigator.pushNamed(context, '/home');
                    } else {
                      Onii().Alert("The note cannot be empty !!", context);
                    }
                  },
                  child: Text("Update",
                      style: TextStyle(color: Colors.white, fontSize: 23)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    minimumSize: MaterialStateProperty.all(Size(100, 44)),
                  ),
                ),
              )
            ],
          ),
        ]));
  }
}
