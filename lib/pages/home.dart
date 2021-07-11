import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo/controllers/authController.dart';
import 'package:todo/controllers/todoController.dart';
import 'package:todo/widgets/ChangeStatusBarColor.dart';
import 'package:todo/widgets/newTodo.dart';
import 'package:todo/widgets/todoCard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = Get.find<AuthController>();
  final todo = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: HexColor("#272727"),
          elevation: 0,
          title: Text(
            'ToDO',
            style: TextStyle(color: HexColor('#adabab')),
          ),
          actions: [
            TextButton(
                onPressed: () => Get.offAllNamed('/profile'),
                child: Icon(Icons.person_pin, size: 35, color: Colors.white))
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Container(
                color: HexColor('#121112'),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                        height: 500,
                        margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: StreamBuilder<QuerySnapshot>(
                            stream: todo.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return snapshot.hasError
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Something went wrong !!',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: HexColor('#FF6969')),
                                        ),
                                        TextButton(
                                            onPressed: () => setState(() {}),
                                            child: Icon(
                                              Icons.refresh,
                                              size: 30,
                                              color: HexColor('#FF4141'),
                                            ))
                                      ],
                                    )
                                  : snapshot.connectionState ==
                                          ConnectionState.waiting
                                      ? SpinKitChasingDots(
                                          color: Colors.red,
                                          size: 50.0,
                                        )
                                      : snapshot.data!.docs.length != 0
                                          ? ListView(
                                              children: snapshot.data!.docs.map(
                                                  (QueryDocumentSnapshot
                                                      document) {
                                                return todoCard(
                                                    id: document.id,
                                                    title:
                                                        document.get('title'),
                                                    cDate: document.get('date'),
                                                    checked:
                                                        document.get('check'),
                                                    des: document.get('des'));
                                              }).toList(),
                                            )
                                          : AnimatedTextKit(
                                              repeatForever: true,
                                              animatedTexts: [
                                                WavyAnimatedText(
                                                    'There is no data ! ',
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        letterSpacing: 1)),
                                              ],
                                              isRepeatingAnimation: true,
                                            );
                            },
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    ClipOval(
                      child: Material(
                        color: Colors.black,
                        child: InkWell(
                          onTap: () async {
                            await newTodo();
                            todo.onInit();
                          },
                          splashColor: Colors.grey[900],
                          child: SizedBox(
                              width: 70,
                              height: 70,
                              child: Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                    ChangeStatusBarColor(color: HexColor("#272727"))
                  ],
                )),
          ),
        ));
  }
}
