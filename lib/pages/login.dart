import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color mainColor = Color.fromRGBO(128, 225, 209, 1);
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    setState(() {
      final route = ModalRoute.of(context);
      if (route != null) {
        var data = route.settings.arguments;
        if (data != null) {
          _email.text = (data as Map)["email"].toString();
        }
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    child: ClipOval(
                      child: Material(
                        color: mainColor,
                        child: InkWell(
                          splashColor: Colors.greenAccent,
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/welcome', (route) => false);
                          },
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 27,
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 59,
                      fontFamily: 'staatliches',
                      letterSpacing: 6.8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              child: TextField(
                controller: _email,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: mainColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    size: 30,
                    color: mainColor,
                  ),
                  hintText: 'EMAIL',
                  hintStyle: TextStyle(
                    color: mainColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: mainColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 30,
                    color: mainColor,
                  ),
                  hintText: 'PASSWORD',
                  hintStyle: TextStyle(
                    color: mainColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 19,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false,
                    arguments: {'email': _email.text});
              },
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'staatliches',
                    letterSpacing: 3),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromRGBO(128, 225, 209, 1),
                  ),
                  fixedSize: MaterialStateProperty.all(Size(370, 60)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: BorderSide(color: Colors.white, width: 2)))),
            )
          ],
        ),
      ),
    );
  }
}
