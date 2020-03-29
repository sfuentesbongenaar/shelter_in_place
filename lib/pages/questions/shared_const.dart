import 'dart:collection';

import 'package:flutter/material.dart';

class Constants {
  final List<String> feelings = [
    "Happy",
    "Angry",
    "Depressed",
    "Joyful",
    "Surprised",
    "Excited",
    "Sad",
    "Silly",
    "Anxious",
    "Scared",
    "Calm",
    "Distracted"
  ];

  HashMap<String, Color> colorsFeelings() {
    HashMap colorsFeelings = new HashMap<String, Color>();
    colorsFeelings.putIfAbsent(feelings[0], () => Colors.orange);
    colorsFeelings.putIfAbsent(feelings[1], () => Colors.blue);
    colorsFeelings.putIfAbsent(feelings[2], () => Colors.purple);
    colorsFeelings.putIfAbsent(feelings[3], () => Colors.lightBlue);
    colorsFeelings.putIfAbsent(feelings[4], () => Colors.red);
    colorsFeelings.putIfAbsent(feelings[5], () => Colors.pink);
    colorsFeelings.putIfAbsent(feelings[6], () => Colors.blue);
    colorsFeelings.putIfAbsent(feelings[7], () => Colors.purple);
    colorsFeelings.putIfAbsent(feelings[8], () => Colors.blue);
    colorsFeelings.putIfAbsent(feelings[9], () => Colors.green);
    colorsFeelings.putIfAbsent(feelings[10], () => Colors.green);
    colorsFeelings.putIfAbsent(feelings[11], () => Colors.green);
    return colorsFeelings;
  }

  final List<String> activitities = ["tv", "read", "cook"];


}
