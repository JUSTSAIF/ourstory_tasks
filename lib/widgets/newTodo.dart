import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo/controllers/todoController.dart';
import 'package:todo/widgets/field.dart';

newTodo(
    {bool isUpdate = false,
    String tid = '',
    String upTitle = '',
    String upDes = ''}) {
  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();
  isUpdate ? title.text = upTitle : title.text;
  isUpdate ? des.text = upDes : des.text;
  title.obs;
  des.obs;
  final tc = Get.find<TodoController>();
  return Get.defaultDialog(
      radius: 1,
      title: "New Todo",
      onConfirm: () => {
            print('title.text'),
            if (title.text.length > 1 && des.text.length > 1)
              {
                if (isUpdate)
                  {
                    {tc.updateTodo(tid, title.text, des.text), Get.back()}
                  }
                else
                  {tc.add(title.text, des.text), Get.back()}
              }
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
