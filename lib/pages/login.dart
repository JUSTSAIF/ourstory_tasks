import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/authController.dart';
import 'package:todo/widgets/ChangeStatusBarColor.dart';
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
  Widget _submitButton() {
    return InkWell(
        onTap: () => {auth.login(email.text, password.text)},
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
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
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xfffbb448), Color(0xfff7892b)])),
          child: Text(
            'Login',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }

  Widget _createAccountLabel() {
    return InkWell(
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
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
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
    );
  }

  // Email & Password Fields Widget
  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        FieldChan("Email", email),
        FieldChan("Password", password, isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                      _emailPasswordWidget(),
                      SizedBox(height: 20),
                      _submitButton(),
                      SizedBox(height: height * .055),
                      _createAccountLabel(),
                      ChangeStatusBarColor(color: Colors.white10)
                    ],
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: backBu()),
            ],
          ),
        ));
  }
}
