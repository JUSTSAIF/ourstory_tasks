import 'package:flutter/material.dart';
import 'package:uitask/pages/login.dart';

class Reg extends StatefulWidget {
  const Reg({Key? key}) : super(key: key);

  @override
  _RegState createState() => _RegState();
}

class _RegState extends State<Reg> {
  Color mainColor = Color.fromRGBO(128, 225, 209, 1);
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: SafeArea(
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
                Image(
                  image: AssetImage("assets/reg.png"),
                  width: 160,
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
                        Icons.person,
                        size: 30,
                        color: mainColor,
                      ),
                      hintText: 'DISPLAY NAME',
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
                    controller: email,
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
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, '/reg', (route) => false);
                    Navigator.pushNamed(context, '/login',
                        arguments: {'email': email.text});
                  },
                  child: Text(
                    "Register",
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
                              side:
                                  BorderSide(color: Colors.white, width: 2)))),
                )
              ],
            ),
          ),
        )));
  }
}
