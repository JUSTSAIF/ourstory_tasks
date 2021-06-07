import 'package:flutter/material.dart';
import 'nav.dart';

class myProfile extends StatefulWidget {
  const myProfile({Key? key}) : super(key: key);

  @override
  _myProfileState createState() => _myProfileState();
}

class _myProfileState extends State<myProfile> {
  int level = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/m3.gif'),
                radius: 55,
              ),
            ),
            Divider(
              color: Colors.indigo[300],
              height: 55,
            ),
            Text(
              "Name",
              style: TextStyle(fontFamily: 'myFav3', color: Colors.white),
            ),
            Text(
              "Saif",
              style: TextStyle(
                  fontFamily: 'myFav1', fontSize: 22, color: Colors.white),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Account Level",
              style: TextStyle(fontFamily: 'myFav3', color: Colors.white),
            ),
            Text(
              "${level}",
              style: TextStyle(
                  fontFamily: 'myFav1', fontSize: 22, color: Colors.white70),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Account Created In",
              style: TextStyle(fontFamily: 'myFav3', color: Colors.white),
            ),
            Text(
              "2021/6/6 1:55 PM",
              style: TextStyle(
                  fontFamily: 'myFav1',
                  fontSize: 18,
                  color: Colors.white,
                  height: 1.5),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("justsaif@ggboy.com",
                    style: TextStyle(
                      fontFamily: 'myFav1',
                      fontSize: 18,
                      color: Colors.white,
                    )),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              level++;
            });
          },
          child: Text('Add')),
    );
  }
}
