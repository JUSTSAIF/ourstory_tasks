import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/authController.dart';
import 'package:todo/pages/loading.dart';
import 'package:todo/widgets/backBu.dart';
import 'package:todo/widgets/field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final auth = Get.find<AuthController>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              height: height,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // (0w0) ===> Logo
                          SizedBox(height: height * .2),
                          Text(
                            'ToDo-Chan',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffe46b10),
                            ),
                          ),
                          SizedBox(height: 50),
                          // (0w0) ===> Email & Password Fields Widget
                          Column(
                            children: <Widget>[
                              FieldChan("Email", email),
                              FieldChan("Password", password, isPassword: true),
                            ],
                          ),
                          SizedBox(height: 20),
                          // (0w0) ===> Submit Button
                          InkWell(
                              onTap: () async {
                                setState(() {
                                  loading = true;
                                });
                                await Future.delayed(Duration(seconds: 1));
                                await auth.login(email.text, password.text);
                                setState(() {
                                  loading = false;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          offset: Offset(2, 4),
                                          blurRadius: 5,
                                          spreadRadius: 2)
                                    ],
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xfffbb448),
                                          Color(0xfff7892b)
                                        ])),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              )),
                          SizedBox(height: height * .055),
                          // (0w0) ===> Go To Create New Account Widget
                          InkWell(
                            onTap: () {
                              Get.toNamed('/register');
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              padding: EdgeInsets.all(15),
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Don\'t have an account ?',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Color(0xfff79c4f),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // (0w0) ===> Back Button
                  Positioned(top: 40, left: 0, child: backBu()),
                ],
              ),
            ));
  }
}
