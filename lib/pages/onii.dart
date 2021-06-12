import 'package:flutter/material.dart';

class Onii {
  void Alert(String alert, context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text(alert),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop("");
              },
            ),
          ],
        );
      },
    );
  }
}
