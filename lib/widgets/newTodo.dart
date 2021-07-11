import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo/controllers/todoController.dart';
import 'package:todo/widgets/field.dart';

newTodo() {
  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();
  final tc = Get.find<TodoController>();
  return Get.defaultDialog(
      radius: 1,
      title: "New Todo",
      onConfirm: () => {
            if (title.text.length > 1 && des.text.length > 1)
              {tc.add(title.text, des.text), Get.back()}
            else
              {
                Get.snackbar("Empty Fields", 'Please full the fields !',
                    backgroundColor: HexColor('#EEC868'))
              }
          },
      content: Column(
        children: [
          FieldChan('Title', title),
          FieldChan('Description', des, max: 75)
        ],
      ));
}
