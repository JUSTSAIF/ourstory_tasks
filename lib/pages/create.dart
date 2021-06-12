import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notepad/pages/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  TextEditingController title = new TextEditingController();
  TextEditingController note = new TextEditingController();
  void addNote() async {
    var usr = FirebaseAuth.instance.currentUser;
    if (usr != null) {
      if (note.text.isNotEmpty || title.text.isNotEmpty) {
        WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp();
        FirebaseFirestore.instance.collection('data').add({
          'title': title.text,
          'note': note.text,
          'user': usr.email,
        });
        Navigator.pushNamed(context, '/home');
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Alert"),
              content: Text("The note cannot be empty !!"),
              actions: [
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop("");
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("New Note"),
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
                  onPressed: () {
                    addNote();
                  },
                  child: Text("Save",
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
