import 'package:flutter/material.dart';
import 'package:native_eindopdracht/widgets/maps.dart';
import 'library.dart' as lib;
import 'widgets/maps.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool maps = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(bottom: 50.0),
      children: <Widget>[
        Image.asset(
          "images/dentalFix.png",
          color: lib.colorYe,
          scale: 0.75,
        ),
        Container(
          margin: EdgeInsets.all(lib.textMarge),
          child: Text(
            "Welcome to DentalFix!\n\n"
            "We are committed to providing our patients with exceptional dental care in a warm and welcoming environment."
            "Our team of highly trained professionals is dedicated to helping you achieve and maintain a healthy, beautiful smile."
            "From routine cleanings to complex restorative procedures, we offer a wide range of services to meet all of your dental needs."
            "We understand that visiting the dentist can be stressful for some, so we strive to make your experience as comfortable and stress-free as possible."
            "Thank you for choosing us as your dental care provider, and we look forward to serving you and your family for years to come.\n\n"
            "Located at:\n"
            "Jan Pieter de Nayerlaan 5,\n"
            "2860 Sint-Katelijne-Waver",
            style: lib.basisText,
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            urlKnop("Website", "https://github.com/BenCras/DentalFix"),
            Container(
              width: 170,
              height: 40,
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              child: ElevatedButton(
                style: lib.styledButton,
                child: const Text(
                  "Show map",
                  style: lib.headText,
                ),
                onPressed: () {
                  setState(() {
                    maps = !maps;
                  });
                },
              ),
            ),
          ],
        ),
        // GoogleMaps(),
        const SizedBox(
          height: 50,
        ),
        maps
            ? Image.asset(
                "images/maps.jpg",
                width: MediaQuery.of(context).size.width,
              )
            : const SizedBox(
                height: 20,
              ),
      ],
    );
  }

  Widget urlKnop(String tekst, String url) {
    return Container(
      width: 170,
      height: 40,
      margin: EdgeInsets.only(top: 30, left: 30, right: 30),
      child: ElevatedButton(
        style: lib.styledButton,
        child: Text(tekst, style: lib.headText),
        onPressed: () {
          launchUrl(Uri.parse(url));
        },
      ),
    );
  }
}
