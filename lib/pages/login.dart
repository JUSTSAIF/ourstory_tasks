import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notepad/pages/onii.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  void checkLogin() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    checkLogin();
    setState(() {
      final route = ModalRoute.of(context);
      if (route != null) {
        var data = route.settings.arguments;
        if (data != null) {
          email.text = (data as Map)["email"].toString();
          password.text = (data as Map)["password"].toString();
        }
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              Text(
                "Notepad",
                style: TextStyle(
                    fontSize: 39,
                    fontFamily: 'BebasNeue',
                    letterSpacing: 10,
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: TextFormField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/reg', (route) => false);
                  },
                  child: Text(
                    "don't have account ?",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(140, 50))),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                              email: email.text, password: password.text);
                      checkLogin();
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        Onii().Alert('No user found for that email.', context);
                      } else if (e.code == 'wrong-password') {
                        Onii().Alert(
                            'Wrong password provided for that user.', context);
                      } else if (e.code == 'invalid-email') {
                        Onii().Alert('Invalid Email Address .', context);
                      } else {
                        Onii().Alert(
                            'something went wrong please try again', context);
                      }
                    }
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
