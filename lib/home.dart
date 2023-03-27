import 'package:flutter/material.dart';
import 'library.dart' as lib;
// import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(lib.textMarge),
          child: Text(
            "Deze quiz wordt u aangeboden door het Graduaat Programeeren van Thomas More",
            style: lib.basisText,
          ),
        ),
        urlKnop("Website", "https://www.thomasmore.be"),
        urlKnop("Stuur een mail", "mailto:...@thomasmore.be")
      ],
    );
  }

  Widget urlKnop(String tekst, String url) {
    return Container(
      width: 250,
      height: 50,
      margin: EdgeInsets.only(top: 30, left: 30, right: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.blueAccent, width: 2)),
        ),
        child: Text(tekst, style: lib.headText),
        onPressed: () {
          // launchUrl(Uri.parse(url));
        },
      ),
    );
  }
}
