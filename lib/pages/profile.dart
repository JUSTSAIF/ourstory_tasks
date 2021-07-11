import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo/widgets/ChangeStatusBarColor.dart';
import 'package:todo/widgets/backBu.dart';
import 'package:todo/controllers/authController.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();

    return Scaffold(
      body: Column(
        children: <Widget>[
          ChangeStatusBarColor(color: Colors.white10),
          SizedBox(
            height: 25,
          ),
          backBu(page: '/home'),
          SizedBox(
            height: 75,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/profile.gif',
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Name : ${auth.user?.displayName}',
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Email : ${auth.user?.email}',
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        auth.logout();
                      },
                      splashColor: HexColor('#FF0000'),
                      child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset('assets/logout.jpg')),
                    ),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
