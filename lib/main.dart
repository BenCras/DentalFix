import 'package:flutter/material.dart';
import 'home.dart';
import 'dentist.dart';
import 'appointment.dart';
import 'faq.dart';
import 'library.dart' as lib;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DentalFix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: DentalFixApp(),
    );
  }
}

class DentalFixApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              title: Text("DentalFix", style: lib.headText),
              centerTitle: true,
              backgroundColor: Color.fromARGB(255, 255, 177, 59),
            ),
            bottomNavigationBar: TabBar(
                indicatorColor: Color.fromARGB(255, 255, 177, 59),
                labelColor: Color.fromARGB(255, 255, 177, 59),
                tabs: [
                  Tab(icon: Icon(Icons.home), text: "welcome"),
                  Tab(icon: Icon(Icons.face), text: "dentists"),
                  Tab(icon: Icon(Icons.date_range), text: "appointments"),
                  Tab(icon: Icon(Icons.question_answer), text: "FAQ"),
                ]),
            body: TabBarView(
              children: [
                Home(),
                Dentist(),
                Appointment(),
                FAQ(),
              ],
            )));
  }
}
