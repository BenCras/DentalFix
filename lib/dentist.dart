import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'library.dart' as lib;

class Dentist extends StatefulWidget {
  @override
  _DentistState createState() => _DentistState();
}

class _DentistState extends State<Dentist> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    try {
      var response = await http.get(
          Uri.parse('https://bencras.github.io/jsonHost/data/doctors.json'));
      setState(() {
        data = json.decode(response.body);
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CachedNetworkImage(
                    imageUrl: data[index]['image'],
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  Flexible(
                    child: Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 10,
                      children: [
                        Text(
                          data[index]['name'],
                          style: lib.yellowText,
                        ),
                        Text(
                          data[index]['gender'] == "F" ? "Female" : "Male",
                          style: lib.basisText,
                        ),
                        Text(
                          "rating: ${data[index]['rating']}",
                          style: lib.basisText,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            data[index]['motivation'],
                            style: lib.basisText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
