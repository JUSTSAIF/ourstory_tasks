import 'package:flutter/material.dart';

Widget FieldChan(String title, TextEditingController _controller,
    {bool isPassword = false, max = 30}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
            maxLength: max,
            controller: _controller,
            obscureText: isPassword,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.grey[200],
                filled: true))
      ],
    ),
  );
}
