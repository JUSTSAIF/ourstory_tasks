import 'package:flutter/material.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.blueAccent,
              ),
              title: Text('Home'),
              onTap: () => {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/home", (route) => false)
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box, color: Colors.blueAccent),
              title: Text('Profile'),
              onTap: () => {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/myProfile", (route) => false)
              },
            ),
            ListTile(
              leading: Icon(Icons.menu_book, color: Colors.blueAccent),
              title: Text('Qoutes'),
              onTap: () => {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/quotes", (route) => false)
              },
            ),
          ],
        ),
      ),
    );
  }
}
