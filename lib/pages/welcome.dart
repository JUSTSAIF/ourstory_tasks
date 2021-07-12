import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfffbb448), Color(0xffe46b10)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "ToDo-Chan",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 80,
              ),
              // (0w0) :: Button => Go To Login
              InkWell(
                onTap: () => Get.offAllNamed('/login'),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color(0xffdf8e33).withAlpha(100),
                            offset: Offset(2, 4),
                            blurRadius: 8,
                            spreadRadius: 2)
                      ],
                      color: Colors.white),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // (0w0) :: Button => Go To Create New Account
              InkWell(
                onTap: () => Get.offAllNamed('/register'),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Text(
                    'Register now',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
