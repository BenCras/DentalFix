import 'dart:convert';
import 'package:flutter/material.dart';
import 'library.dart' as lib;
import 'appointment.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  Appointment appointment = Appointment.withDate(DateTime.now());
  final DateFormat formatter = DateFormat('dd-MM-yy');
  List<Map<String, dynamic>> items = [];
  List<String> dentists = [];
  String? dropdownValue;

  Future<void> chooseDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (newDate == null) return;

    setState(() => appointment.date = newDate);
  }

  void _showDialog() {
    if (!appointment.name.isEmpty || !appointment.firstname.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('New Appointment'),
            content: Column(
              children: [
                Text("name: ${appointment.firstname} ${appointment.name}"),
                Text("date: ${formatter.format(appointment.date)}"),
                Text("urgent: ${appointment.isUrgent ? "yes" : "no"}"),
                Text("dentist: ${dropdownValue}"),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Close',
                  style: lib.yellowText,
                ),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Make sure all fields are filled in.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

  void _getData() async {
    try {
      var response = await http.get(
          Uri.parse('https://bencras.github.io/jsonHost/data/doctors.json'));
      if (response.statusCode == 200) {
        var decodedData = json.decode(response.body) as List<dynamic>;
        setState(() {
          items = decodedData.cast<Map<String, dynamic>>();
          dentists = items.map((item) => item['name'] as String).toList();
          dropdownValue = items.first['name'] as String?;
        });
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error while loading data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Column(
              children: [
                Text(
                  "Make an appointment",
                  style: lib.yellowText,
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        onChanged: (String value) {
                          appointment.firstname = value;
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: lib.colorYe),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: lib.colorYe),
                          ),
                          labelText: 'firstname',
                          labelStyle: TextStyle(color: lib.colorYe),
                        ),
                        style: TextStyle(color: lib.colorYe),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        onChanged: (String value) {
                          appointment.name = value;
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: lib.colorYe),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: lib.colorYe),
                          ),
                          labelText: 'name',
                          labelStyle: TextStyle(color: lib.colorYe),
                        ),
                        style: TextStyle(color: lib.colorYe),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      style: lib.styledButton,
                      onPressed: chooseDate,
                      child: const Text(
                        'Select date',
                        style: lib.headText,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      '${formatter.format(appointment.date)}',
                      style: lib.yellowText,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: ListTile(
                          title: const Text(
                            'Trivial',
                            style: lib.yellowText,
                          ),
                          leading: Radio(
                            fillColor: MaterialStateColor.resolveWith(
                              (states) => lib.colorYe,
                            ),
                            focusColor: MaterialStateColor.resolveWith(
                              (states) => lib.colorYe,
                            ),
                            value: false,
                            groupValue: appointment.isUrgent,
                            onChanged: (bool? value) {
                              setState(() {
                                appointment.isUrgent = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          title: const Text(
                            'Urgent',
                            style: lib.yellowText,
                          ),
                          leading: Radio(
                            fillColor: MaterialStateColor.resolveWith(
                              (states) => lib.colorYe,
                            ),
                            focusColor: MaterialStateColor.resolveWith(
                              (states) => lib.colorYe,
                            ),
                            value: true,
                            groupValue: appointment.isUrgent,
                            onChanged: (bool? value) {
                              setState(() {
                                appointment.isUrgent = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dentist:    ", style: lib.yellowText),
                    DropdownButton(
                      value: dropdownValue,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: lib.colorYe,
                      ),
                      dropdownColor: lib.colorBl,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: lib.colorYe,
                      ),
                      elevation: 16,
                      underline: Container(
                        height: 2,
                        color: lib.colorYe,
                      ),
                      items: dentists
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                  style: lib.styledButton,
                  onPressed: _showDialog,
                  child: Icon(
                    Icons.add,
                    color: lib.colorBl,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
