import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'onii.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        context, '/login', (route) => false);
                  },
                  child: Text(
                    "Have Account ?",
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
                          .createUserWithEmailAndPassword(
                              email: email.text, password: password.text);
                      print(userCredential.user);
                      Navigator.pushNamed(context, '/login', arguments: {
                        "email": email.text,
                        "passowrd": password.text
                      });
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        Onii().Alert(
                            'The password provided is too weak.', context);
                      } else if (e.code == 'email-already-in-use') {
                        Onii().Alert(
                            'The account already exists for that email.',
                            context);
                      } else if (e.code == 'invalid-email') {
                        Onii().Alert('Invalid Email Address .', context);
                      } else {
                        Onii().Alert(e.code, context);
                      }
                    } catch (e) {
                      Onii().Alert(
                          'something went wrong please try again', context);
                      // print(e);
                    }
                  }
                },
                child: Text(
                  'Register',
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
