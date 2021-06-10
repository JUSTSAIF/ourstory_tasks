import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task01/objects/quote.dart';
import 'dart:convert';
import 'package:task01/objects/quotesList.dart';

class getQuotes {
  // set
  var data;
  Future<void> set() async {
    http.Response response = await http
        .get(Uri.http("api.quotable.io", '/quotes', {"maxLength": "40"}));
    var _data = json.decode(response.body);
    data = _data;
  }
}
