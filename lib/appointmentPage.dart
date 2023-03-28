import 'package:flutter/material.dart';
import 'library.dart' as lib;
import 'appointment.dart';
import 'package:intl/intl.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  Appointment appointment = Appointment.withDate(DateTime.now());
  final DateFormat formatter = DateFormat('dd-MM-yy');

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: lib.colorYe),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: lib.colorYe),
                            ),
                            labelText: 'firstname',
                            labelStyle: TextStyle(color: lib.colorYe)),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: lib.colorYe),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: lib.colorYe),
                            ),
                            labelText: 'name',
                            labelStyle: TextStyle(color: lib.colorYe)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: lib.styledButton,
                      onPressed: chooseDate,
                      child: const Text(
                        'Select date',
                        style: lib.headText,
                      ),
                    ),
                    Text(
                      '${formatter.format(appointment.date)}',
                      style: lib.yellowText,
                    ),
                  ],
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
                            value: false,
                            groupValue: appointment.isUrgent,
                            onChanged: (bool? value) {
                              setState(() {
                                appointment.isUrgent = false;
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
                                (states) => Colors.green),
                            focusColor: MaterialStateColor.resolveWith(
                                (states) => Colors.green),
                            value: true,
                            groupValue: appointment.isUrgent,
                            onChanged: (bool? value) {
                              setState(() {
                                appointment.isUrgent = true;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
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
