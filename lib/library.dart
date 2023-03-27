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

StreamController<bool> startOpnieuw = StreamController.broadcast();
