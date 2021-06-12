import 'package:flutter/material.dart';
import 'package:notepad/pages/create.dart';
import 'package:notepad/pages/home.dart';
import 'package:notepad/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Nav extends StatelessWidget {
  void pushScreen(context, Widget, wName) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Widget),
        ModalRoute.withName("/" + wName));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            curve: Curves.fastOutSlowIn,
            decoration: BoxDecoration(
              color: Colors.indigo[400],
            ),
            child: Text(
              'My Notepad',
              style: TextStyle(
                  color: Colors.white70, fontFamily: 'Courgette', fontSize: 30),
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.home,
                  color: Colors.blueAccent,
                  size: 33,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Home',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 27,
                    fontFamily: 'BebasNeue',
                    fontStyle: FontStyle.normal,
                    letterSpacing: 1,
                    color: Colors.blueAccent,
                  ),
                )
              ],
            ),
            onTap: () {
              pushScreen(context, Home(), 'home');
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.post_add,
                  color: Colors.blueAccent,
                  size: 33,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'New',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 27,
                    fontFamily: 'BebasNeue',
                    fontStyle: FontStyle.normal,
                    letterSpacing: 1,
                    color: Colors.blueAccent,
                  ),
                )
              ],
            ),
            onTap: () {
              pushScreen(context, Create(), 'create');
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.blueAccent,
                  size: 33,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Logout',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 27,
                    fontFamily: 'BebasNeue',
                    fontStyle: FontStyle.normal,
                    letterSpacing: 1,
                    color: Colors.blueAccent,
                  ),
                )
              ],
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              pushScreen(context, Login(), 'login');
            },
          ),
          SizedBox(
            height: 330,
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.blueAccent,
                  size: 33,
                ),
              ],
            ),
            onTap: () {
              var info = AlertDialog(
                title: Text("Info"),
                content: Text(
                  "Created By Saif \n Github : JUSTSAIF \n IG : @qq_iq",
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return info;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
