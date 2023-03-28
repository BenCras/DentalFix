import 'dart:convert';
import 'package:flutter/material.dart';
import 'library.dart' as lib;
import 'package:http/http.dart' as http;

class Dentist extends StatefulWidget {
  @override
  _DentistState createState() => _DentistState();
}

class _DentistState extends State<Dentist> {
  String data = "";

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    try {
      var response = await http.get(
          Uri.parse('https://bencras.github.io/jsonHost/data/doctors.json'));
      if (response.statusCode == 200) {
        setState(() {
          data = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(lib.textMarge),
          child: Text(
            data.isEmpty ? "Loading..." : data,
            style: lib.basisText,
          ),
        ),
      ],
    );
  }
}
