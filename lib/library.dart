library library;

import 'package:flutter/material.dart';
import 'dart:async';

const double textMarge = 10.0;
const TextStyle basisText =
    TextStyle(fontFamily: 'Verdana', fontSize: 16, color: Colors.white);
const TextStyle headText = TextStyle(
    fontFamily: 'Verdana',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black);
const TextStyle yellowText = TextStyle(
    fontFamily: 'Verdana',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: colorYe);
const colorBl = Color.fromRGBO(33, 33, 33, 1);
const colorYe = Color.fromARGB(255, 255, 180, 60);
ButtonStyle styledButton = ElevatedButton.styleFrom(
  backgroundColor: colorYe,
);

StreamController<bool> startOpnieuw = StreamController.broadcast();
