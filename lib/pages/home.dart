import 'package:flutter/material.dart';
import 'package:notepad/pages/nav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String getUser() {
    var usr = FirebaseAuth.instance.currentUser;
    if (usr != null) {
      return usr.email.toString();
    }
    return "none";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notepad"),
        shadowColor: Colors.black,
        elevation: 100,
        backgroundColor: Colors.grey[600],
      ),
      drawer: Nav(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('data')
            .where('user', isEqualTo: getUser())
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: (snapshot.data as QuerySnapshot).docs.map((document) {
              return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/view', arguments: {
                      'note': document['note'],
                      'title': document['title']
                    });
                  },
                  child: Container(
                      height: 80,
                      child: Card(
                        child: Row(
                          children: [
                            Container(
                              width: 225,
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                document['title'].toString(),
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[850]),
                              ),
                            ),
                            TextButton(
                                style: ButtonStyle(),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/update',
                                      arguments: {
                                        'note': document['note'],
                                        'title': document['title'],
                                        'id': document.id,
                                      });
                                },
                                child: Icon(
                                  Icons.edit,
                                )),
                            TextButton(
                                style: ButtonStyle(),
                                onPressed: () async {
                                  var db = FirebaseFirestore.instance
                                      .collection('data');
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Delete Note"),
                                        content: Text(
                                            "Are you sure you want to delete this note?"),
                                        actions: [
                                          TextButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.red[400])),
                                            child: Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () async {
                                              await db
                                                  .doc(document.id)
                                                  .delete();
                                              Navigator.of(context).pop("");
                                            },
                                          ),
                                          TextButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.grey[800])),
                                            child: Text("Cancel",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            onPressed: () {
                                              Navigator.of(context).pop("");
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.delete,
                                )),
                          ],
                        ),
                        elevation: 10,
                        color: Colors.indigo[100],
                        shadowColor: Colors.indigo[300],
                        margin: EdgeInsets.all(14),
                      )));
            }).toList(),
          );
        },
      ),
    );
  }
}
