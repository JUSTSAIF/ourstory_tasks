import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo/widgets/newTodo.dart';
import 'package:todo/widgets/todoCardSlide.dart';
import 'package:intl/intl.dart';
import 'package:todo/controllers/todoController.dart';

Widget todoCard(
    {String id = '',
    bool checked = false,
    String title = '',
    String des = '',
    int cDate = 1626022660}) {
  // Converting Timestamp Date to DateTime String
  String dateTime = DateFormat("MMM d, y h:mm a")
      .format(Timestamp(cDate, 0).toDate())
      .toString();
  final todo = Get.put(TodoController());
  return new Container(
      color: HexColor("#DFDFDF"),
      height: 100,
      margin: EdgeInsets.all(7),
      child: todoCardSlide(
        Row(
          children: [
            Container(
              width: 10,
              color: checked ? HexColor("#8AFF91") : HexColor("#FF6464"),
            ),
            Container(
                width: 240,
                child: Column(
                  children: [
                    textCard(title, 5, 10),
                    textCard(des, 5, 5, fs: 12, fw: FontWeight.normal),
                    textCard(dateTime, 5, 5)
                  ],
                )),
          ],
        ),
        done: () => todo.done(id),
        onDel: () => todo.remove(id),
        unDone: () => todo.inProgress(id),
        onUpdate: () =>
            newTodo(isUpdate: true, tid: id, upDes: des, upTitle: title),
      ));
}

// Text Card Widget With Styling Args
Widget textCard(String txt, double b, double t,
    {FontWeight fw = FontWeight.bold, double fs = 15}) {
  return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(10, t, 0, b),
      child: Text(txt,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: fs,
            fontWeight: fw,
          )));
}
