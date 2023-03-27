import 'package:flutter/material.dart';
import 'library.dart' as lib;
// import 'package:url_launcher/url_launcher.dart';

class Dentist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(lib.textMarge),
          child: Text(
            "list with dentists working here",
            style: lib.basisText,
          ),
        ),
      ],
    );
  }
}
