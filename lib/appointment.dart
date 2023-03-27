import 'package:flutter/material.dart';
import 'library.dart' as lib;
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Appointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(lib.textMarge),
          child: Text(
            "You can make appointments here",
            style: lib.basisText,
          ),
        ),
      ],
    );
  }
}
