import 'package:flutter/material.dart';
import 'package:uitask/pages/login.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox.expand(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(300)),
                  color: Color.fromRGBO(128, 225, 209, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 19,
                    ),
                    Image(
                      image: AssetImage("assets/go.png"),
                      width: 160,
                    ),
                    Container(
                      width: 75,
                      height: 75,
                      margin: EdgeInsets.only(left: 180),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.fromLTRB(80, 0, 19, 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (route) => false);
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Color.fromRGBO(128, 225, 209, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'staatliches',
                            letterSpacing: 3),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          fixedSize: MaterialStateProperty.all(Size(320, 60)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ))),
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/reg', (route) => false);
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
                          fixedSize: MaterialStateProperty.all(Size(320, 60)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      side: BorderSide(
                                          color: Colors.white, width: 2)))),
                    )
                  ],
                ))),
      ),
    );
  }
}
