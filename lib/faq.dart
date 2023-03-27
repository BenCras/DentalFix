import 'package:flutter/material.dart';
import 'library.dart' as lib;
// import 'package:url_launcher/url_launcher.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(lib.textMarge),
          child: Text(
            "you can ask and read faq here",
            style: lib.basisText,
          ),
        ),
      ],
    );
  }
}
